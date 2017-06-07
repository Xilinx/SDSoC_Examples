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
#include <cstdlib>
#include "mean_value.h"

void mean_value(int in[], int out[], int n)
{
    out[0] = ( in[0] + in[1] ) / 2;
    for (int i = 1 ; i < n-1 ; i++)
    {
        out[i] = (in[i-1] + in[i] + in[i+1]) / 3;
    }
    out[n-1] = (in[n-1] + in [n -2] )/ 2;
}

int main(int argc, char** argv)
{
    int size = DATA_SIZE;
    // Size of vector
    size_t vector_size_bytes = sizeof(int) * size;

    // Allocate Input and Output Buffers
    // sds_alloc must be used to allocate memory for buffers
    int *source_input       = (int *) sds_alloc(vector_size_bytes);
    int *source_hw_results  = (int *) sds_alloc(vector_size_bytes);
    
    // Allocate memory for buffer
    int *source_sw_results  = (int *) malloc(vector_size_bytes);

    // Create the test data and Software Result
    for(int i = 0 ; i < size ; i++){
        source_input[i] = rand() % size;
        source_sw_results[i] = source_input[i];
        source_hw_results[i] = 0;
    }
    sds_utils::perf_counter hw_ctr;

    mean_value(source_input,source_sw_results, size);


    hw_ctr.start();
    // Launch the Accelerator
    mean_value_accel(source_input, source_hw_results, size);
    hw_ctr.stop();

    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();

    std::cout << "Number of CPU cycles running application in hardware: "
				  << hw_cycles << std::endl;
   
    // Compare the results of the Hardware to the simulation
    int match = 0;
    std::cout << "Result = " << std::endl;
    for (int i = 0 ; i < size; i++){
        if (source_hw_results[i] != source_sw_results[i]){
            std::cout << "Error: Result mismatch" << std::endl;
            std::cout << "i = " << i << " CPU result = " << source_sw_results[i]
                << " Hardware result = " << source_hw_results[i] << std::endl;
            match = 1;
            break;
        }
    }

    // Release Memory 
    sds_free(source_input);
    sds_free(source_hw_results);
    free(source_sw_results);

    if (match){
        std::cout << "TEST FAILED." << std::endl;
        return 1;
    }
    std::cout << "TEST PASSED." << std::endl;
    return 0;
}
