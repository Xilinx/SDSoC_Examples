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

    Hardware Function to showcase 2 parallel read/write from  Local Memory.
    This is vector addition to demonstrate how to utilized both
    ports of Local Memory.

*******************************************************************************/

#include <string.h>
#include "vadd.h"

void vadd_accel(
        const int *in1, // Read-Only Vector 1
        const int *in2, // Read-Only Vector 2
        int *out,       // Output Result
        int size                 // Size in integer
        )
{
    int v1_buffer[BUFFER_SIZE];    // Local memory to store vector1
    int v2_buffer[BUFFER_SIZE];    // Local memory to store vector2
    int vout_buffer[BUFFER_SIZE];  // Local Memory to store result

    // Each iteration of this loop performs BUFFER_SIZE vector additions
    for(int i = 0; i < size;  i += BUFFER_SIZE)
    {
    #pragma HLS LOOP_TRIPCOUNT min=c_size max=c_size
        int chunk_size = BUFFER_SIZE;
        // Boundary check
        if ((i + BUFFER_SIZE) > size)
            chunk_size = size - i;

        // Burst read of v1 and v2 vector from DDR memory
        // Utilize multiple interfaces to access data concurrently
        read_input: for (int j = 0 ; j < chunk_size ; j++){
        #pragma HLS PIPELINE
        #pragma HLS LOOP_TRIPCOUNT min=c_chunk_sz max=c_chunk_sz
            v1_buffer[j] = in1[i + j];
            v2_buffer[j] = in2[i + j];
        }
        // FPGA implementation, local array is mostly implemented as BRAM Memory 
        // block.
        // BRAM Memory Block contains two memory ports which allow two parallel 
        // access to memory. To utilize both the ports of BRAM block,
        // vector addition loop is unrolled with factor of 2. 
        // It is equivalent to following code:
        //  for (int j = 0 ; j < chunk_size ; j+= 2){
        //    vout_buffer[j]   = v1_buffer[j] + v2_buffer[j];
        //    vout_buffer[j+1] = v1_buffer[j+1] + v2_buffer[j+1];
        //  }
        // Which means two iterations of loop will be executed together and as a 
        // result it will double the improvement in performance.
        vadd: for (int j = 0 ; j < chunk_size; j ++){
        #pragma HLS PIPELINE
        #pragma HLS UNROLL FACTOR=2
        #pragma HLS LOOP_TRIPCOUNT min=c_chunk_sz max=c_chunk_sz
            // Perform vector addition
            vout_buffer[j] = v1_buffer[j] + v2_buffer[j];
        }

        // Burst write the result to DDR memory
        write_output:for (int j = 0 ; j < chunk_size ; j++){
        #pragma HLS PIPELINE
        #pragma HLS LOOP_TRIPCOUNT min=c_chunk_sz max=c_chunk_sz
            out[i + j] = vout_buffer[j];
        }
    }
}   
