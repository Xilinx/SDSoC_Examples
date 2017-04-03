/*
# (c) Copyright 2013 - 2016 Xilinx, Inc. All rights reserved.
#
# This file contains confidential and proprietary information of Xilinx, Inc. and
# is protected under U.S. and international copyright and other intellectual
# property laws.
# 
# DISCLAIMER 
# This disclaimer is not a license and does not grant any rights to the materials
# distributed herewith. Except as otherwise provided in a valid license issued to
# you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE
# MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY
# DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
# INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR
# FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether
# in contract or tort, including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature related to, arising
# under or in connection with these materials, including for any direct, or any
# indirect, special, incidental, or consequential loss or damage (including loss
# of data, profits, goodwill, or any type of loss or damage suffered as a result
# of any action brought by a third party) even if such damage or loss was
# reasonably foreseeable or Xilinx had been advised of the possibility of the
# same.
#
# CRITICAL APPLICATIONS
# Xilinx products are not designed or intended to be fail-safe, or for use in any
# application requiring fail-safe performance, such as life-support or safety
# devices or systems, Class III medical devices, nuclear facilities, applications
# related to the deployment of airbags, or any other applications that could lead
# to death, personal injury, or severe property or environmental damage
# (individually and collectively, "Critical Applications").Customer assumes the
# sole risk and liability of any use of Xilinx products in Critical Applications,
# subject only to applicable laws and regulations governing limitations on product
# liability.
#
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT
# ALL TIMES.
*/

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
