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
Description: SDx Vector Addition to utilize both Ports of BRAM memory
*******************************************************************************/
#include <iostream>
#include <cstring>
#include <cstdlib>
#include <stdint.h>

// SDS library for memory management
#include "sds_lib.h"

#include "vadd.h"

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

void vadd_sw(unsigned int *source_in1, unsigned int *source_in2, unsigned int *out, 
            int size)
{
	for(int i = 0; i < size; i++){
		out[i] = source_in1[i] + source_in2[i];
	}
}

int main(int argc, char** argv)
{
    //Allocate Memory in Host Memory
    size_t vector_size_bytes = sizeof(unsigned int) * DATA_SIZE;

    // Allocate PL buffers using sds_alloc
    unsigned int *source_in1         = (unsigned int *) sds_alloc(vector_size_bytes);
    unsigned int *source_in2         = (unsigned int *) sds_alloc(vector_size_bytes);
    unsigned int *source_hw_results  = (unsigned int *) sds_alloc(vector_size_bytes);

    // Allocate software output buffer
    unsigned int *source_sw_results  = (unsigned int *) malloc(vector_size_bytes);

    // Create the test data and Software Result
    for(int i = 0 ; i < DATA_SIZE ; i++){
        source_in1[i] = i;
        source_in2[i] = i * i;
        source_sw_results[i] = 0; //i * i + i;
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
    
    // Compare the results of the Device to the simulation
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

    /* Release Memory from Host Memory*/
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
