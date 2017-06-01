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

/*******************************************************************************

    Vector Addition using struct datatype of 128bit wide to utilize full
    memory data width

    Note : This example is to demonstrate Wide Memory access of 128 bit data width  
           using struct datatype. 128bit is the highest width supported by Zynq 
           Ultrascale boards. 

*******************************************************************************/
#include <iostream>
#include <cstring>
#include "vadd.h"

// Software solution
void vadd_sw(int *in1, int *in2, int *out, int size)
{
	for(int i = 0; i < size ; i++)
		out[i] = in1[i] + in2[i];
}

int main(int argc, char** argv)
{
    // Size of the input data
    int size = DATA_SIZE;
    size_t vector_size_bytes = sizeof(int) * size;

    // Allocate buffers using sds_alloc
    int *source_in1         = (int *) sds_alloc(vector_size_bytes);
    int *source_in2         = (int *) sds_alloc(vector_size_bytes);
    int *source_hw_results  = (int *) sds_alloc(vector_size_bytes);
    int *source_sw_results  = (int *) sds_alloc(vector_size_bytes);

    // Create the test data
    for(int i = 0 ; i < size; i++){
        source_in1[i] = rand();
        source_in2[i] = rand();
        source_sw_results[i] = 0; 
        source_hw_results[i] = 0;
    }


    sds_utils::perf_counter hw_ctr, sw_ctr;

    hw_ctr.start();

    //Type-Casting int* datatype to wide_dt * as Hardware Function expect 
    //pointers to Wide DataType 
    // Launch Hardware Solution
    vadd_accel( (wide_dt *)source_in1, 
                (wide_dt *)source_in2, 
                (wide_dt *)source_sw_results, 
                size/NUM_ELEMENTS //changing size to number of wide_dt
                );
    hw_ctr.stop();

    // Launch Software Solution
    vadd_sw(source_in1, source_in2, source_hw_results, size);

    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();

    std::cout << "Average number of CPU cycles running mmult in hardware: "
    			  << hw_cycles << std::endl;

    // Compare the results of software and hardware
    int match = 0;
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
    sds_free(source_in1);
    sds_free(source_in2);
    sds_free(source_hw_results);
    sds_free(source_sw_results);

    std::cout << "TEST " << (match? "FAILED":"PASSED") << std::endl;
    return (match?-1:0);
}
