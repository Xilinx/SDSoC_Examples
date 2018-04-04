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

/******************************************************************************
    
    This is simple matrix multiplication example to showcase effectiveness
    of using array partition feature of SDSoC.

*******************************************************************************/

#include <iostream>
#include <cstdio>
#include <stdlib.h>
#include "matmul.h"
#include "sds_utils.h"

// Software Matrix Multiplication 
void matmul(int *C, int *A, int *B, int M) {
    for (int k = 0; k < M; k++) {
        for (int j = 0; j < M; j++) {
            for (int i = 0; i < M; i++) {
                C[k * M + j] += A[k * M + i] * B[i * M + j];
            }
        }
    }
}

// Verify Software and Hardware Results
bool verify(int *gold, int *output, int size) {
    for (int i = 0; i < size; i++) {
        if (output[i] != gold[i]) {
            printf("Mismatch %d: gold: %d hardware: %d\n", i, gold[i], output[i]);
            return false;
        }
    }
    return true;
}

int main(int argc, char **argv) {

    bool test_passed;
    static const int columns = MAX_SIZE;
    static const int rows = MAX_SIZE;

    // Allocate buffers using sds_alloc
    int *A    = (int *) sds_alloc(sizeof(int) * columns * rows);
    int *B    = (int *) sds_alloc(sizeof(int) * columns * rows);
    int *C    = (int *) sds_alloc(sizeof(int) * columns * rows);
    
    // Allocate output buffer for software solution
    int *gold = (int *) malloc(sizeof(int) * columns * rows);

    // Check for failed memory allocation
    if((A == NULL) || (B == NULL) || (C == NULL) || (gold == NULL)){
        std::cout << "TEST FAILED : Failed to allocate memory" << std::endl;
        return -1;
    }

    // Data Initialization
    for(int i = 0; i < columns * rows; ++i) {
        A[i] = i;
        B[i] = i + i;
        gold[i] = 0;
        C[i] = 0;
    }

    sds_utils::perf_counter hw_ctr, sw_ctr;

    sw_ctr.start();
    //Launch the Software Solution
    matmul(gold, A, B, columns);
    sw_ctr.stop();

    hw_ctr.start();
    //Launch the Hardware Solution
    matmul_partition_accel(A, B, C, columns); 
    hw_ctr.stop();

    // Compare the results of hardware to the simulation
    test_passed = verify(gold, C, columns * rows);
    
    uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
    double speedup = (double) sw_cycles / (double) hw_cycles;

    std::cout << "Number of CPU cycles running application in software: "
                << sw_cycles << std::endl;
    std::cout << "Number of CPU cycles running application in hardware: "
                << hw_cycles << std::endl;
    std::cout << "Speed up: " << speedup << std::endl;
    std::cout << "Note: Speed up is meaningful for real hardware execution only, not for emulation." << std::endl;
    
    sds_free(A);
    sds_free(B);
    sds_free(C);
    free(gold);
    
    std::cout << "TEST " << (test_passed ? "PASSED" : "FAILED") << std::endl; 
    return (test_passed ? 0 : -1);
}
