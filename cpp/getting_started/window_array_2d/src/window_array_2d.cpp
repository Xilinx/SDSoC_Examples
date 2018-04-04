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
    
   This example is intended to demonstrate data access pattern using AXI-master
   interface. In this example a window of two dimensional array data is accessed 
   in burst mode  

*******************************************************************************/

#include "window_array_2d.h"

// Read data function : Read tile/window of Data from DDR Memory
void read_data(DTYPE *inx, my_data_fifo &inFifo) {
    DTYPE tile[TILE_HEIGHT][TILE_WIDTH];
    rd_loop_i: for(int i = 0; i < TILE_PER_COLUMN; ++i) {
        rd_loop_j: for (int j = 0; j < TILE_PER_ROW; ++j) {
        #pragma HLS DATAFLOW
            rd_buf_loop_m: for (int m = 0; m < TILE_HEIGHT; ++m) {
                rd_buf_loop_n: for (int n = 0; n < TILE_WIDTH; ++n) {
                #pragma HLS PIPELINE
                    // Infers burst transfer - TILE_WIDTH 
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

// Write data function : Write tile/window of Results to DDR Memory
void write_data(DTYPE *outx, my_data_fifo &outFifo) {
    DTYPE tile[TILE_HEIGHT][TILE_WIDTH];
    wr_loop_i: for(int i = 0; i < TILE_PER_COLUMN; ++i) {
        wr_loop_j: for (int j = 0; j < TILE_PER_ROW; ++j) {
        #pragma HLS DATAFLOW
            wr_buf_loop_m: for (int m = 0; m < TILE_HEIGHT; ++m) {
                wr_buf_loop_n: for (int n = 0; n < TILE_WIDTH; ++n) {
                #pragma HLS PIPELINE
                    // Infers burst transfer - TILE_WIDTH
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
    // User can change the FIFO depth if array size is not 64*64.
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
