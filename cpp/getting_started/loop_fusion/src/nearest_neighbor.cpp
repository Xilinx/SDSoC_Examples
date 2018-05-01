/**********
Copyright (c) 2018, Xilinx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**********/

/******************************************************************************

   Loop fusion is a technique to combine a nested loop with its parent. This
   technique produces more efficient hardware in some cases.
  
*******************************************************************************/

#include <limits.h>
#include "nearest_neighbor.h"

// This implementation fuses the distance calculation and the iteration through
// the search space into one loop.
void nearest_neighbor_accel(int *out, const int *points,
                            const int *search_point, const int len,
                            const int dim) 
{
    int best_i = 0;
    int best_dist = INT_MAX;
    int s_point[MAX_DIMS];

    for (int d = 0; d < dim; ++d) {
    #pragma HLS PIPELINE
        s_point[d] = search_point[d];
    }

    int dist = 0;
    int iterations = len * dim;

    // Naive Appraoch:
    // Naive approach is Two cascaded for-loop appraoch as below:
    // upper_loop:for(int p = 0 ; p < len; ++p){
    //    int dist = 0;
    //    lower_loop:for(int c = 0 ; c < dim ; c++){
    //       int dx = points[dim*p + c] - s_point[c];
    //       dist +=dx * dx;
    //    }
    //    if (dist < best_dist){
    //       best_i = p;
    //       best_dist = dist;
    //    }
    // }
    // This loop iterates through each point and through each of the dimension.
    // 
    // Optimized Approach: Loop Fusion
    // Loop Fusion approach is to merge cascaded loops into one loop.
    // The combined loop performs the same number of iterations as the naive
    // implementation but this approach give the compiler more opportunity to
    // optimize the operations.
    find_best:
    for (int p = 0, c = 0, itr = 0; itr < iterations; itr++) {
    #pragma HLS PIPELINE
        int dx = points[dim * p + c] - s_point[c];
        dist += dx * dx;
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
