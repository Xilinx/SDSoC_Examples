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

void mmult_hw(int in1[DATA_SIZE * DATA_SIZE], int in2[DATA_SIZE * DATA_SIZE], int out[DATA_SIZE * DATA_SIZE], int dim)
{
    //loop tripcount constant
    const int c_size = DATA_SIZE;

    //Reads the data from DDR, performs the computation
    //and writes back the result to DDR.
    for (int i = 0 ; i < dim ; i++){
    #pragma HLS loop_tripcount min=c_size max=c_size
    	//In cases where the loop latency is unknown or cannot be calculated
    	//due to variable loop boundaries, the loop_tripcount pragma tells the HLS compiler
    	//about the minimum and maximum iterations for a loop.
        for(int j = 0; j < dim; j++){
        #pragma HLS loop_tripcount min=c_size max=c_size
            int result = 0;
            for(int k = 0; k < dim; k++){
       	    #pragma HLS loop_tripcount min=c_size max=c_size
                 result += in1[i * dim + k] * in2[k * dim + j];
            }
            out[i*dim +j] = result;
        }
    }
}
