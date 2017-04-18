/*********** 
# Copyright (c) 2017, Xilinx, Inc. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without 
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
# 
# 3. Neither the name of the copyright holder nor the names of its contributors
# may be used to endorse or promote products derived from this software
# without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.
#
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY 
# DIRECT, INDIRECT,INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO,PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# 
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY,OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT 
# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
************/

/********************************************************************************

    Array partition feature is demonstrated using matrix multiplication as the 
    base example.  

*********************************************************************************/

// Maximum Array Size
#define MAX_SIZE 64
#include "matmul.h"

void matmul_partition_accel(int *in1,  // Read-Only Matrix 1
                            int *in2,  // Read-Only Matrix 2
                            int *out,  // Output Result
                            int size)  // Size 
{               
    // Local memory is implemented as BRAM memory blocks
    int A[MAX_SIZE][MAX_SIZE];
    int B[MAX_SIZE][MAX_SIZE];
    #pragma HLS ARRAY_PARTITION variable=B dim=2 complete
    int C[MAX_SIZE][MAX_SIZE];
    #pragma HLS ARRAY_PARTITION variable=C dim=2 complete
    int temp_sum[MAX_SIZE];
    #pragma HLS ARRAY_PARTITION variable=temp_sum dim=1 complete
    
    // Burst reads on input matrices from DDR memory
    // Burst read for matrix A
    readA:
    for (int itr = 0, i = 0, j = 0; itr < size * size; itr++, j++) {
    #pragma HLS PIPELINE
    #pragma HLS LOOP_TRIPCOUNT min=4096 max=4096
        if (j == size) {
            j = 0;
            i++;
        }
        A[i][j] = in1[itr];
    }

    // Burst read for matrix B
    readB:
    for (int itr = 0, i = 0, j = 0; itr < size * size; itr++, j++) {
    #pragma HLS PIPELINE
    #pragma HLS LOOP_TRIPCOUNT min=4096 max=4096
        if (j == size) {
            j = 0;
            i++;
        }
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
    //     __attribute__((xcl_pipeline_loop))
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
    lreorder1:
    for (int i = 0; i < size; i++) {
    #pragma HLS LOOP_TRIPCOUNT min=64 max=64
        lreorder2 :
        for (int k = 0; k < size; k++) {
        #pragma HLS LOOP_TRIPCOUNT min=64 max=64
        #pragma HLS PIPELINE
            lreorder3:
            for (int j = 0; j < MAX_SIZE; j++) {
                int result = (k == 0) ? 0 : temp_sum[j];
                result += A[i][k] * B[k][j];
                temp_sum[j] = result;
                if (k == size - 1) C[i][j] = result;
            }
        }
    }

    // Burst write from output matrices to DDR memory
    // Burst write from matrix C
    writeC:
    for (int itr = 0, i = 0, j = 0; itr < size * size; itr++, j++) {
    #pragma HLS PIPELINE
    #pragma HLS LOOP_TRIPCOUNT min=4096 max=4096
        if (j == size) {
            j = 0;
            i++;
        }
        out[itr] = C[i][j];
    }
}

