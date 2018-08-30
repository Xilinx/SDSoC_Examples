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

    This is a matrix multiplication based example which showcases even with 
    random data access pattern a pipeline initiation interval(II) of 1 
    is achieved.

*******************************************************************************/

/*

Description :

    Matrix multiply for matrices up to sizes (MAX_SIZE x MAX_SIZE) 
    [MAX_SIZE defined below].
    This example showcases random data access pattern.

    Arguments :

        int *in1   (input)     --> Input  Matrix 1
        int *in2   (input)     --> Input  Matrix 2
        int *out   (output)    --> Output Matrix
        int  dim (input)     --> Size of one dimension of the matrices

*/

#include "mmult.h"

// Computes matrix multiply
// C = A x B, where A, B and C are square matrices of dimension (dim x dim)
void mmult_accel(
                    const int in1[MAX_SIZE * MAX_SIZE],     // Read-Only Matrix 1
                    const int in2[MAX_SIZE * MAX_SIZE],     // Read-Only Matrix 2
                    int out[MAX_SIZE * MAX_SIZE],           // Output Result
                    int dim             // Size of one dimension of the matrices
                )
{
    // Performs matrix multiply over matrices A and B and stores the result
    // in C. All the matrices are square matrices of the form (size x size)
     mmult1: for (int i = 0; i < dim ; i++) {
     #pragma HLS LOOP_TRIPCOUNT min=c_min max=c_max
        mmult2 : for (int j = 0; j < dim ; j++) {
        #pragma HLS LOOP_TRIPCOUNT min=c_min max=c_max
           int result = 0;
           mmult3: for (int k = 0; k < dim; k++) {
           #pragma HLS LOOP_TRIPCOUNT min=c_min max=c_max
           #pragma HLS PIPELINE
              result += in1[i * dim + k] * in2[k * dim + j];
           }
           out[i * dim + j] = result;
        }
     }
}

