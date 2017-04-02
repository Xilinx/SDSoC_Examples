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
#include <cstring>
#include <stdio.h>
#include <math.h>
#include <stdint.h>
#include "row_array_2d.h"
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


//Utility to print array
void print_array(DTYPE *mat, const char *name, int size, int dim) {
    int i;
    printf("%s\n", name);
    for (i=0;i<size;i++) {
      printf("%d ",mat[i]);
      if (((i+1) % dim) == 0)
        printf("\n");
    }
}
void row_array_2d_sw(DTYPE *a, DTYPE *sw_c, DTYPE alpha)
{
	for(int i = 0; i < BLOCK_SIZE; i++)
		sw_c[i] = alpha * a[i];
}

int main(int argc, char** argv)
{

    //Allocate Memory in Host Memory
    size_t vector_size_bytes = sizeof(DTYPE) * BLOCK_SIZE;
    // original data set given to device
    DTYPE* a = (DTYPE*)sds_alloc(vector_size_bytes);
    // results returned from device
    DTYPE* c = (DTYPE*)sds_alloc(vector_size_bytes);
    // results returned from software 
    DTYPE* sw_c = (DTYPE*)malloc(vector_size_bytes);

    // Create the test data and Software Result
    DTYPE alpha = 3;
    for(int i = 0; i < BLOCK_SIZE; i++) {
      a[i] = i;
      c[i] = 0;
      sw_c[i] = 0; //alpha*a[i];
    }

    perf_counter hw_ctr, sw_ctr;

    hw_ctr.start();
    //Launch the Hardware Solution
    row_array_2d_accel(a, c, alpha);
    hw_ctr.stop();

    sw_ctr.start();
    //Launch the Software Solution
    row_array_2d_sw(a, sw_c, alpha);
    sw_ctr.stop();

    uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
    double speedup = (double) sw_cycles / (double) hw_cycles;

    std::cout << "Average number of CPU cycles running mmult in software: "
			 << sw_cycles << std::endl;
    std::cout << "Average number of CPU cycles running mmult in hardware: "
				 << hw_cycles << std::endl;
    std::cout << "Speed up: " << speedup << std::endl;

    std::cout << "\n";
    std::cout << "Note : This example is intended to introduce developers to ";
    std::cout << "best coding practice of memory transfers between DDR and "; 
    std::cout << "Programmable Logic."<< std::endl;
    std::cout << "\tSpeed up comparison with software solution doesn't";
    std::cout << " matter" << std::endl;
    std::cout << "\n";  

    // Validate
    unsigned int correct = 0;              // number of correct results returned
    for (int i = 0;i < BLOCK_SIZE; i++) {
      if(c[i] == sw_c[i]) {
        correct++;
      } else {
        printf("\n wrong sw %d hw %d index %d \n", sw_c[i], c[i], i);
      }
    }

    // Print a brief summary detailing the results
    printf("Computed '%d/%d' correct values!\n", correct, BLOCK_SIZE);

    sds_free(a);
    sds_free(c);
    free(sw_c);

    if(correct == BLOCK_SIZE){
        std::cout << "TEST PASSED." << std::endl;
        return EXIT_SUCCESS;
    }
    else{
        std::cout << "TEST FAILED." << std::endl;
        return EXIT_FAILURE;
    }
}
