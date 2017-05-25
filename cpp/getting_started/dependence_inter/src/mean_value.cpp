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
    
    This example intends to demonstrate HLS Dependence Pragma.
    Using "HLS DEPENDECE" pragma user can provide additional dependency 
    details to compiler which allows compiler to implement unrolling/pipelining 
    in optimized manner.
    
                "Vector Mean Value Calculation"
    
    Arguments:
        in   (input)  --> Input Vector
        out  (output) --> Output Mean Vector
        size (input)  --> Size of Vector in Integer

*******************************************************************************/

#include "mean_value.h"

#define MAX_SIZE 1024

void mean_value_accel(int *in, int *out, int size)
{
    // Local Buffer is declared double to store both input and output data
    int local_buffer[2 * MAX_SIZE];

    // Burst read of input data from DDR memory
    input_read:for (int i = 0 ; i < size ; i++){
    #pragma HLS PIPELINE
    #pragma HLS LOOP_TRIPCOUNT min=256 max=256
        local_buffer[i] = in[i];
    }

    // Calculating Mean Value
    calc_mv:for (int i = 1 ; i < size -1 ; i++) {
    #pragma HLS LOOP_TRIPCOUNT min=254 max=254
    #pragma HLS DEPENDENCE variable=local_buffer inter false
    // HLS Dependence pragma provides extra dependency information to compiler.
    // For example here local_buffer has false inter dependency. Which means
    // each iteration of loop is independent for local_buffer access.
    // It allows compiler to ignore dependency of local_buffer and generate
    // a pipeline with lower II count. 

    // If user fails to provide this pragma, by default compiler assumes
    // dependency exists on local_buffer for entire iteration. 
    
    // As a result, compiler schedules unoptimized design with larger II factor
    // which in turn leads to drop in performance.
        local_buffer[i + MAX_SIZE] = (local_buffer[i-1] + local_buffer[i] + 
                                     local_buffer[i+1])/3;
    }

    // Calculating average for Boundary Case values
    local_buffer[MAX_SIZE]  = (local_buffer[0] + local_buffer[1]) / 2 ;
    local_buffer[MAX_SIZE + size-1] = (local_buffer[size-1] + 
                                      local_buffer[size-2]) /2 ;

    // Burst write of results back to DDR memory
    output_write:for (int i = 0 ; i < size ; i++){
    #pragma HLS PIPELINE
    #pragma HLS LOOP_TRIPCOUNT min=254 max=254
        out[i] = local_buffer[i+MAX_SIZE];
    }
}
