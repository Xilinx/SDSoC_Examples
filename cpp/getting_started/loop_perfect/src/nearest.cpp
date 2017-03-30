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

SDx Key Concept :

    This is a nearest neighbor of a point example showcases how making a loop
    nest perfect or semi-perfect can help improve performance.

*******************************************************************************/

/*

Kernel Description : 

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

    Kernel Configuration :

        MAX_DIM     - #Dimensions of the input points can be up to MAX_DIM
        MAX_SIZE    - Size of the input array can be up to MAX_SIZE
*/

#include <string.h>
#include <stdio.h>
#include <limits.h>
#include "nearest.h"
// Compute distances using unsigned long
// and to avoid square root operation.
// Maximum possible distance between two points
#define INFINITY ULONG_MAX

#define SQUARE(x) ((x)*(x))

// Maximum #Dimensions for a point
#define MAX_DIM 16

// Maximum size of point array
#define MAX_SIZE 1024

// Current #Dimension and size of point array
#define DATA_DIM 16
#define DATA_SIZE 1024



void nearest_accel(
				const int in[DATA_SIZE*DATA_DIM],      // Input Points Array
				const int point[DATA_DIM],             // Current Point
				int out[DATA_DIM],                     // Output Point
				int size,                              // Size of the input array
				int dim                                // #Dimensions of the points
			)
{
	// Local memory to store input and output matrices
	// Local memory is implemented as BRAM memory blocks

	// Holds the input array of points
	int in_local[MAX_SIZE][MAX_DIM];
	#pragma HLS ARRAY_PARTITION variable=in_local complete dim=2

	// Holds the point for which the nearest neighbor is to be found
	int point_local[MAX_DIM];
	#pragma HLS ARRAY_PARTITION variable=point_local complete dim=1

	// Holds the current nearest point
	int point_nearest[MAX_DIM];
	#pragma HLS ARRAY_PARTITION variable=point_nearest complete dim=1

	// min_dist holds the minimum distance till now
	unsigned long min_dist = INFINITY;

	// curr_dist holds the value of distance between point_local and
	// the current point
	unsigned long curr_dist;

	// Burst reads on input from global memory, Points are read as
	// an array of integers and saved to in_local.
	readInput: for(int itr = 0, i = 0, j = 0; itr < size*dim; itr++, j++){
	#pragma HLS LOOP_TRIPCOUNT min=16384*16 max=16384*16
	#pragma HLS PIPELINE
		if(j == dim) { j = 0; i++;}
		in_local[i][j] = in[itr];
	}

	// Burst reads the point for which nearest neighbor is to be found
	readCurrPt: for(int i = 0; i < dim; i++){
	#pragma HLS LOOP_TRIPCOUNT min=16 max=16
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
	#pragma HLS LOOP_TRIPCOUNT min=16384 max=16384
		nearest2: for(int j = 0; j < dim; j++) {
		#pragma HLS LOOP_TRIPCOUNT min=16 max=16
		#pragma HLS PIPELINE
			if(j == 0)  curr_dist = 0;

			curr_dist += SQUARE(point_local[j] - in_local[i][j]);

			if(j == dim-1 && curr_dist < min_dist) {
				min_dist = curr_dist;
				nearest3: for(int k = 0; k < MAX_DIM; k++) {
					point_nearest[k] = in_local[i][k];
				}
			}
		}
	}

	// Burst writes the nearest neighbor to out
	wirteOuput: for(int i = 0; i < dim; i++) {
	#pragma HLS LOOP_TRIPCOUNT min=16 max=16
	#pragma HLS PIPELINE
		out[i] = point_nearest[i];
	}

}


