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


    This is a vector multiplication with vector addition based example which 
    showcases async mechanism that helps in achieving increasing in system
    parallelism and concurrency. 

*******************************************************************************/

/*

Description :

    Two accelerators executed in parallel.
    Vector multiply for vector up to size TEST_DATA_SIZE 
    Vector add for vector up to size TEST_DATA_SIZE 

    Arguments :

        int *in1   (input)     --> Input  Vector 1
        int *in2   (input)     --> Input  Vector 2
        int *out   (output)    --> Output Vector
        int  dim (input)     --> Size of one dimension of the vector

*/

#include "vadd_vmul.h"

// Computes vector addition 
// out = (in1 + in2) , where in1, in2 are of dimension (dim x dim)
void vadd_accel(
                const int *in1,   // Read-Only Vector 1
                const int *in2,   // Read-Only Vector 2
                int *out,         // Output vector
                int dim           // Size of one dimension of the vector
               )
{
    // Performs vector addition over in1 and in2, and
    // writes the result to output
    vadd_write_out: for(int j = 0; j < dim; j++) {
    #pragma HLS PIPELINE
    #pragma HLS LOOP_TRIPCOUNT min=c_size_min max=c_size_max
        out[j] = in1[j] + in2[j];
    }    
}

// Computes vector multiplication
// out = (in1 x in2) , where in1, in2 are of dimension (dim x dim)
void vmul_accel(
                 const int *in1,     // Read-Only Vector 1
                 const int *in2,     // Read-Only Vector 2
                 int *out,           // Output Result
                 int dim             // Size of one dimension of the vector
                )
{
    // Performs vector multiplication over in1 and in2, and
    // writes the result to output
    vmul_write_out: for(int j = 0; j < dim; j++) {
    #pragma HLS PIPELINE
    #pragma HLS LOOP_TRIPCOUNT min=c_size_min max=c_size_max
        out[j] = in1[j] * in2[j];
    }    

}
