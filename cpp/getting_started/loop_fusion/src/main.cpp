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

#include <cstdio>
#include <iostream>
#include <stdlib.h>
#include "nearest_neighbor.h"
#include <limits.h>
#include "sds_lib.h"

#define MAX_DIMS 5

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

void find_nearest_neighbor(int *out, const int dim,
                           const int *search_points,
                           const int *points, const int len);

int verify(int *gold, int *test, int size) {
    bool match = true;

    for(int i = 0; i < size; i++) {
    
        if(gold[i] == test[i])
            continue;
        else {
            match = false;
            break;
        }
  
    }

    if (!match) {
        return -1;
    }
    else
        return 0;
}

void print_point(int *point, int size) {
    
    for(int i = 0; i < size; i++)
        printf("%d", point[i]);

    printf("\n");  
}

// This example illustrates the algorithm of nearest neighbor search for a given
// point (x, y) from a list of points.
int main(int argc, char **argv) {

    int test_passed = 0;
    static const int num_points = 512;
    static const int num_dims = 2;

    // Allocate PL buffers using sds_alloc
    int *data  = (int *)sds_alloc(sizeof(int) * num_points * num_dims);
    int *input = (int *)sds_alloc(sizeof(int) * num_dims);
    int *out   = (int *)sds_alloc(sizeof(int) * num_dims);

    for(int i = 0; i < num_points * num_dims; i++){
        data[i] = i  + i;
        if(i < num_dims)
            input[i] = i * 2;
    }

    printf("Number Of Points: %d\n", num_points);
    printf("Dimensions: %d\n", num_dims);
    printf("\nInput Point:      ");
    print_point(input, num_dims);

    perf_counter hw_ctr, sw_ctr;
    
    int gold[num_dims];
    
    
    sw_ctr.start();
    //Launch the Software Solution
    find_nearest_neighbor(gold, num_dims, input, data, num_points);
    sw_ctr.stop();

    size_t array_size_bytes = num_points * num_dims * sizeof(int);
 
    hw_ctr.start();
    //Launch the Hardware Solution
    nearest_neighbor_loop_fusion_accel(out, data, input, num_points, num_dims); 
    hw_ctr.stop();
    
    test_passed = verify(gold, out, num_dims);
   
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
   
    
    printf("Nearest Neighbor: ");
    print_point(gold, num_dims);
    
    sds_free(out);
    sds_free(data);
    sds_free(input);
   
    std::cout << "TEST " << (test_passed ? "FAILED" : "PASSED") << std::endl;

    return (test_passed ? -1 : 0);
}

void find_nearest_neighbor(int *out, const int dim,
                           const int *search_points,
                           const int *points, const int num_points) {
  // points is the list of data points that need to be searched for the given
  // point (x, y)
  //
  // output array out has two values - the closest point to given input point
  int best_i = 0;
  int best_dist = INT_MAX;
  int s_point[MAX_DIMS];
    
  for(int d = 0; d < dim; ++d) {
     s_point[d] = search_points[d];
  }

  find_best:
  for(int p = 0; p < num_points; ++p) {
     int dist = 0;
     
        // Calculate the distance in a n-dimensional space
        dist_calc:
        for (int c = 0; c < dim; ++c) {
            int dx = abs(points[dim * p + c] - s_point[c]);
            dist += dx * dx;
        }

        if (dist < best_dist) {
            best_i = p;
            best_dist = dist;
        }   
  }    
    write_best:
    for (int c = 0; c < dim; ++c) {
        out[c] = points[best_i * dim + c];
    }

}
