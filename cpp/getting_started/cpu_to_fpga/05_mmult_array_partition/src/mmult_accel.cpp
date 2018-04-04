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

#include "mmult_accel.h"

void mmult_array_partition(int *in1, int *in2, int *out, int dim)
{
    //loop tripcount constant
    const int c_size = DATA_SIZE;

    //Local memory to store input and output matrices
    int local_in1[MAX_SIZE][MAX_SIZE];
    int local_in2[MAX_SIZE][MAX_SIZE];
    int local_out[MAX_SIZE][MAX_SIZE]; 

    //Physical implementation of memories have only a limited number of read/write
    //ports, that can be overcome by using the ARRAY_PARTITION pragma
    #pragma HLS ARRAY_PARTITION variable=local_in1 complete dim=2 
    #pragma HLS ARRAY_PARTITION variable=local_in2 complete dim=1 
    
    //When loop_3 is unrolled automatically, the column "k" in local_in1[i][k] is variable
    //whereas in case of local_in2[k][j] the row "k" is variable. So, for effective pipelined
    //processing, local_in1 has been partitioned in dimension 2 and local_in2 is 
    //partitioned in dimension 1.

    //Burst read on input matrices local_in1 and local_in2 from DDR memory.
    read_in1: for(int iter = 0, i=0, j=0; iter< dim*dim; iter++,j++){
    #pragma HLS loop_tripcount min=c_size*c_size max=c_size*c_size
        if( j== dim){ j = 0; i++; }
        local_in1[i][j] = in1[iter]; 
    }
    read_in2: for(int iter = 0, i=0, j=0; iter< dim*dim; iter++,j++){
    #pragma HLS loop_tripcount min=c_size*c_size max=c_size*c_size
        if( j== dim){ j = 0; i++; }
        local_in2[i][j] = in2[iter];
    }
    //Reads the input_data from local memory, performs the
    //computations and writes the data to local memory.
    loop_1: for (int i = 0 ; i < dim ; i++){
    #pragma HLS loop_tripcount min=c_size max=c_size
        loop_2: for(int j = 0 ; j < dim ; j++){
        #pragma HLS loop_tripcount min=c_size max=c_size
        //Pipelining a loop results in automatic unrolling of inner loops by the HLS compiler.
        #pragma HLS pipeline
            local_out[i][j] = 0;
            loop_3: for(int k = 0; k < c_size; k++){
		//To enable automatic unrolling of loop, the no. of iterations
		//need to be a compile time constant, so 'c_size' is specified
		//here instead of 'dim', which is not a compile time constant.
                local_out[i][j] += local_in1[i][k]*local_in2[k][j];
            }
        }
    }

    //Burst write from output matrix local_out to DDR memory
    write_out: for(int iter = 0, i = 0, j = 0; iter < dim * dim; iter++, j++){
    //Partitioning the output matrix local_out is not useful because the same element is
    //accessed and processed in all iterations of the innermost loop.
    #pragma HLS loop_tripcount min=c_size*c_size max=c_size*c_size
        if(j == dim){ j = 0; i++; }
        out[iter] = local_out[i][j];
    }
}
