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

/*****************************************************************************
    
    This is a simple vector addition example to demonstrate SDSoC "sys_port"
    feature. SDSoC provides "sys_port" pragma to choose a particular port for
    memory transactions between PL and PS. 

    Note : If no sys_port pragma is specified for an array argument,
    the interface to external memory is determined automatically by the SDSoC
    system compilers, based on array memory attributes (cacheble or non-cacheble)
    , array size, data mover used, etc. This pragma overrides the SDSoC compiler
    choice of memory port. This pragma supports three different ports 
    
            1. ACP - Cache Coherent 
            2. AFI - Non-cache Coherent
            3. MIG (valid for zc706_mem)

******************************************************************************/

#include <iostream>
#include <cstring>
#include <stdlib.h>
#include "vadd.h"

// Golden implementation
void vadd_golden(int a[DATA_SIZE], 
                 int b[DATA_SIZE],   
                 int output[DATA_SIZE],
                 int size)
{
        for(int i = 0; i < size; i++) {
            output[i] = a[i] + b [i]; 
        }

}

int main(int argc, char** argv)
{
    int size = DATA_SIZE;
   
    // Size of the Input Data
    size_t vector_size_bytes = sizeof(int) * size;
    
    // Allocate buffers using sds_alloc_non_cacheble
    // Memory is allocated using non-cached form to comply with "sys_port"
    // pragma AFI port selection.  
    int *source_input1       = (int *) sds_alloc_non_cacheable(vector_size_bytes);
    int *source_input2       = (int *) sds_alloc_non_cacheable(vector_size_bytes);
    int *source_hw_results   = (int *) sds_alloc_non_cacheable(vector_size_bytes);

    // Allocate Software Output Buffer
    int *source_sw_results  = (int *) malloc(vector_size_bytes);

    // Create the test data
    for(int i = 0 ; i < size ; i++){
        source_input1[i] = i;
        source_input2[i] = i;
        source_sw_results[i] = 0;
        source_hw_results[i] = 0;
    }

    sds_utils::perf_counter hw_ctr, sw_ctr;

    hw_ctr.start();
    //Launch the Hardware Solution
    vadd_accel(source_input1, source_input2, source_hw_results, size);
    hw_ctr.stop();

    //Launch the Software Solution
    vadd_golden(source_input1, source_input2, source_sw_results, size);

    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
    std::cout << "Average number of CPU cycles running mmult in hardware: "
              << hw_cycles << std::endl;
    
    // Compare the results of the Hardware to the simulation
    int match = 0;
    for (int i = 0 ; i < size ; i++){
        if (source_hw_results[i] != source_sw_results[i]){
            std::cout << "Error: Result mismatch" << std::endl;
            std::cout << "i = " << i << " CPU result = " << source_sw_results[i]
                << " Hardware result = " << source_hw_results[i] << std::endl;
            match = 1;
            break;
        }else{
            std::cout << source_hw_results[i] << " " ;
            if ( ( (i+1) % 16) == 0) std::cout << std::endl;
        }
    }

    // Release Memory 
    sds_free(source_input1);
    sds_free(source_input2);
    sds_free(source_hw_results);
    free(source_sw_results);

    if (match){
        std::cout << "TEST FAILED." << std::endl;
        return -1;
    }
    std::cout << "All Hardware results match CPU results! " << std::endl;
    std::cout << "TEST PASSED." << std::endl;
    return 0;
}
