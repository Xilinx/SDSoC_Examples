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

    SDx Vector Addition to utilize both Ports of BRAM memory

*******************************************************************************/
#include <iostream>
#include <cstring>
#include <cstdlib>
#include "vadd.h"

using namespace sds_prof;

// Software Solution
void vadd_sw(unsigned int *source_in1, unsigned int *source_in2, unsigned int *out, 
            int size)
{
	for(int i = 0; i < size; i++){
		out[i] = source_in1[i] + source_in2[i];
	}
}

int main(int argc, char** argv)
{
    // Size of input data
    size_t vector_size_bytes = sizeof(unsigned int) * DATA_SIZE;

    // Allocate PL buffers using sds_alloc
    unsigned int *source_in1         = (unsigned int *) sds_alloc(vector_size_bytes);
    unsigned int *source_in2         = (unsigned int *) sds_alloc(vector_size_bytes);
    unsigned int *source_hw_results  = (unsigned int *) sds_alloc(vector_size_bytes);

    // Allocate software output buffer
    unsigned int *source_sw_results  = (unsigned int *) malloc(vector_size_bytes);

    // Create the test data 
    for(int i = 0 ; i < DATA_SIZE ; i++){
        source_in1[i] = i;
        source_in2[i] = i * i;
        source_sw_results[i] = 0; 
        source_hw_results[i] = 0;
    }

    perf_counter hw_ctr, sw_ctr;

    int size = DATA_SIZE;

    //Launch the Software Solution
    vadd_sw(source_in1,source_in2,source_sw_results, size);

    hw_ctr.start();
    //Launch the Hardware Solution
    vadd_accel(source_in1,source_in2, source_hw_results,size);
    hw_ctr.stop();

    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();

    std::cout << "Average number of CPU cycles running mmult in hardware: "
				 << hw_cycles << std::endl;
    
    // Compare the results between PL and Simulation
    int match = 0;
    for (int i = 0 ; i < DATA_SIZE ; i++){
        if (source_hw_results[i] != source_sw_results[i]){
            std::cout << "Error: Result mismatch" << std::endl;
            std::cout << "i = " << i << " CPU result = " << source_sw_results[i]
                << " Device result = " << source_hw_results[i] << std::endl;
            match = 1;
            break;
        }
    }

    // Release Memory
    sds_free(source_in1);
    sds_free(source_in2);
    sds_free(source_hw_results);
    free(source_sw_results);

    if (match){
        std::cout << "TEST FAILED" << std::endl;
        return 1;
    }
    std::cout << "TEST PASSED" << std::endl;
    return 0;
}
