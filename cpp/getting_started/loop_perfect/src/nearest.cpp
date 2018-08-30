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

/*******************************************************************************

    This is a nearest neighbor of a point example showcases how making a loop
    nest perfect or semi-perfect can help improve performance.

*******************************************************************************/

/*

Hardware Function Description : 

    Finding the nearest neighbor of a point from a given set of points (of up to
    MAX_SIZE points). This example showcases how making a loop nest perfect or
    semi perfect can help improve performance.

    Arguments :

    int *in     (input )    --> Input Points Array - represented as integer
    int *point  (input )    --> Current Point for which the nearest neighbor
                                is found
    int *out    (output)    --> Output Point
    int size    (input )    --> Size of the input array
    int dim     (input )    --> #Dimensions of the points

    Hardware Function Configuration :

        MAX_DIM     - #Dimensions of the input points can be up to MAX_DIM
        MAX_SIZE    - Size of the input array can be up to MAX_SIZE
*/

#include <limits.h>
#include "nearest.h"

// Compute distances using unsigned long
// and to avoid square root operation.
// Maximum possible distance between two points
#define INFINITY ULONG_MAX

#define SQUARE(x) ((x)*(x))

void nearest_accel(
                    const int *in,           // Input Points Array
                    const int *point,         // Current Point
                    int *out,                // Output Point
                    int size,                // Size of the input array
                    int dim                  // #Dimensions of the points
                  )
{
    // Local memory to store input matrices
    // Local memory is implemented as BRAM memory blocks

    // Holds the point for which the nearest neighbor is to be found
    int point_local[MAX_DIM];

    //holds the index of the nearest point
    int point_nearest;

    // min_dist holds the minimum distance till now
    unsigned long min_dist = INFINITY;

    // curr_dist holds the value of distance between point_local and
    // the current point
    unsigned long curr_dist;

    // Burst reads the point for which nearest neighbor is to be found
    readCurrPt: for(int i = 0; i < dim; i++){
    #pragma HLS LOOP_TRIPCOUNT min=c_dim max=c_dim
    #pragma HLS PIPELINE
        point_local[i] = point[i];
    }

    // Find the nearest neighbor

    // nearest1 loop goes over all the points
    // nearest2 loop finds the distance between point_local and the current
    // point. Based on this the minimum distance and the closest neighbor
    // are updated.

    // In nearest2 loop, there are specific conditions like if(j==0).
    // This is for enabling loop flatten to improve performance.
    nearest1: for(int i = 0; i < size; i++) {
    #pragma HLS LOOP_TRIPCOUNT min=c_size*c_dim max=c_size*c_dim
        nearest2: for(int j = 0; j < dim; j++) {
        #pragma HLS LOOP_TRIPCOUNT min=c_dim max=c_dim
        #pragma HLS PIPELINE
            if(j == 0)  curr_dist = 0;

            curr_dist += SQUARE(point_local[j] - in[dim * i + j]);

            if(j == dim-1 && curr_dist < min_dist) {
                point_nearest = i;
                min_dist = curr_dist;
            }
        }
    }

    // Burst writes the nearest neighbor to out
    wirteOuput: for(int i = 0; i < dim; i++) {
    #pragma HLS LOOP_TRIPCOUNT min=c_dim max=c_dim
    #pragma HLS PIPELINE
        out[i] = in[point_nearest*dim + i];
    }

}
