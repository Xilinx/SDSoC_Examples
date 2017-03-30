/*
# (c) Copyright 2013 - 2016 Xilinx, Inc. All rights reserved.
#
# This file contains confidential and proprietary information of Xilinx, Inc. and
# is protected under U.S. and international copyright and other intellectual
# property laws.
# 
# DISCLAIMER 
# This disclaimer is not a license and does not grant any rights to the materials
# distributed herewith. Except as otherwise provided in a valid license issued to
# you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE
# MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY
# DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
# INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR
# FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether
# in contract or tort, including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature related to, arising
# under or in connection with these materials, including for any direct, or any
# indirect, special, incidental, or consequential loss or damage (including loss
# of data, profits, goodwill, or any type of loss or damage suffered as a result
# of any action brought by a third party) even if such damage or loss was
# reasonably foreseeable or Xilinx had been advised of the possibility of the
# same.
#
# CRITICAL APPLICATIONS
# Xilinx products are not designed or intended to be fail-safe, or for use in any
# application requiring fail-safe performance, such as life-support or safety
# devices or systems, Class III medical devices, nuclear facilities, applications
# related to the deployment of airbags, or any other applications that could lead
# to death, personal injury, or severe property or environmental damage
# (individually and collectively, "Critical Applications").Customer assumes the
# sole risk and liability of any use of Xilinx products in Critical Applications,
# subject only to applicable laws and regulations governing limitations on product
# liability.
#
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT
# ALL TIMES.
*/

/*******************************************************************************
Description:
    This Example to demonstrate HLS Dependence Pragma. Using HLS DEPENDECE pragma
    user can provide additional dependency details to compiler which allow
    compiler to implement unrolling/pipelining with optimized way.
*******************************************************************************/

//Includes
#include <hls_stream.h>
#include <ap_int.h>
#include "mean_value.h"

#define MAX_SIZE 1024
/*
    Vector Mean Value Calculation
    Arguments:
        in   (input)  --> Input Vector
        out  (output) --> Output Mean Vector
        size  (input)  --> Size of Vector in Integer
*/
void mean_value_accel(int *in, int *out, int size)
{
    //Taking double size of MAX_SIZE as same local buffer will be used to store
    //input data as well as result value of mean_value.
    int local_buffer[2 * MAX_SIZE];

    //burst read of input data
    input_read:for (int i = 0 ; i < size ; i++){
    #pragma HLS PIPELINE
    #pragma HLS LOOP_TRIPCOUNT min=256 max=256
        local_buffer[i] = in[i];
    }

    //Calculating Mean Value
    calc_mv:for (int i = 1 ; i < size -1 ; i++) {
    #pragma HLS LOOP_TRIPCOUNT min=254 max=254
    #pragma HLS DEPENDENCE variable=local_buffer inter false
    //HLS Dependence pragma provide extra dependency information to compiler.
    //For example here local_buffer has false inter dependency. Which means
    //each iteration of loop is independent for local_buffer access.
    //It allow compiler to ignore dependency of local_buffer and generate
    //a pipeline with lower II count. If user do not provide this pragma, compiler
    //will assume a dependency of local_buffer across iteration and will try to 
    //schedule accordingly. 
    //As a result, compiler will increase the loop II and will reduce
    //the performance.
        local_buffer[i + MAX_SIZE] = (local_buffer[i-1] + local_buffer[i] + 
                                     local_buffer[i+1])/3;
    }

    //Calculating Average for Boundary Case values
    local_buffer[MAX_SIZE]  = (local_buffer[0] + local_buffer[1]) / 2 ;
    local_buffer[MAX_SIZE + size-1] = (local_buffer[size-1] + 
                                      local_buffer[size-2]) /2 ;

    //burst Write of result
    output_write:for (int i = 0 ; i < size ; i++){
    #pragma HLS PIPELINE
    #pragma HLS LOOP_TRIPCOUNT min=254 max=254
        out[i] = local_buffer[i+MAX_SIZE];
    }
}
