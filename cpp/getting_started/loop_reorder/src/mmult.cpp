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


    This is a matrix multiplication based example which showcases how
    reordering the loops helps achieve better pipeline initiation interval(II)
    and better performance.

*******************************************************************************/

/*

Description :

    Matrix multiply for matrices up to sizes (MAX_SIZE x MAX_SIZE) 
    [MAX_SIZE defined below].
    This example showcases how reordering the loops helps achieve a better
    pipeline initiation interval (II) and better performance.

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
    int C[MAX_SIZE][MAX_SIZE];
    int temp_sum[MAX_SIZE];
    #pragma HLS ARRAY_PARTITION variable=B dim=2 complete
    #pragma HLS ARRAY_PARTITION variable=C dim=2 complete
    #pragma HLS ARRAY_PARTITION variable=temp_sum dim=1 complete
    
    // Burst reads on input matrices from DDR memory
    // Burst read for matrix A
    read_data: for(int itr = 0 , i = 0 , j =0; itr < dim * dim; itr++, j++){
    #pragma HLS PIPELINE
    #pragma HLS LOOP_TRIPCOUNT min=c_size_min*c_size_min max=c_size_max*c_size_max
        if(j == dim) { j = 0 ; i++; }
        A[i][j] = in1[itr];
        B[i][j] = in2[itr];
    }

    // Performs matrix multiply over matrices A and B and stores the result
    // in C. All the matrices are square matrices of the form (size x size)
    // Typical Matrix multiplication Algorithm is as below
    // mmult1: for (int i = 0; i < dim ; i++) {
    //     mmult2: for (int j = 0; j < dim ; j++) {
    //     #pragma HLS PIPELINE
    //        int result = 0;
    //         mmult3: for (int k = 0; k < MAX_SIZE; k++) {
    //             result += A[i][k] * B[k][j];
    //         }
    //         C[i][j] = result;
    //     }
    // }
    // Pipeline attribute is specified for the middle loop (mmult2), which 
    // will try to unroll lower loop mmult3. Unrolling lower loop will create
    // big adder tree to compute result. This adder tree can be avoided by 
    // reordering mmult2 and mmult3 loops as below:
    lreorder1: for (int i = 0; i < dim; i++) {
    #pragma HLS LOOP_TRIPCOUNT min=c_size_min max=c_size_max

        //resetting temp_sum to zero
        for (int j = 0 ; j < MAX_SIZE ; j ++){
            #pragma HLS UNROLL
            temp_sum[j] = 0;
        }
        lreorder2: for (int k = 0; k < dim ; k++) {
        #pragma HLS LOOP_TRIPCOUNT min=c_size_min max=c_size_max
        #pragma HLS PIPELINE
            //Based on the functionality the number of iterations 
            //to be executed for "lreorder3" must be "dim" size. 
            //But for the pipeline to happen in the "lreorder2" the
            //"lreorder3" must be unrolled, to unroll the size cannot be dynamic.
            //It gives better throughput with usage additional resources.           
            lreorder3: for (int j = 0; j < MAX_SIZE; j++) {
                int result = temp_sum[j];
                result += A[i][k] * B[k][j];
                temp_sum[j] = result;
                C[i][j] = result;
            }
        }
    }

    // Burst write from output matrices to DDR memory
    // Burst write from matrix C
    writeC: for(int itr = 0 , i = 0, j = 0; itr < dim * dim; itr++, j++) {
        #pragma HLS PIPELINE
        #pragma HLS LOOP_TRIPCOUNT min=c_size_min*c_size_min max=c_size_max*c_size_max
        if(j == dim) { j = 0 ; i++; }
        out[itr] = C[i][j];
    }
}

