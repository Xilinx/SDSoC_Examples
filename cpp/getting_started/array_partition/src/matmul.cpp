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

/********************************************************************************

    Array partition feature is demonstrated using matrix multiplication as the 
    base example.  

*********************************************************************************/

#include "matmul.h"

void matmul_partition_accel(int *in1,  // Read-Only Matrix 1
                            int *in2,  // Read-Only Matrix 2
                            int *out,  // Output Result
                            int mat_dim)  // Matrix Dimension 
{               
    // Local memory is implemented as BRAM memory blocks
    int A[MAX_SIZE][MAX_SIZE];
    int B[MAX_SIZE][MAX_SIZE];
    int C[MAX_SIZE][MAX_SIZE];
    //partitioning Array A and B  
    #pragma HLS ARRAY_PARTITION variable=A dim=2 complete
    #pragma HLS ARRAY_PARTITION variable=B dim=1 complete
    
    // Burst reads on input matrices from DDR memory
    // Burst read for matrix A and B
    // Multiple memory interfaces are supported by default in SDSoC
    // It is possible to fetch both A and B concurrently. 
    readA:
    for (int itr = 0, i = 0, j = 0; itr < mat_dim * mat_dim; itr++, j++) {
    #pragma HLS PIPELINE
    #pragma HLS LOOP_TRIPCOUNT min=4096 max=4096
        if (j == mat_dim) { j = 0; i++; }
        A[i][j] = in1[itr];
        B[i][j] = in2[itr];
    }

    // By Default VHLS create single Memory with two ports for each local buffer
    // which allows maximum two read/write from buffer per clock.
    // Due to this restriction, lowest loop of mmmult can be unroll by 2 times only.
    // 
    // However Partition gives instruction to VHLS Complier to split a large array
    // into small-small memory which allow user to get multiple concurrent accesses.
    //
    // To completely unroll the lowest loop of Mmult, A buffer is completely 
    // partitioned for 2nd dimension, and B buffer is completely partitioned
    // for 1st dimension. Which eventually will improve the overall performance of 
    // matrix multiplication. 
    arraypart1: for (int i = 0; i < mat_dim; i++) {
    #pragma HLS LOOP_TRIPCOUNT min=64 max=64
        arraypart2: for (int j = 0; j < mat_dim; j++) {
        #pragma HLS LOOP_TRIPCOUNT min=64 max=64
        #pragma HLS PIPELINE
            int result = 0;
            arraypart3: for (int k = 0; k < MAX_SIZE; k++) {
                result += A[i][k] * B[k][j];
            }
            C[i][j] = result;
        }
    }

    // Burst write from output matrices to DDR memory
    // Burst write from matrix C
    writeC:
    for (int itr = 0, i = 0, j = 0; itr < mat_dim * mat_dim; itr++, j++) {
    #pragma HLS PIPELINE
    #pragma HLS LOOP_TRIPCOUNT min=4096 max=4096
        if (j == mat_dim) { j = 0; i++; }
        out[itr] = C[i][j];
    }
}

