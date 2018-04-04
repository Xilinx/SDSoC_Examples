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


    This is a matrix multiplication with matrix addition based example which 
    showcases direct connection that helps in achieving increasing in system
    parallelism and concurrency. 

*******************************************************************************/

/*

Description :

    Matrix multiply for matrices up to sizes (MAX_SIZE x MAX_SIZE) 
    Matrix addition for output of Matrix multiplication and In3.
    [MAX_SIZE defined below].

    Arguments :

        int *in1   (input)     --> Input  Matrix 1
        int *in2   (input)     --> Input  Matrix 2
        int *in3   (input)     --> Input  Matrix 3
        int *out   (output)    --> Output Matrix
        int  dim (input)     --> Size of one dimension of the matrices

*/

#include "mmult.h"

// Computes matrix addition 
// Out = (out + in3) , where a direct connection establishes between the
// HLS kernels for the access of "out"(A X B)
void madd_accel(
                const int *mmult_in,   // Read-Only Matrix
                const int *in3,        // Read-Only Matrix 3
                int *out,              // Output matrix
                int dim                // Size of one dimension of the matrices
               )
{
    // Performs matrix addition over output of (A x B) and In3 and
    // writes the result to output
    write_out: for(int j = 0; j < dim * dim; j++) {
    #pragma HLS PIPELINE
    #pragma HLS LOOP_TRIPCOUNT min=1 max=4096
        out[j] = mmult_in[j] + in3[j];
    }    
}

// Computes matrix multiplication
// out = (A x B) , where A, B are square matrices of dimension (dim x dim)
void mmult_accel(
                 const int *in1,     // Read-Only Matrix 1
                 const int *in2,     // Read-Only Matrix 2
                 int *out,           // Output Result
                 int dim             // Size of one dimension of the matrices
                )
{
    // Local memory to store input and output matrices
    // Local memory is implemented as BRAM memory blocks
    int A[MAX_SIZE][MAX_SIZE];
    int B[MAX_SIZE][MAX_SIZE];
    #pragma HLS ARRAY_PARTITION variable=A dim=2 complete
    #pragma HLS ARRAY_PARTITION variable=B dim=1 complete

    // Burst reads on input matrices from DDR memory
    // Burst read for matrix A, B and C
    read_data: for(int itr = 0 , i = 0 , j =0; itr < dim * dim; itr++, j++){
    #pragma HLS PIPELINE
    #pragma HLS LOOP_TRIPCOUNT min=4096 max=4096
        if(j == dim) { j = 0 ; i++; }
        A[i][j] = in1[itr];
        B[i][j] = in2[itr];
    }

    // Performs matrix multiply over matrices A and B and stores the result
    // in "out". All the matrices are square matrices of the form (size x size)
    // Typical Matrix multiplication Algorithm is as below
    mmult1: for (int i = 0; i < dim ; i++) {
    #pragma HLS LOOP_TRIPCOUNT min=1 max=64
        mmult2: for (int j = 0; j < dim ; j++) {
        #pragma HLS PIPELINE
        #pragma HLS LOOP_TRIPCOUNT min=1 max=64
           int result = 0;
           mmult3: for (int k = 0; k < DATA_SIZE; k++) {
           #pragma HLS LOOP_TRIPCOUNT min=1 max=64
               result += A[i][k] * B[k][j];
           }
           out[i * dim + j] = result;
        }
    }
}

