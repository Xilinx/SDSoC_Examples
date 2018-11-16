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
#include <cstring>
#include <stdlib.h>
#include "mmult.h"
#include "sds_utils.h"

#ifndef NUM_TIMES
#define NUM_TIMES 2  
#endif

// Software Implementation
void mmult_sw(int *a, int *b, int *c, int dim)
{
  for (int row = 0; row < dim; row++) {
    for (int col = 0; col < dim; col++) {
      int result = 0;
      for (int k = 0; k < dim; k++) {
        result += a[row*dim + k] * b[k*dim + col];
      }
      c[row*dim + col] = result;
    }
  }
}

int main(int argc, char** argv)
{
    int dim = TEST_MATRIX_DIM;
    int matrix_size = dim * dim;

    if (dim > MAX_MATRIX_DIM) {
        std::cout << "Test Matrix Dimension is bigger than"
           << " supported by Accelerator, please use smaller"  
           << " than " << MAX_MATRIX_DIM << "\n";
        return EXIT_FAILURE;
    }

    size_t matrix_size_in_bytes = sizeof(int) * matrix_size;

    // Allocate buffers using sds_alloc
    int *input_a     = (int *) sds_alloc(matrix_size_in_bytes);
    int *input_b     = (int *) sds_alloc(matrix_size_in_bytes);
    int *hw_results  = (int *) sds_alloc(matrix_size_in_bytes);

    // Allocate software output buffer
    int *sw_results  = (int *) malloc(matrix_size_in_bytes);

    if((input_a == NULL) || (input_b == NULL) 
            || (hw_results == NULL) || (sw_results == NULL)){
        std::cout << "TEST FAILED: Failed to allocate memory" << std::endl;
        return -1;
    }

    sds_utils::perf_counter hw_ctr, sw_ctr;
    bool match = true;

    for (int i = 0; i < NUM_TIMES; i++)
    {
        // Create the test data and Software Result
        for(int i = 0 ; i < matrix_size ; i++){
            input_a[i] = i;
            input_b[i] = i;
            hw_results[i] = 0;
            sw_results[i] = 0;
        }

        sw_ctr.start();
        // Launch the software solution
        mmult_sw(input_a, input_b, sw_results, dim);
        sw_ctr.stop();

        hw_ctr.start();
        // Launch the hardware solution
        mmult_accel(input_a, input_b, hw_results, dim);
        hw_ctr.stop();

        // Compare the results of the Hardware to the simulation
        for (int i = 0 ; i < matrix_size ; i++){
            if (hw_results[i] != sw_results[i]){
                std::cout << "Error: Result mismatch" << std::endl;
                std::cout << "i = " << i << " CPU result = " << sw_results[i]
                        << " Hardware result = " << hw_results[i] << std::endl;
                match = false;
                break;
            }
        }
    }

    uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
    
    double speedup = (double) sw_cycles / (double) hw_cycles;

    std::cout << "Number of CPU cycles running application in software: "
                  << sw_cycles << std::endl;
    std::cout << "Number of CPU cycles running application in hardware: "
                  << hw_cycles << std::endl;
    std::cout << "Speedup: " << speedup << std::endl;
    std::cout << "Note: Speed up is meaningful for real hardware execution only, not for emulation." << std::endl;
    
    // Release Memory  
    sds_free(input_a);
    sds_free(input_b);
    sds_free(hw_results);
    free(sw_results);

    std::cout << "TEST " << (match? "PASSED." : "FAILED.") << "\n";
    return(match ? 0 : -1);
}
