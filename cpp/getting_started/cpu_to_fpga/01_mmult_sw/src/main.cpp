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

//This is a simple example of Matrix Multiplication on CPU.
//
#include <iostream>
#include <stdlib.h>

//Array size to access
#define DATA_SIZE 64

void mmult_sw( int *in1,   // Input matrix 1
                int *in2,   // Input matrix 2
                int *out,   // Output matrix (out = A x B)
                int dim     // Size of one dimension of matrix
              )
{
    //Performs matrix multiplication out = in1 x in2
    for (int i = 0; i < dim; i++){
        for (int j = 0; j < dim; j++){
            for (int k = 0; k < dim; k++){
                out[i * dim + j] += in1[i * dim + k] * in2[k * dim  + j];
            }
        }
    }
}

int main(int argc, char** argv)
{
    int dim = DATA_SIZE;
    size_t matrix_size_bytes = sizeof(int) * DATA_SIZE * DATA_SIZE;
    
    //Allocate memory
    int *in1 = (int *) malloc(matrix_size_bytes);
    int *in2 = (int *) malloc(matrix_size_bytes);
    int *sw_result = (int *) malloc(matrix_size_bytes);

    //Creates test data
    for(int index = 0; index < dim * dim; index++){
        in1[index] = rand() % dim;
        in2[index] = rand() % dim;
        sw_result[index] = 0;
    }

    //Function call to perform matrix multiplication
    mmult_sw(in1, in2, sw_result, dim);
    std::cout << "TEST PASSED" << std::endl;
    
    //Release Memory
    free(in1);
    free(in2);
    free(sw_result);

    return 0;
}
