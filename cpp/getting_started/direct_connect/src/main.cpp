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

/*******************************************************************************

    This is an example which showcases effectiveness of direct connection
    which helps in achieving increasing system parallelism and concurrency.

*******************************************************************************/
#include <iostream>
#include <cstring>
#include <stdlib.h>
#include "mmult.h"
#include "sds_utils.h"

// Software implementation of Matrix Multiplication and then Matrix Addition
// The inputs are of the size (DATA_SIZE x DATA_SIZE)
void m_softwareGold(
                    int *in1,   //Input Matrix 1
                    int *in2,   //Input Matrix 2
                    int *in3,   //Input Matrix 3
                    int *out,    //Output Matrix
                    int dim
                   )
{
    //Perform Matrix multiply Out = In1 x In2
    for(int i = 0; i < dim; i++) {
        for(int j = 0; j < dim; j++) {
            for(int k = 0; k < dim; k++) {
                out[i * dim + j] += in1[i * dim + k] * in2[k * 
                                          dim + j];
            }
        }
    }
    //Perform Matrix addition Out = Out + In3
    for(int res = 0; res < dim * dim; res++)
        out[res] = out[res] + in3[res];
}

int main(int argc, char** argv)
{

    if(DATA_SIZE > MAX_SIZE) {
        std::cout << "Size is bigger than internal buffer size, please use a size"; 
        std::cout << " smaller than " << MAX_SIZE << "!" << std::endl;
        return 1;
    }

    // Size of the matrix
    size_t matrix_size_bytes = sizeof(int) * DATA_SIZE * DATA_SIZE;

    // Allocate buffers using sds_alloc
    int *source_in1         = (int *) sds_alloc(matrix_size_bytes);
    int *source_in2         = (int *) sds_alloc(matrix_size_bytes);
    int *source_in3         = (int *) sds_alloc(matrix_size_bytes);
    int *source_mmult_out   = (int *) sds_alloc(matrix_size_bytes);
    int *source_hw_results  = (int *) sds_alloc(matrix_size_bytes);

    // Allocate software output buffer
    int *source_sw_results  = (int *) malloc(matrix_size_bytes);

    // Check for failed memory allocation
    if((source_in1 == NULL) || (source_in2 == NULL) || (source_in3 == NULL) || (source_hw_results == NULL) || (source_sw_results == NULL) ||
       (source_mmult_out == NULL)){
        std::cout << "TEST FAILED : Failed to allocate memory" << std::endl;
        return -1;
    }

    int size = DATA_SIZE;

    sds_utils::perf_counter hw_ctr, sw_ctr;
    
    bool match = true;

    for(int itr = 0; itr < MAX_NUM_TIMES; itr++){
        // Create the test data 
        for(int i = 0 ; i < DATA_SIZE * DATA_SIZE ; i++){
            source_in1[i] = rand();
            source_in2[i] = rand();
            source_in3[i] = rand();
            source_mmult_out[i] = 0;
            source_sw_results[i] = 0;
            source_hw_results[i] = 0;
        }

        //Two hw functions are called back to back. Output of 1st 
        //hardware function source_mmult_out is input to 2nd hw function.
        //For such case, SDx will make a direct connection between the 
        //hw accelerators to directly pass source_mmult_out result to
        //improve the overall performance.
        
        hw_ctr.start();
        // Launch Hardware Solution 
        mmult_accel(source_in1, source_in2, source_mmult_out, size);
        madd_accel(source_mmult_out, source_in3, source_hw_results, size);
        hw_ctr.stop();

        sw_ctr.start();
        // Launch Software Solution
        m_softwareGold(source_in1, source_in2, source_in3, source_sw_results, size);
        sw_ctr.stop();

        // Compare the results 
        for(int i = 0 ; i < DATA_SIZE * DATA_SIZE ; i++){
            if(source_hw_results[i] != source_sw_results[i]){
                std::cout << "Error: Result mismatch" << std::endl;
                std::cout << "i = " << i << " CPU result = " << source_sw_results[i]
                    << " Hardware result = " << source_hw_results[i] << std::endl;
                match = false;
                break;
            }
        }
    }
    uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
    double speedup = (double) sw_cycles / (double) hw_cycles;

    std::cout << "Number of average CPU cycles running application in software: "
                << sw_cycles << std::endl;
    std::cout << "Number of average CPU cycles running application in hardware: "
                << hw_cycles << std::endl;
    std::cout << "Speed up: " << speedup << std::endl;
    std::cout << "Note: Speed up is meaningful for real hardware execution only, not for emulation." << std::endl;

    // Release memory
    sds_free(source_in1);
    sds_free(source_in2);
    sds_free(source_in3);
    sds_free(source_hw_results);
    free(source_sw_results);

    std::cout << "TEST " << ((match) ? "PASSED" : "FAILED") << std::endl;
    return (match ? 0 : 1);
}
