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

    This is a matrix multiplication based example which showcases the how
    reordering the loops helps achieve better pipeline initiation interval(II)
    and better performance.

*******************************************************************************/

/*

Kernel Description :

    Matrix multiply for matrices upto sizes (MAX_SIZE x MAX_SIZE) 
    [MAX_SIZE defined below].
    This example showcases how reordering the loops helps achieve a better
    pipeline initiation interval (II) and better performance.

    Arguments :

        int *in1   (input)     --> Input  Matrix 1
        int *in2   (input)     --> Input  Matrix 2
        int *out   (output)    --> Output Matrix
        int  size  (input)     --> Size of one dimension of the matrices

    Kernel Configuration :

        Matrices of upto size (MAX_SIZE x MAX_SIZE) [MAX_SIZE = 64 defined below]
*/

#include <string.h>
#include <stdio.h>
#include "mmult.h"
//Array Size to access
#define DATA_SIZE 64

//Maximum Array Size
#define MAX_SIZE 64

// Computes matrix multiply
// C = AxB, where A, B and C are square matrices of dimension (sizexsize)
void mmult_accel(
				const int *in1,     // Read-Only Matrix 1
				const int *in2,     // Read-Only Matrix 2
				int *out,           // Output Result
				int size            // Size of one dimension of the matrices
				)
{
	// Local memory to store input and output matrices
	// Local memory is implemented as BRAM memory blocks
	int A[MAX_SIZE][MAX_SIZE];
	int B[MAX_SIZE][MAX_SIZE];
	int C[MAX_SIZE][MAX_SIZE];
	int temp_sum[MAX_SIZE];
	#pragma HLS ARRAY_PARTITION variable=B dim=2 complete
	#pragma HLS ARRAY_PARTITION variable=C dim=2 complete
	#pragma HLS ARRAY_PARTITION variable=temp_sum dim=1 complete

	// Burst reads on input matrices from global memory
	// Burst read for matrix A
	readA: for(int itr = 0 , i = 0 , j =0; itr < size * size; itr++, j++){
	#pragma HLS PIPELINE
	#pragma HLS LOOP_TRIPCOUNT min=4096 max=4096
		if(j == size) { j = 0 ; i++; }
		A[i][j] = in1[itr];
	}

	// Burst read for matrix B
	readB: for(int itr  =0, i = 0, j = 0; itr < size * size; itr++, j++) {
	#pragma HLS PIPELINE
	#pragma HLS LOOP_TRIPCOUNT min=4096 max=4096
		if(j == size) { j = 0 ; i++; }
		B[i][j] = in2[itr];
	}

	// Performs matrix multiply over matrices A and B and stores the result
	// in C. All the matrices are square matrices of the form (size x size)

	// Pipeline attribute is specified for the innermost loop (lreorder3)
	// and the order of the loops lreorder2 and lreorder 3 are changed here.

	// When the iteration variables j and k are interchanged between the loops,
	// lreoder2 and lreorder3, the pipeline initiation interval (II) improves
	// and becomes 1 (ideal).

	// Also the reordering avoids creating an adder tree for calculating the
	// sum(output) of a single output element

	// lreorder1: for (int i = 0; i < size; i++) {
	//     lreorder2: for (int j = 0; j < size; j++) {
	//     #pragma HLS PIPELINE
	//         lreorder3: for (int k = 0; k < MAX_SIZE; k++) {
	//             int result = (k == 0) ? 0 : temp_sum[j];
	//             result += A[i][k] * B[k][j];
	//             temp_sum[j] = result;
	//             if (k== size -1) C[i][j] = result;
	//         }
	//     }
	// }

	// The above code snippet of the Matrix Multiply kernel in which the loops
	// lreorder2 and lreorder3 are not interchanged, gives a pipeline initiation
	// interval (II) of 64

	// Calculate matrix multiplication using local data buffer based on input size
	// and write results into local buffer for C
	lreorder1: for (int i = 0; i < size; i++) {
	#pragma HLS LOOP_TRIPCOUNT min=64 max=64
		lreorder2: for (int k = 0; k < size; k++) {
		#pragma HLS LOOP_TRIPCOUNT min=64 max=64
		#pragma HLS PIPELINE
			lreorder3: for (int j = 0; j < MAX_SIZE; j++) {
				int result = (k == 0) ? 0 : temp_sum[j];
				result += A[i][k] * B[k][j];
				temp_sum[j] = result;
				if (k== size -1) C[i][j] = result;
			}
		}
	}

	// Burst write from output matrices to global memory
	// Burst write from matrix C
	writeC: for(int itr = 0 , i = 0, j = 0; itr < size * size; itr++, j++) {
		#pragma HLS PIPELINE
		#pragma HLS LOOP_TRIPCOUNT min=4096 max=4096
		if(j == size) { j = 0 ; i++; }
		out[itr] = C[i][j];
	}
}

