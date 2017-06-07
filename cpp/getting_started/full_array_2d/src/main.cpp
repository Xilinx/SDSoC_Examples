/*********** 
# Copyright (c) 2017, Xilinx, Inc. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without 
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
# 
# 3. Neither the name of the copyright holder nor the names of its contributors
# may be used to endorse or promote products derived from this software
# without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.
#
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY 
# DIRECT, INDIRECT,INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO,PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# 
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY,OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT 
# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
************/

#include <iostream>
#include <cstring>
#include <stdlib.h>
#include "mmult.h"

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
    int *source_input_a     = (int *) sds_alloc(matrix_size_in_bytes);
    int *source_input_b     = (int *) sds_alloc(matrix_size_in_bytes);
    int *source_hw_results  = (int *) sds_alloc(matrix_size_in_bytes);

    // Allocate software output buffer
    int *source_sw_results  = (int *) malloc(matrix_size_in_bytes);

    // Create the test data and Software Result
    for(int i = 0 ; i < matrix_size ; i++){
        source_input_a[i] = i;
        source_input_b[i] = i;
        source_hw_results[i] = 0;
        source_sw_results[i] = 0;
    }

    sds_utils::perf_counter hw_ctr, sw_ctr;

    // Launch the software solution
    mmult_sw(source_input_a, source_input_b, source_sw_results, dim);

    hw_ctr.start();
    // Launch the hardware solution
    mmult_accel(source_input_a, source_input_b, source_hw_results, dim);
    hw_ctr.stop();

    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();

    std::cout << "Number of CPU cycles running application in hardware: "
                  << hw_cycles << std::endl;
   
    // Compare the results of the Hardware to the simulation
    int match = 0;
    for (int i = 0 ; i < matrix_size ; i++){
        if (source_hw_results[i] != source_sw_results[i]){
            std::cout << "Error: Result mismatch" << std::endl;
            std::cout << "i = " << i << " CPU result = " << source_sw_results[i]
                << " Hardware result = " << source_hw_results[i] << std::endl;
            match = 1;
            break;
        }
    }

    // Release Memory  
    sds_free(source_input_a);
    sds_free(source_input_b);
    sds_free(source_hw_results);
    free(source_sw_results);

    std::cout << "TEST " << (match? "FAILED." :"PASSED.") << "\n";
    return(match?-1:0);
}
