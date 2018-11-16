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
    
    This is simple matrix multiplication example which showcases how to create
    multiple hardware instances of a hardware function for better performance.

*******************************************************************************/

#include <iostream>
#include <stdlib.h>
#include "mmult.h"
#include "sds_utils.h"

#ifndef NUM_TIMES
#define NUM_TIMES 2  
#endif

void mmult_sw( int *in1,   // Input matrix 1
               int *in2,   // Input matrix 2
               int *out,   // Output matrix (out = A x B)
               int dim     // Matrix size of one dimension
             )
{
    //Performs matrix multiplication out = in1 x in2
    for (int i = 0; i < dim; i++){
        for (int j = 0; j < dim; j++){
            for (int k = 0; k < dim; k++){
                out[i * dim + j] += in1[i * dim + k] * in2[k * dim  + j];
            }
        }
    }
}

int main(int argc, char **argv) {

    const int dim = SIZE;

    //Allocate memory:
    int *in1           = (int *) sds_alloc(sizeof(int) * dim * dim);
    int *in2           = (int *) sds_alloc(sizeof(int) * dim * dim);
    int *in3           = (int *) sds_alloc(sizeof(int) * dim * dim);
    int *in4           = (int *) sds_alloc(sizeof(int) * dim * dim);
    int *hw_results_1  = (int *) sds_alloc(sizeof(int) * dim * dim);
    int *hw_results_2  = (int *) sds_alloc(sizeof(int) * dim * dim);
    int *sw_results_1  = (int *) malloc(sizeof(int) * dim * dim);
    int *sw_results_2  = (int *) malloc(sizeof(int) * dim * dim);

    // Check for failed memory allocation
    if((in1 == NULL) || (in2 == NULL) || (in3 == NULL) || (in4 == NULL) || (hw_results_1 == NULL) || (hw_results_2 == NULL) || (sw_results_1 == NULL) || (sw_results_2 == NULL)){
        std::cout << "TEST FAILED : Failed to allocate memory" << std::endl;
        return -1;
    }

    sds_utils::perf_counter seq_hw_ctr, par_hw_ctr;
    bool match = true;

    for (int i = 0; i < NUM_TIMES ; i++)
    {
        //Create test data
        for (int i = 0; i < dim * dim; i++) {
            in1[i] = rand() % dim;
            in2[i] = rand() % dim;
            in3[i] = rand() % dim;
            in4[i] = rand() % dim;
            sw_results_1[i] = 0;
            sw_results_2[i] = 0;
            hw_results_1[i] = 0;
            hw_results_2[i] = 0;
        }

        seq_hw_ctr.start();
        //Launch the sequential hardware solution
        //Second call to the hw function will be made 
        //after the first call to that hw function has
        //finished execution.
        mmult_accel (in1, in2, hw_results_1);
        mmult_accel (in3, in4, hw_results_2);
        seq_hw_ctr.stop();

        //We want to perform two matrix multiplications, so we create two
        //separate instances of the same hardware function on the PL by
        //using the pragma SDS resource (ID). Now, the two calls to the
        //same accelerator function can be processed concurrently instead
        //of waiting for the first call to finish execution before processing
        //the second call to that hw function.
        par_hw_ctr.start();
        //Launch the parallel hardware solution
        //The two calls to the same hw function can
        //be processed simultaneously in this case.
        #pragma SDS resource (1)
        mmult_accel (in1, in2, hw_results_1);
        #pragma SDS resource (2)
        mmult_accel (in3, in4, hw_results_2);
        par_hw_ctr.stop();

        //Launch software solution
        mmult_sw (in1, in2, sw_results_1, dim);
        mmult_sw (in3, in4, sw_results_2, dim);

        //Compare the results of hardware to the CPU   
        for(int i=0; i< dim * dim; i++)
        {
	        if( sw_results_1[i] != hw_results_1[i] )
	        {
                std::cout << "Results Mismatch in solution 1 on " << "Row:" << i/dim << "Col:" << i - (i/dim)*dim << std::endl;
	            std::cout << "CPU output:" << sw_results_1[i] <<"\t Hardware output:" << hw_results_1[i] << std::endl;
	            match = false;
	            break;
	        }
	        
            if( sw_results_2[i] != hw_results_2[i] )
	        {
                std::cout << "Results Mismatch in solution 2 on " << "Row:" << i/dim << "Col:" << i - (i/dim)*dim << std::endl;
	            std::cout << "CPU output:" << sw_results_1[i] <<"\t Hardware output:" << hw_results_1[i] << std::endl;
	            match = false;
	            break;
	        }
        }
    }

    uint64_t seq_hw_cycles = seq_hw_ctr.avg_cpu_cycles();
    uint64_t par_hw_cycles = par_hw_ctr.avg_cpu_cycles();
    double speedup = (double) seq_hw_cycles / (double) par_hw_cycles;

    std::cout << "Number of CPU cycles running application in hardware with a single instance:" << seq_hw_cycles << std::endl;
    std::cout << "Number of CPU cycles running application in hardware with two instances:" << par_hw_cycles << std::endl;
    std::cout << "Speed up: " << speedup << std::endl;
    std::cout << "Note: Speed up is meaningful for real hardware execution only, not for emulation." << std::endl;

    //Release Memory
    sds_free(in1);
    sds_free(in2);
    sds_free(in3);
    sds_free(in4);
    sds_free(hw_results_1);
    sds_free(hw_results_2);
    free(sw_results_1);
    free(sw_results_2);

    std::cout << " TEST " << (match? "PASSED": "FAILED") << std::endl;
    return(match? EXIT_SUCCESS: EXIT_FAILURE);
}
