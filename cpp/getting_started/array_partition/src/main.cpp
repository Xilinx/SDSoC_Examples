/**********
Copyright (c) 2016, Xilinx, Inc.
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
#include <cstdio>
#include <stdlib.h>
#include "matmul.h"
#include "sds_lib.h"

// row major
void matmul(int *C, int *A, int *B, int M) {
    for (int k = 0; k < M; k++) {
        for (int j = 0; j < M; j++) {
            for (int i = 0; i < M; i++) {
                C[k * M + j] += A[k * M + i] * B[i * M + j];
            }
        }
    }
}

void verify(int *gold, int *output, int size) {
    for (int i = 0; i < size; i++) {
        if (output[i] != gold[i]) {
            printf("Mismatch %d: gold: %d device: %d\n", i, gold[i], output[i]);
            exit(EXIT_FAILURE);
        }
    }
}

// This example illustrates how to use array partitioning attributes in OpenCL
// kernels for FPGA devices using matmul.
int main(int argc, char **argv) {
    static const int columns = 64;
    static const int rows = 64;

    int *A    = (int *) sds_alloc(sizeof(int) * columns * rows);
    int *B    = (int *) sds_alloc(sizeof(int) * columns * rows);
    int *gold = (int *) malloc(sizeof(int) * columns * rows);
    int *C    = (int *) sds_alloc(sizeof(int) * columns * rows);

    // Data Initialization
    for(int i = 0; i < columns * rows; i++) {
        A[i] = i;
        B[i] = i + i;
        gold[i] = 0;
        C[i] = 0;
    }

    matmul(gold, A, B, columns);

    // compute the size of array in bytes
    size_t array_size_bytes = columns * rows * sizeof(int);

    matmul_partition_accel(A, B, C, columns); 

    verify(gold, C, columns * rows);


    sds_free(A);
    sds_free(B);
    sds_free(C);
    free(gold);
    
    printf("TEST PASSED\n");

    return EXIT_SUCCESS;
}
