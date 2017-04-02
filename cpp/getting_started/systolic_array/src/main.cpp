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

/*******************************************************************************

Description:

    This is a matrix multiplication which showcases the "Systolic Array" based
    algorithm design. Systolic array type of implementation is well suited for
    FPGAs. It is a good coding practice to convert base algorithm into Systolic
    Array implementation if it is feasible to do so.

*******************************************************************************/

#include <iostream>
#include <cstring>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#include "mmult.h"
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

// Software implementation of Matrix Multiplication
// The inputs are of the size (DATA_SIZE x DATA_SIZE)
void m_softwareGold(
                    int *in1,   //Input Matrix 1
                    int *in2,   //Input Matrix 2
                    int *out    //Output Matrix
                   )
{
    //Perform Matrix multiply Out = In1 x In2
    for(int i = 0; i < DATA_SIZE; i++) {
        for(int j = 0; j < DATA_SIZE; j++) {
            for(int k = 0; k < DATA_SIZE; k++) {
                out[i * DATA_SIZE + j] += in1[i * DATA_SIZE + k] * in2[k * DATA_SIZE 
                                                                      + j];
            }
        }
    }
}

int main(int argc, char** argv)
{
    //Allocate Memory in Host Memory
    if (DATA_SIZE > MAX_SIZE) {
        std::cout << "Size is bigger than internal buffer size, please use a size ";
        std::cout << "smaller than " << MAX_SIZE << "!" << std::endl;
        return -1;
    }

    size_t matrix_size_bytes = sizeof(int) * DATA_SIZE * DATA_SIZE;

    // Allocate PL buffers using sds_alloc
    int *source_in1         = (int *) sds_alloc(matrix_size_bytes);
    int *source_in2         = (int *) sds_alloc(matrix_size_bytes);
    int *source_hw_results  = (int *) sds_alloc(matrix_size_bytes);

    // Allocate software output buffer
    int *source_sw_results  = (int *) malloc(matrix_size_bytes);

    // Create the test data and Software Result
    for(int i = 0 ; i < DATA_SIZE * DATA_SIZE ; i++){
        source_in1[i] = i % 10;
        source_in2[i] = i % 10;
        source_sw_results[i] = 0;
        source_hw_results[i] = 0;
    }

    int a_row = DATA_SIZE;
    int a_col = DATA_SIZE;
    int b_col = DATA_SIZE;

    perf_counter hw_ctr, sw_ctr;

    hw_ctr.start();
    //Launch the Hardware Solution
    mmult_accel(source_in1, source_in2, source_hw_results, a_row, a_col, b_col);
    hw_ctr.stop();

    sw_ctr.start();
    //Launch the Software Solution
    m_softwareGold(source_in1, source_in2, source_sw_results);
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
    std::cout << "best coding practice related to accelerator structure in "; 
    std::cout << "Programmable Logic."<< std::endl;
    std::cout << "\tSpeed up comparison between software solution doesn't";
    std::cout << " matter" << std::endl;
    std::cout << "\n"; 
   
    // Compare the results of the Device to the simulation
    int match = 0;
    for (int i = 0 ; i < DATA_SIZE * DATA_SIZE ; i++){
        if (source_hw_results[i] != source_sw_results[i]){
            std::cout << "Error: Result mismatch" << std::endl;
            std::cout << "i = " << i << " CPU result = " << source_sw_results[i]
                << " Device result = " << source_hw_results[i] << std::endl;
            match = 1;
            break;
        }
    }

    /* Release Memory from Host Memory*/
    sds_free(source_in1);
    sds_free(source_in2);
    sds_free(source_hw_results);
    free(source_sw_results);

    if (match){
        std::cout << "TEST FAILED." << std::endl;
        return -1;
    }
    std::cout << "TEST PASSED." << std::endl;
    return 0;
}
