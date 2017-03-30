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
    
  C Kernel Example using AXI4-master interface to access window of data from 2D array

************************************************************************************/

//Includes
#include <stdio.h>
#include <string.h>
#include "assert.h"
#include "window_array_2d.h"

// Read data function : Read tile/window of Data from Global Memory
void read_data(DTYPE *inx, my_data_fifo &inFifo) {
    DTYPE tile[TILE_HEIGHT][TILE_WIDTH];
    rd_loop_i: for(int i = 0; i < TILE_PER_COLUMN; ++i) {
        rd_loop_j: for (int j = 0; j < TILE_PER_ROW; ++j) {
        #pragma HLS DATAFLOW
            rd_buf_loop_m: for (int m = 0; m < TILE_HEIGHT; ++m) {
                rd_buf_loop_n: for (int n = 0; n < TILE_WIDTH; ++n) {
                #pragma HLS PIPELINE
                    // should burst TILE_WIDTH in WORD beat
                    tile[m][n] = inx[TILE_HEIGHT*TILE_PER_ROW*TILE_WIDTH*i
                                    +TILE_PER_ROW*TILE_WIDTH*m+TILE_WIDTH*j+n];
                }
            }
            rd_loop_m: for (int m = 0; m < TILE_HEIGHT; ++m) {
                rd_loop_n: for (int n = 0; n < TILE_WIDTH; ++n) {
                #pragma HLS PIPELINE
                    inFifo << tile[m][n];
                }
            }
        }
    }
}

// Write data function : Write tile/window of Results to Global Memory
void write_data(DTYPE *outx, my_data_fifo &outFifo) {
    DTYPE tile[TILE_HEIGHT][TILE_WIDTH];
    wr_loop_i: for(int i = 0; i < TILE_PER_COLUMN; ++i) {
        wr_loop_j: for (int j = 0; j < TILE_PER_ROW; ++j) {
        #pragma HLS DATAFLOW
            wr_buf_loop_m: for (int m = 0; m < TILE_HEIGHT; ++m) {
                wr_buf_loop_n: for (int n = 0; n < TILE_WIDTH; ++n) {
                #pragma HLS PIPELINE
                    // should burst TILE_WIDTH in WORD beat
                    outFifo >> tile[m][n];
                }
            }
            wr_loop_m: for (int m = 0; m < TILE_HEIGHT; ++m) {
                wr_loop_n: for (int n = 0; n < TILE_WIDTH; ++n) {
                #pragma HLS PIPELINE
                    outx[TILE_HEIGHT*TILE_PER_ROW*TILE_WIDTH*i+TILE_PER_ROW
                         *TILE_WIDTH*m+TILE_WIDTH*j+n] = tile[m][n];
                }
            }
        }
    }
}

// Compute function, currently as simple as possible because this example is 
// focused on efficient memory access pattern.
void compute(my_data_fifo &inFifo, my_data_fifo &outFifo, DTYPE alpha) {
    compute_loop_i: for(int i = 0; i < TILE_PER_COLUMN*TILE_HEIGHT; ++i) {
        compute_loop_j: for (int j = 0; j < TILE_PER_ROW; ++j) {
            compute_loop_m: for (int m = 0; m < TILE_WIDTH; ++m) {
            #pragma HLS PIPELINE
                DTYPE inTmp;
                inFifo >> inTmp;
                DTYPE outTmp = inTmp * alpha;
                outFifo << outTmp;
            }
        }
    }
}

void window_array_2d_accel(DTYPE *inx, DTYPE *outx, DTYPE alpha) {
	my_data_fifo inFifo;
#pragma HLS stream variable=inFifo depth=4096
// User can change the FIFO depth if array size is not 64*64, but currently we have 
// limitation here due to some issues in tool.
// The FIFO depth can NOT be smaller than the full array size, namely BLOCK_SIZE 
// defined in header file "window_array_2d.h"
	my_data_fifo outFifo;

// Enables task level pipelining, allowing functions and loops to execute 
// concurrently. Used to minimize interval. More details please refer to UG902.
#pragma HLS DATAFLOW
	// Read data from 2D array using tile/window pattern
	read_data(inx, inFifo);
	// Do computation with the acquired data
	compute(inFifo, outFifo, alpha);
	// Write data to 2D array using tile/window pattern
	write_data(outx, outFifo);
	return;
}
