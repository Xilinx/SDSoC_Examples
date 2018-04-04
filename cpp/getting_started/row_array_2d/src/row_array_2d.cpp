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

/************************************************************************************
    
    Hardware Function demonstrates access of row of a two dimensional array using
    AXI-master interface in burst mode

************************************************************************************/

#include "row_array_2d.h"

// Read data function : Read Data from DDR Memory
void read_data(DTYPE *inx, my_data_fifo &inFifo) {
    read_loop_i: for(int i = 0; i < NUM_ROWS; ++i) {
        read_loop_jj: for (int jj = 0; jj < WORD_PER_ROW; ++jj) {
        #pragma HLS PIPELINE
            inFifo << inx[WORD_PER_ROW*i+jj];;
        }
    }
}

// Write data function : Write Results to DDR Memory
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
    // concurrently. Used to minimize interval. 
    #pragma HLS DATAFLOW
    // Read data from each row of 2D array
    read_data(inx, inFifo);
    // Do computation with the acquired data
    compute(inFifo, outFifo, alpha);
    // Write data to each row of 2D array
    write_data(outx, outFifo);
    return;
}
