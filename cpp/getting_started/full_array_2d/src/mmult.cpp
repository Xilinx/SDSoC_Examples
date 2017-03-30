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

    C Kernel Example of Matrix Multiplication to demonstrate 2-D full array access

*******************************************************************************/

//Includes
#include <stdio.h>
#include <string.h>
#include "mmult.h"
//define max local buffer size
#define N 256

//define array size to access
#define DATA_SIZE 8

void mmult_accel(int *a, int *b, int *c, int size) {

	int bufa[N][N], bufb[N][N], bufc[N][N];
	int matrix_size = size*size;
	// Read data from global memory and write into local buffer for a, 
	// loop pipeline will be automatically inferred
	int x = 0, y = 0;
	read_data_a: for (int i = 0 ; i < matrix_size ; i++){
	#pragma HLS LOOP_TRIPCOUNT min=1 max=65536
		int tmpData_a = a[i];
		bufa[x][y] = tmpData_a;
		if (y == size-1){
			x++;
			y = 0;
		}else{
			y++;
		}
	}

	// Read data from global memory and write into local buffer for b, loop pipeline 
	// will be automatically inferred
	read_data_b: for (int i = 0, x=0, y=0; i < matrix_size ; i++){
	#pragma HLS LOOP_TRIPCOUNT min=1 max=65536
		int tmpData_b = b[i];
		bufb[x][y] = tmpData_b;
		if (y == size-1){
			x++;
			y = 0;
		}else{
			y++;
		}
	}

	// Calculate matrix multiplication using local data buffer based on input size, 
	// and write results into local buffer for c
	matrix_mult: for (int row = 0; row < size; row++) {
	#pragma HLS LOOP_TRIPCOUNT min=1 max=256
		for (int col = 0; col < size; col++) {
		#pragma HLS LOOP_TRIPCOUNT min=1 max=256
			int result = 0;
			for (int k = 0; k < size; k++) {
			#pragma HLS LOOP_TRIPCOUNT min=1 max=256
			#pragma HLS pipeline
				result += bufa[row][k] * bufb[k][col];
			}
			bufc[row][col] = result;
		}
	}
	// Write results from local buffer to global memory for c, loop pipeline will be 
	// automatically inferred
	int m = 0, n = 0;
	write_data: for (int i = 0 ; i < matrix_size ; i++){
	#pragma HLS LOOP_TRIPCOUNT min=1 max=65536
		int tmpData_c = bufc[m][n];
		c[i] = tmpData_c;
		if (n == size-1){
			m++;
			n = 0;
		}else{
			n++;
		}
	}
}

