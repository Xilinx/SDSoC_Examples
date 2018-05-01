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

#include "mmult.h"

const int size = SIZE;

void mmult_accel(int *in1,  // Read-Only Matrix 1
                 int *in2,  // Read-Only Matrix 2
                 int *out)  // Output Result
{
    //Local memory to store input and output matrices
    //Local memory is implemented as BRAM memory blocks
    int A[size][size];
    int B[size][size];
    int C[size][size];

    //Burst read data from DDR memory to local matrices A and B
    readA: for (int itr = 0, i = 0, j = 0; itr < size * size; itr++, j++) {
    #pragma HLS PIPELINE
        if (j == size) { j = 0; i++; }
        A[i][j] = in1[itr];
        B[i][j] = in2[itr];
    }

    //Performs matrix multiplication out = in1 x in2
    mmult_1: for (int i = 0; i < size; i++) {
        mmult_2: for (int j = 0; j < size; j++) {
            int result = 0;
            mmult_3: for (int k = 0; k < size; k++) {
            #pragma HLS PIPELINE
                result += A[i][k] * B[k][j];
            }
            C[i][j] = result;
        }
    }

    //Burst write the results from output matrix C to DDR memory
    write_out: for (int itr = 0, i = 0, j = 0; itr < size * size; itr++, j++) {
    #pragma HLS PIPELINE
        if (j == size) { j = 0; i++; }
        out[itr] = C[i][j];
    }
}

