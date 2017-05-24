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


/******************************************************************************

    This is a simple vector addition based example which showcases loop 
    pipelining feature of SDx tool chain.

******************************************************************************/



#include <iostream>
#include <cstdio>
#include <stdlib.h>
#include "vector_addition.h"

const int DATA_SIZE = 1<<10;

// Compare software and hardware solutions
int verify(int *gold, int *out) {
    for(int i = 0; i < DATA_SIZE; i++){
        if(gold[i] != out[i]){
            std::cout<< "Results: CPU " << gold[i] << " Device" << out[i] << std::endl;
            return 1;
        }
  }
  return 0;
}

// Software solution
void vadd(int *a, int *b, int *c, int len){

    vadd_loop:
    for (int x=0; x<len; ++x) {
        c[x] = a[x] + b[x];
    }
}

int main(int argc, char** argv)
{

    int test_passed = 0;

    // Create PL buffers using sds_alloc  
    int *source_a = (int *) sds_alloc(sizeof(int) * DATA_SIZE);
    int *source_b = (int *) sds_alloc(sizeof(int) * DATA_SIZE);
    int *source_results = (int *) sds_alloc(sizeof(int) * DATA_SIZE);

    // Software output buffer
    int *gold = (int *)malloc(sizeof(int) * DATA_SIZE);
    
    sds_utils::perf_counter hw_ctr;

    //Launch the Software Solution
    vadd(source_a, source_b, gold, DATA_SIZE);

    hw_ctr.start();
    //Launch the Hardware Solution
    vadd_pipelined_accel(source_a, source_b, source_results, DATA_SIZE);
    hw_ctr.stop();
    
    test_passed = verify(gold, source_results);

    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();

    std::cout << "Average number of CPU cycles running vadd in hardware: "
				 << hw_cycles << std::endl;
   
    sds_free(source_a);
    sds_free(source_b);
    sds_free(source_results);
    free(gold);

    std::cout << "TEST " << (test_passed ? "FAILED" : "PASSED") << std::endl;

    return (test_passed ? -1 : 0);
}
