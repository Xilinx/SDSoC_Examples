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

/************************************************************************************
Description:
    
    C Kernel Example using AXI4-master interface to access row of data from 2D array

************************************************************************************/

//Includes
#include <stdio.h>
#include <string.h>
#include "assert.h"
#include "row_array_2d.h"

// Read data function : Read Data from Global Memory
void read_data(DTYPE *inx, my_data_fifo &inFifo) {
    read_loop_i: for(int i = 0; i < NUM_ROWS; ++i) {
        read_loop_jj: for (int jj = 0; jj < WORD_PER_ROW; ++jj) {
        #pragma HLS PIPELINE
            inFifo << inx[WORD_PER_ROW*i+jj];;
        }
    }
}

// Write data function : Write Results to Global Memory
void write_data(DTYPE *outx, my_data_fifo &outFifo) {
    write_loop_i: for(int i = 0; i < NUM_ROWS; ++i) {
        write_loop_jj: for (int jj = 0; jj < WORD_PER_ROW; ++jj) {
        #pragma HLS PIPELINE
            outFifo >> outx[WORD_PER_ROW*i+jj];
        }
    }
}

// Compute function, currently as simple as possible because this example is 
// focused on efficient memory access pattern.
void compute(my_data_fifo &inFifo, my_data_fifo &outFifo, DTYPE alpha) {
    compute_loop_i: for(int i = 0; i < NUM_ROWS; ++i) {
        compute_loop_jj: for (int jj = 0; jj < WORD_PER_ROW; ++jj) {
        #pragma HLS PIPELINE
            DTYPE inTmp;
            inFifo >> inTmp;
            DTYPE outTmp = inTmp * alpha;
            outFifo << outTmp;
        }
    }
}


void row_array_2d_accel(DTYPE *inx, DTYPE *outx, DTYPE alpha) {
	my_data_fifo inFifo;
	// By default the FIFO depth is 2, user can change the depth by using such 
	// pragma: #pragma HLS stream variable=inFifo depth=256
	my_data_fifo outFifo;

// Dataflow enables task level pipelining, allowing functions and loops to execute 
// concurrently. Used to minimize interval. More details please refer to UG902.
#pragma HLS DATAFLOW
	// Read data from each row of 2D array
	read_data(inx, inFifo);
	// Do computation with the acquired data
	compute(inFifo, outFifo, alpha);
	// Write data to each row of 2D array
	write_data(outx, outFifo);
	return;
}
