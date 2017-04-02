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

    This is a nearest neighbor of a point example showcases how making a loop
    nest perfect or semi-perfect can help improve performance.

*******************************************************************************/

#include <iostream>
#include <cstring>
#include <stdint.h>
#include <stdlib.h>
#include <climits>
#include <stdio.h>

#include "sds_lib.h"

#include "nearest.h"

// Maximum possible distance between two points
#define INFINITY ULONG_MAX

#define SQUARE(x) ((x)*(x))

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

// Software implementation for finding nearest neighbor
void nearest_sw(
				    int *in,      // Input Points Array - represented as integer
				    int *point,   // Current Point for which the neighbor is found
				    int *out,     // Output Point
				    int size,     // Size of the input array
				    int dim       // #Dimensions of the points
			    )
{
    unsigned long curr_dist, min_dist = INFINITY;

    for(int i = 0; i < size; i++) {
        curr_dist = 0;

        // Calculate distance
        // No need to compute square root as the distances are only compared
        for(int j = 0; j < dim; j++) {
            curr_dist += SQUARE(point[j] - in[i*dim + j]);
        }

        // Update minimum distance
        if(curr_dist < min_dist) {

            min_dist = curr_dist;

            for(int k = 0; k < dim; k++) {
                out[k] = in[i*dim + k];
            }
        }
    }
}

int main(int argc, char** argv)
{
    if (DATA_DIM > MAX_DIM) {
        std::cout << DATA_DIM << "greater than " << MAX_DIM << "!"<< " Please use a"; 
        std::cout << "smaller DATA_DIM" << std::endl;
        return EXIT_FAILURE;
    }

    if (DATA_SIZE > MAX_SIZE) {
        std::cout << DATA_SIZE << "greater than " << MAX_SIZE << "!"<< " Please use"; 
        std::cout << "a smaller DATA_SIZE" << std::endl;
        return EXIT_FAILURE;
    }

    //Allocate Memory in Host Memory
    size_t vector_size_bytes = sizeof(int) * DATA_SIZE * DATA_DIM;

    int *source_in  =       (int*) sds_alloc(vector_size_bytes);
    int *source_point =     (int*) sds_alloc(sizeof(int)*DATA_DIM);
    int *source_hw_result = (int*) sds_alloc(sizeof(int)*DATA_DIM);
    int *source_sw_result = (int*) sds_alloc(sizeof(int)*DATA_DIM);

    // Create the test data
    for(int i = 0 ; i < DATA_SIZE*DATA_DIM; i++){
        source_in[i] = rand()%100;
    }

    for(int i = 0 ; i < DATA_DIM; i++){
        source_point[i] = rand()%100;
    }

    int size = DATA_SIZE;
    int dim = DATA_DIM;

    perf_counter hw_ctr, sw_ctr;

    hw_ctr.start();
    // Launch Hardware Solution
    nearest_accel(source_in, source_point, source_hw_result, size, dim);
    hw_ctr.stop();

    sw_ctr.start();
    // Launch Software Solution
    nearest_sw(source_in, source_point, source_sw_result, size, dim);
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
    std::cout << "\tSpeed up comparison between Software Solution doesn't";
    std::cout << " matter" << std::endl;
    std::cout << "\n"; 
   
    // Compare the nearset distances between software and hardware
    unsigned long dist_sw = 0, dist_hw = 0;
    for(int i = 0; i < dim; i++) {
        dist_sw += SQUARE(source_sw_result[i] - source_point[i]);
        dist_hw += SQUARE(source_sw_result[i] - source_point[i]);
    }

    /* Release Memory from Host Memory*/
    sds_free(source_in);
    sds_free(source_point);
    sds_free(source_hw_result);
    sds_free(source_sw_result);

    if(dist_sw != dist_hw)
    {
        std::cout << "TEST FAILED." << std::endl;
        std::cout << "\tSoftware Min Dist = " << dist_sw << std::endl;
        std::cout << "\tHardware Min Dist = " << dist_hw << std::endl;
        return -1;
    }

    std::cout << "TEST PASSED." << std::endl;
    return 0;
}
