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
   Loop Fusion :

   Loop fusion is a technique to combine a nested loop with its parent. This
   technique produces more efficient hardware in some cases.
  
*******************************************************************************/

#define MAX_DIMS 5
#include <stdlib.h>
#include <limits.h>
#include "nearest_neighbor.h"

// This implementation fuses the distance calculation and the iteration through
// the search space into one loop.
void nearest_neighbor_loop_fusion_accel(int *out, const int *points,
                       const int *search_point, const int len,
                       const int dim) {

    int best_i = 0;
    int best_dist = INT_MAX;
    int s_point[MAX_DIMS];

    for (int d = 0; d < dim; ++d) {
    #pragma HLS PIPELINE
        s_point[d] = search_point[d];
    }

    int dist = 0;
    int iterations = len * dim;

    // This loop iterates through each point and through each of the dimension.
    // The combined loop performs the same number of iterations as the previous
    // implementation but this approach give the compiler more opportunity to
    // optimize the operations.
    find_best:
    for (int p = 0, c = 0, itr = 0; itr < iterations; itr++) {
    #pragma HLS PIPELINE
        int dx = abs(points[dim * p + c] - s_point[c]);
        dist += dx * dx;
        // Defines the end of the dimension calculation(The inner loop in the
        // previous example)
        if (c == dim - 1) {
            if (dist < best_dist) {
                best_i = p;
                best_dist = dist;
            }
            c = 0;
            dist = 0;
            p++;
        } else {
            c++;
        }
    }
    write_best:
    for (int c = 0; c < dim; ++c) {
    #pragma HLS PIPELINE
        out[c] = points[best_i * dim + c];
    }
}
