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

    C Kernel to showcase 2 parallel read/write from  Local Memory
    Description: This is vector addition to demonstrate how to utilized both
    ports of Local Memory.

*******************************************************************************/

#include <string.h>
#include "vadd.h"

#define BUFFER_SIZE 1024

/*
    Vector Addition Kernel Implementation
    Arguments:
        in1   (input)     --> Input Vector1
        in2   (input)     --> Input Vector2
        out   (output)    --> Output Vector
        size  (input)     --> Size of Vector in Integer
*/
void vadd_accel(
        const unsigned int *in1, // Read-Only Vector 1
        const unsigned int *in2, // Read-Only Vector 2
        unsigned int *out,       // Output Result
        int size                   // Size in integer
        )
{
    unsigned int v1_buffer[BUFFER_SIZE];    // Local memory to store vector1
    unsigned int v2_buffer[BUFFER_SIZE];    // Local memory to store vector2
    unsigned int vout_buffer[BUFFER_SIZE];  // Local Memory to store result

    //Per iteration of this loop perform BUFFER_SIZE vector addition
    for(int i = 0; i < size;  i += BUFFER_SIZE)
    {
    #pragma HLS LOOP_TRIPCOUNT min=4 max=4
        int chunk_size = BUFFER_SIZE;
        //boundary checks
        if ((i + BUFFER_SIZE) > size)
            chunk_size = size - i;

        // burst read of v1 and v2 vector from global memory
        for (int j = 0 ; j < chunk_size ; j++){
        #pragma HLS LOOP_TRIPCOUNT min=1024 max=1024
            v1_buffer[j] = in1[i + j];
        }
        for (int j = 0 ; j < chunk_size ; j++){
        #pragma HLS LOOP_TRIPCOUNT min=1024 max=1024
            v2_buffer[j] = in2[i + j];
        }

        // FPGA implementation, local array is mostly implemented as BRAM Memory 
        // block.
        // BRAM Memory Block contains two memory ports which allow two parallel 
        // access to memory. To utilized both ports of BRAM block,
        // vector addition loop is unrolled with factor of 2. 
        // It is equivalent to following code:
        //  for (int j = 0 ; j < chunk_size ; j+= 2){
        //    vout_buffer[j]   = v1_buffer[j] + v2_buffer[j];
        //    vout_buffer[j+1] = v1_buffer[j+1] + v2_buffer[j+1];
        //  }
        // Which means two iterations of loop will be executed together and as a 
        // resutl it will double the performance.
        vadd: for (int j = 0 ; j < chunk_size; j ++){
        #pragma HLS PIPELINE
        #pragma HLS UNROLL FACTOR=2
        #pragma HLS LOOP_TRIPCOUNT min=1024 max=1024
            //perform vector addition
            vout_buffer[j] = v1_buffer[j] + v2_buffer[j];
        }

        //burst write the result
        for (int j = 0 ; j < chunk_size ; j++){
        #pragma HLS LOOP_TRIPCOUNT min=1024 max=1024
            out[i + j] = vout_buffer[j];
        }
    }
}
