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

    This is a matrix multiplication example which showcases the "Systolic Array"
    based algorithm design. Systolic array type of implementation is well suited
    for FPGAs.

*******************************************************************************/

/*

Kernel Description :

    This kernel is a systolic array based matrix multiplication. Though the
    maximum size of the input matrices are restricted to a smaller MAX_SIZE, it
    is still possible to use this approach and get better performance for larger
    matrices by using tiling.

    Arguments :

        int *a     (input )  --> Input  Matrix A
        int *b     (input )  --> Input  Matrix B
        int *c     (output)  --> Output Matrix
        int  a_row (input )  --> Row Size Matrix A
        int  a_col (input )  --> Col Size Matrix A
        int  b_col (input )  --> Col Size Matrix B

    Kernel Configuration :

        Max Size    --> 16

    Note :
        Max Size is dependent on the available DSP resources in the FPGA
*/

#include <stdio.h>
#include "mmult.h"
//Maximum Array Size
#define MAX_SIZE 12
#define DATA_SIZE 12


void mmult_accel(
			const int *a,   // Read-Only Matrix A
			const int *b,   // Read-Only Matrix B
			int *c,         // Output Result
			int a_row,      // Matrix A Row Size
			int a_col,      // Matrix A Col Size
			int b_col       // Matrix B Col Size
		)
{
	int b_row = a_col;
	int c_row = a_row;
	int c_col = b_col;

	// Local memory to store input and output matrices
	// Local memory is implemented as BRAM memory blocks

	int localA[MAX_SIZE][MAX_SIZE];
	#pragma HLS ARRAY_PARTITION variable=localA dim=1 complete

	int localB[MAX_SIZE][MAX_SIZE];
	#pragma HLS ARRAY_PARTITION variable=localB dim=2 complete

	int localC[MAX_SIZE][MAX_SIZE];
	#pragma HLS ARRAY_PARTITION variable=localC dim=0 complete

	// Burst reads on input matrices from global memory
	// Read Input A
	readA: for(int loc = 0, i = 0, j = 0; loc < a_row*a_col; loc++, j++) {
	#pragma HLS LOOP_TRIPCOUNT min=21*21 max=21*21
	#pragma HLS PIPELINE
		if(j == a_col) { i++; j = 0;}
		localA[i][j] = a[loc];
	}

	// Read Input B
	readB: for(int loc = 0, i = 0, j = 0; loc < b_row*b_col; loc++, j++) {
	#pragma HLS LOOP_TRIPCOUNT min=21*21 max=21*21
	#pragma HLS PIPELINE
		if(j == b_col) { i++; j = 0; }
		localB[i][j] = b[loc];
	}

	// Perform systolic matrix multiply
	// local matrices localA and localB have been partitioned in dimensions
	// 1 and 2 respectively. local matrix C has been partitioned completely

	// This partitioning enables to access MAX_SIZE elements in parallel in
	// the local matrices. Because of the mode of access of array elements,
	// we are able to perform MAX_SIZE*MAX_SIZE operations in parallel.

	// Note : i, j and k loops are interchanged.

	// The top loop systolic1 runs only for a_col iterations instead of
	// MAX_SIZE like the inner loops. The inner loops have fixed loop
	// iteration counts to enable complete unroll

	// The following diagram explains how the matrix multiply happens
	//
	//        B_0        B_1        B_2        B_3
	//         |          |          |          |
	//         v          v          v          v
	//        ___        ___        ___        ___
	//       |   |      |   |      |   |      |   |
	//  A0_->|C00| ---- |C01| ---- |C02| ---- |C03|
	//       |___|      |___|      |___|      |___|
	//         |          |          |          |
	//        ___        ___        ___        ___
	//       |   |      |   |      |   |      |   |
	//  A1_->|C10| ---- |C11| ---- |C12| ---- |C13|
	//       |___|      |___|      |___|      |___|
	//         |          |          |          |
	//        ___        ___        ___        ___
	//       |   |      |   |      |   |      |   |
	//  A2_->|C20| ---- |C21| ---- |C21| ---- |C21|
	//       |___|      |___|      |___|      |___|
	//         |          |          |          |
	//        ___        ___        ___        ___
	//       |   |      |   |      |   |      |   |
	//  A3_->|C30| ---- |C31| ---- |C32| ---- |C33|
	//       |___|      |___|      |___|      |___|

	systolic1: for(int k = 0; k < a_col; k++) {
	#pragma HLS LOOP_TRIPCOUNT min=16 max=16
	#pragma HLS PIPELINE
		systolic2: for(int i = 0; i < MAX_SIZE; i++) {
			systolic3: for(int j = 0; j < MAX_SIZE; j++) {

				// Get previous sum
				int last = (k==0) ? 0 : localC[i][j];

				// Update current sum
				// Handle boundary conditions
				int a_val = (i < a_row && k < a_col)? localA[i][k] : 0;
				int b_val = (k < b_row && j < b_col)? localB[k][j] : 0;
				int result = last + a_val*b_val;

				// Write back results
				localC[i][j] = result;
			}
		}
	}

	// Burst write from output matrices to global memory
	// Burst write from matrix C
	writeC: for(int loc = 0, i = 0, j = 0; loc < c_row*c_col; loc++, j++) {
	#pragma HLS LOOP_TRIPCOUNT min=256 max=256
	#pragma HLS PIPELINE
		if(j == c_col) { i++; j = 0; }
		c[loc] = localC[i][j];
	}
}

