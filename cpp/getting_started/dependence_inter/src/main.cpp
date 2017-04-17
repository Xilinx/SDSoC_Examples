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
#include <stdint.h>
// Mean Value header
#include "mean_value.h"

// SDS library for memory management
#include "sds_lib.h"

class perf_counter
{
public:
	uint64_t tot, cnt, calls;
	perf_counter() : tot(0), cnt(0), calls(0) {};
	inline void reset() { tot = cnt = calls = 0; }
	inline void start() { cnt = sds_clock_counter(); calls++; };
	inline void stop() { tot += (sds_clock_counter() - cnt); };
	inline uint64_t avg_cpu_cycles() {return (tot / calls); };
};


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
    //Allocate Memory in Host Memory
    size_t vector_size_bytes = sizeof(int) * DATA_SIZE;


    // Allocate Input and Output Buffers
    // sds_alloc must be used to allocate memory for PL buffers
    int *source_input       = (int *) sds_alloc(vector_size_bytes);
    int *source_hw_results  = (int *) sds_alloc(vector_size_bytes);
    
    // Allocate memory for PS buffer
    int *source_sw_results  = (int *) malloc(vector_size_bytes);

    // Create the test data and Software Result
    for(int i = 0 ; i < DATA_SIZE ; i++){
        source_input[i] = rand() % DATA_SIZE;
        source_sw_results[i] = source_input[i];
        source_hw_results[i] = 0;
    }
    perf_counter hw_ctr;

    mean_value(source_input,source_sw_results, DATA_SIZE);

    int size = DATA_SIZE;

    hw_ctr.start();
    // Launch the Accelerator
    mean_value_accel(source_input, source_hw_results, size);
    hw_ctr.stop();

    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();

    std::cout << "Average number of CPU cycles running mmult in hardware: "
				  << hw_cycles << std::endl;
   
    // Compare the results of the Device to the simulation
    int match = 0;
    std::cout << "Result = " << std::endl;
    for (int i = 0 ; i < DATA_SIZE ; i++){
        if (source_hw_results[i] != source_sw_results[i]){
            std::cout << "Error: Result mismatch" << std::endl;
            std::cout << "i = " << i << " CPU result = " << source_sw_results[i]
                << " Device result = " << source_hw_results[i] << std::endl;
            match = 1;
            break;
        }else{
            std::cout << source_hw_results[i] << " " ;
            if ( ( (i+1) % 16) == 0) std::cout << std::endl;
        }
    }

    /* Release Memory from Host Memory*/
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
