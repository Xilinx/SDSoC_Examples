/*********** 
# Copyright (c) 2017, Xilinx, Inc. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without 
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
# 
# 3. Neither the name of the copyright holder nor the names of its contributors
# may be used to endorse or promote products derived from this software
# without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.
#
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY 
# DIRECT, INDIRECT,INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO,PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# 
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY,OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT 
# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
************/

/*******************************************************************************
    
    Wide Memory Access Example using ap_uint<Width> data type
    
    This is vector addition example to demonstrate Wide Memory
    access of 128bit data width using ap_uint<128> data type which is defined
    inside 'ap_int.h' file.

*******************************************************************************/

#include "vadd.h"

//Memory Datawidth of accelerator is calculated based on argument type.
//Here argument type of in1 and in2 is wide_dt which is 128bit wide, so memory
//interface will be created to 128bit wide. 
void vadd_accel(
        const wide_dt *in1, // Read-Only Vector 1
        const wide_dt *in2, // Read-Only Vector 2
        wide_dt *out,       // Output Result
        int size            // Size of total elements
        )
{
    wide_dt v1_local[BUFFER_SIZE];       // Local memory to store vector1
    wide_dt result_local[BUFFER_SIZE];   // Local Memory to store result

    // Each iteration of this loop performs BUFFER_SIZE vector addition
    // operations
    for(int i = 0; i < size;  i += BUFFER_SIZE)
    {
        #pragma HLS LOOP_TRIPCOUNT min=8 max=8
        int chunk_size = BUFFER_SIZE;

        // Boundary checks
        if ((i + BUFFER_SIZE) > size)
            chunk_size = size - i;

        // Burst read first vector from DDR memory to local memory
        v1_rd: for (int j = 0 ; j <  chunk_size; j++){
        #pragma HLS pipeline
        #pragma HLS LOOP_TRIPCOUNT min=32 max=32
            v1_local[j] = in1 [i + j];
        }

        // Burst read second vector and perform vector addition
        v2_rd_add: for (int j = 0 ; j < chunk_size; j++){
        #pragma HLS pipeline
        #pragma HLS LOOP_TRIPCOUNT min=32 max=32
            wide_dt tmpV1     = v1_local[j];
            wide_dt tmpV2     = in2[i+j];
            // Vector addition 
            result_local[j] = tmpV1 + tmpV2;
        }

        // Burst write the result to DDR memory
        out_write: for (int j = 0 ; j < chunk_size; j++){
        #pragma HLS pipeline
        #pragma HLS LOOP_TRIPCOUNT min=32 max=32
            out[i+j] = result_local[j];
       }
    }
}
