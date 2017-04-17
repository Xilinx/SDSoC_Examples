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
#include <cstdio>
#include <stdlib.h>
#include "vector_addition.h"
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

const int DATA_SIZE = 1<<10;

int verify(const int *gold, const int *out) {
    for(int i = 0; i < DATA_SIZE; i++){
        if(gold[i] != out[i]){
            return 1;
        }
  }
  return 0;
}

void vadd(int *a, int *b, int *c, int len){

    vadd_loop:
    for (int x=0; x<len; ++x) {
        c[x] = a[x] + b[x];
    }
}

int main(int argc, char** argv)
{

    int test_passed = 0;
    // compute the size of array in bytes
    int size_in_bytes = DATA_SIZE * sizeof(int);

    // Creates a vector of DATA_SIZE elements with an initial value of 10 and 32
    int *source_a = (int *) sds_alloc(sizeof(int) * DATA_SIZE);
    int *source_b = (int *) sds_alloc(sizeof(int) * DATA_SIZE);
    int *source_results = (int *) sds_alloc(sizeof(int) * DATA_SIZE);

    int *gold = (int *)malloc(sizeof(int) * DATA_SIZE);
    
    perf_counter hw_ctr, sw_ctr;

    //Launch the Software Solution
    vadd(source_a, source_b, gold, DATA_SIZE);

    hw_ctr.start();
    //Launch the Hardware Solution
    vadd_pipelined_accel(source_a, source_b, source_results, DATA_SIZE);
    hw_ctr.stop();
    
    test_passed = verify(gold, source_results);

    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();

    std::cout << "Average number of CPU cycles running mmult in hardware: "
				 << hw_cycles << std::endl;
   
    sds_free(source_a);
    sds_free(source_b);
    sds_free(source_results);
    free(gold);

    std::cout << "TEST " << (test_passed ? "FAILED" : "PASSED") << std::endl;

    return (test_passed ? -1 : 0);
}
