/**********
Copyright (c) 2018, Xilinx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**********/

#include <iostream>
#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>
#include "sds_lib.h"
#include "mmult_accel.h"
#include "sds_utils.h"

#ifndef NUM_TIMES
#define NUM_TIMES 10  
#endif


struct thread_args
{
        float *A;
        float *B;
        float *C;
};
static void init_arrays(float *A,  float *B, float *C_sw,float *CT_sw, float *C_hw,float *CT_hw)
{
      for (int i = 0; i < N; i++) {
          for (int j = 0; j < N; j++) {
               A[i * N + j] = 1+i*N+j;
               B[i * N + j] = rand() % (N * N);
               C_sw[i * N + j] = 0.0;
               CT_sw[i * N + j] = 0.0;
               C_hw[i * N + j] = 0.0;
               CT_hw[i * N + j] = 0.0;
          }
     }
}

void mmult_golden(float *A,  float *B, float *C)
{
     for (int row = 0; row < N; row++) {
          for (int col = 0; col < N; col++) {
               float result = 0.0;
               for (int k = 0; k < N; k++) {
                    result += A[row*N+k] * B[k*N+col];
               }
               C[row*N+col] = result;
          }
     }
}

bool result_check(float *C, float *C_sw)
{
     for (int i = 0; i < N * N; i++) {
          if (C_sw[i] != C[i]) {
               std::cout << "Mismatch: data index=" << i << "d=" << C_sw[i] 
                         << ", dout=" << C[i] << std::endl;
               return true;
          }
     }
     return false;
}
void *hw_thrd_func1(void *ptr)
{
        thread_args *data = (thread_args *)ptr;
        std::cout << "thread1 started "<< std::endl;
        std::cout << "A1*B1 Running "<< std::endl;
        #pragma SDS resource(1)
        mmult_accel(data->A ,data->B ,data->C);
        return NULL;
}
void *hw_thrd_func2(void *ptr)
{
        thread_args *data = (thread_args *)ptr;
        std::cout << "thread2 started "<< std::endl;
        std::cout << "A2*B2 Running "<< std::endl;
        #pragma SDS resource(2)
        mmult_accel(data->A ,data->B ,data->C);
        return NULL;
}
void *sw_thrd_func1(void *ptr)
{
        thread_args *data = (thread_args *)ptr;
        std::cout << "sw thread1 started "<< std::endl;
        std::cout << "A1*B1 Running "<< std::endl;
        mmult_golden(data->A ,data->B ,data->C);
        return NULL;
}
void *sw_thrd_func2(void *ptr)
{
        thread_args *data = (thread_args *)ptr;
        std::cout << "sw thread2 started "<< std::endl;
        std::cout << "A2*B2 Running "<< std::endl;
        mmult_golden(data->A ,data->B ,data->C);
        return NULL;
}

bool mmult_test(float *A1,  float *B1, float *C1_sw, float *C1_hw ,float *A2,  float *B2, float *C2_sw, float *C2_hw , float *C3, float *C4,float *C5 ,float *C6)
{
     std::cout << "Testing " << NUM_TIMES << " iterations of " << N << "x" << N 
               << " floating point mmult..." << std::endl;

     sds_utils::perf_counter hw_ctr, sw_ctr ,sw_ctr_nt,hw_ctr_nt;
     
     for (int i = 0; i < NUM_TIMES; i++) 
     {
          init_arrays(A1, B1, C1_sw,C3, C1_hw,C4);
          init_arrays(A2, B2, C2_sw,C5 ,C2_hw,C6);
          
          //Software Functions running without threads 
          sw_ctr_nt.start();
          mmult_golden(A1, B1, C1_sw);
          mmult_golden(A2, B2, C2_sw);
          sw_ctr_nt.stop();

          pthread_t s1,s2;
          thread_args sdata1 = {A1,B1,C3};
          thread_args sdata2 = {A2,B2,C5};

          //Software Functions running with threads
          sw_ctr.start();
          pthread_create(&s1, NULL, sw_thrd_func1, &sdata1);
          pthread_create(&s2, NULL, sw_thrd_func2, &sdata2);
          pthread_join(s1, NULL);
          pthread_join(s2, NULL);
          sw_ctr.stop();

          //Hardware Functions running without threads
          hw_ctr_nt.start();
          #pragma SDS resource(3)
          mmult_accel(A1, B1, C1_hw);
          #pragma SDS resource(3)
          mmult_accel(A2, B2, C2_hw);
          hw_ctr_nt.stop();

          pthread_t t1,t2;
          thread_args data1 = {A1,B1,C4};
          thread_args data2 = {A2,B2,C6};

          //Hardware Functions running with threads 
          hw_ctr.start();
          pthread_create(&t1, NULL, hw_thrd_func1, &data1);
          pthread_create(&t2, NULL, hw_thrd_func2, &data2);
          pthread_join(t1, NULL);
          pthread_join(t2, NULL);
          hw_ctr.stop();

          if (result_check(C1_hw, C1_sw)){
          std::cout << "C1 result mismatch b/w hw and sw fail" << std::endl;
          return false;
          }

          if (result_check(C2_hw, C2_sw)){
          std::cout << "C2 result mismatch b/w hw and sw fail" << std::endl;
          return false;
          }
          if (result_check(C3, C4)){
          std::cout << "C1 result mismatch b/w hw and sw  threads fail" << std::endl;
          return false;
          }
          if (result_check(C5, C6)){
          std::cout << "C2 result mismatch b/w hw and sw threads fail" << std::endl;
          return false;
          }

     }
     uint64_t sw_nt_cycles = sw_ctr_nt.avg_cpu_cycles();
     uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
     uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
     uint64_t hw_nt_cycles = hw_ctr_nt.avg_cpu_cycles();

     double speedup_thrd_sw = (double) sw_cycles / (double) hw_cycles;
     double speedup_hw_sw = (double) sw_nt_cycles / (double) hw_nt_cycles;

     std::cout << "Average number of CPU cycles running mmult in software: "
               << sw_nt_cycles << std::endl;
     std::cout << "Average number of CPU cycles running mmult in software with two threads: "
               << sw_cycles << std::endl;
     std::cout << "Average number of CPU cycles running mmult in hardware : "
                 << hw_nt_cycles << std::endl;
     std::cout << "Average number of CPU cycles running mmult in hardware with two threads: "
               << hw_cycles << std::endl;
     std::cout << "Note: Speed up is meaningful for real hardware execution only, not for emulation." << std::endl;


     std::cout << "Hardware Speed up with thread: " << speedup_thrd_sw << std::endl;
     std::cout << "Hardware Speed up without threads: "   << speedup_hw_sw << std::endl;

     return true;
}


//  Design principles to achieve performance
// 
//  1. sds_alloc to guarantee physically contiguous buffer allocation
//     that enables the most efficient DMA configuration (axidma_simple)

int main(int argc, char* argv[]){
     bool test_passed = 0;
     float *A1, *B1, *C1_sw, *C1,*A2, *B2, *C2_sw, *C2, *C3, *C4, *C5, *C6;

     A1    = (float *)sds_alloc(N * N * sizeof(float));
     B1    = (float *)sds_alloc(N * N * sizeof(float));
     C1    = (float *)sds_alloc(N * N * sizeof(float));
     C1_sw = (float *)sds_alloc(N * N * sizeof(float));
     A2    = (float *)sds_alloc(N * N * sizeof(float));
     B2    = (float *)sds_alloc(N * N * sizeof(float));
     C2    = (float *)sds_alloc(N * N * sizeof(float));
     C2_sw = (float *)sds_alloc(N * N * sizeof(float));
     C3    = (float *)sds_alloc(N * N * sizeof(float));
     C4    = (float *)sds_alloc(N * N * sizeof(float));
     C5    = (float *)sds_alloc(N * N * sizeof(float));
     C6    = (float *)sds_alloc(N * N * sizeof(float));



     
     if (!A1 || !B1 || !C1 || !C1_sw) {
          if (A1) sds_free(A1);
          if (B1) sds_free(B1);
          if (C1) sds_free(C1);
          if (C1_sw) sds_free(C1_sw);
          return 2;
     }
     if (!A2 || !B2 || !C2 || !C2_sw) {
            if (A2) sds_free(A2);
            if (B2) sds_free(B2);
            if (C2) sds_free(C2);
            if (C2_sw) sds_free(C2_sw);
            return 2;
       }

     test_passed = mmult_test(A1, B1, C1_sw, C1,A2, B2, C2_sw, C2,C3,C4,C5,C6);
     

     std::cout << "TEST " << (test_passed ? "PASSED" : "FAILED") << std::endl;

     sds_free(A1);
     sds_free(B1);
     sds_free(C1);
     sds_free(C1_sw);

     sds_free(A2);
     sds_free(B2);
     sds_free(C2);
     sds_free(C2_sw);


     sds_free(C3);
     sds_free(C4);
     sds_free(C5);
     sds_free(C6);
     return(test_passed ? EXIT_SUCCESS: EXIT_FAILURE);
}

