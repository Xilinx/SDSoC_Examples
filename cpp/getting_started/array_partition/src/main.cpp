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


/******************************************************************************
 
    Description :

        This is simple matrix multiplication example to showcase effectiveness
        of using array partition feature of SDx.
 
*******************************************************************************/

#include <iostream>
#include <stdint.h>
#include <cstdio>
#include <stdlib.h>
#include "matmul.h"
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

// Software Matrix Multiplication 
void matmul(int *C, int *A, int *B, int M) {
    for (int k = 0; k < M; k++) {
        for (int j = 0; j < M; j++) {
            for (int i = 0; i < M; i++) {
                C[k * M + j] += A[k * M + i] * B[i * M + j];
            }
        }
    }
}

// Verify Software and Hardware Results
int verify(int *gold, int *output, int size) {
    for (int i = 0; i < size; i++) {
        if (output[i] != gold[i]) {
            printf("Mismatch %d: gold: %d device: %d\n", i, gold[i], output[i]);
            return -1;
        }
    }
    
    return 0;
}

int main(int argc, char **argv) {

    int test_passed = 0;
    static const int columns = 64;
    static const int rows = 64;

    // Allocate PL buffers using sds_alloc
    int *A    = (int *) sds_alloc(sizeof(int) * columns * rows);
    int *B    = (int *) sds_alloc(sizeof(int) * columns * rows);
    int *C    = (int *) sds_alloc(sizeof(int) * columns * rows);
    
    // Allocate output buffer for software solution
    int *gold = (int *) malloc(sizeof(int) * columns * rows);

    // Data Initialization
    for(int i = 0; i < columns * rows; i++) {
        A[i] = i;
        B[i] = i + i;
        gold[i] = 0;
        C[i] = 0;
    }

    perf_counter hw_ctr, sw_ctr;

    sw_ctr.start();
    //Launch the Software Solution
    matmul(gold, A, B, columns);
    sw_ctr.stop();

    hw_ctr.start();
    //Launch the Hardware Solution
    matmul_partition_accel(A, B, C, columns); 
    hw_ctr.stop();

    // Compare the results of the Device to the simulation
    test_passed = verify(gold, C, columns * rows);
    
    uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
    double speedup = (double) sw_cycles / (double) hw_cycles;

    std::cout << "Average number of CPU cycles running mmult in software: "
			 << sw_cycles << std::endl;
    std::cout << "Average number of CPU cycles running mmult in hardware: "
				 << hw_cycles << std::endl;
    std::cout << "Speed up: " << speedup << std::endl;
    
    sds_free(A);
    sds_free(B);
    sds_free(C);
    free(gold);
    
    std::cout << "TEST " << (test_passed ? "FAILED" : "PASSED") << std::endl; 
    return (test_passed ? -1 : 0);
}
