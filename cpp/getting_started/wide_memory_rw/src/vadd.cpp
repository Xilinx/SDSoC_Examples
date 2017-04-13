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
    Wide Memory Access Example using ap_uint<Width> datatype
    Description: This is vector addition example to demonstrate Wide Memory
    access of 512bit Datawidth using ap_uint<> datatype which is defined inside
    'ap_int.h' file.
*******************************************************************************/

#include "vadd.h"

/*
    Vector Addition Kernel Implementation using uint512_dt datatype
    Arguments:
        in1   (input)     --> Input Vector1
        in2   (input)     --> Input Vector2
        out   (output)    --> Output Vector
        size  (input)     --> Size of Vector in Integer
   */
void vadd_accel(
        const uint128_dt *in1, // Read-Only Vector 1
        const uint128_dt *in2, // Read-Only Vector 2
        uint128_dt *out,       // Output Result
        int size               // Size in integer
        )
{
    uint128_dt v1_local[BUFFER_SIZE];    // Local memory to store vector1
    uint128_dt result_local[BUFFER_SIZE];// Local Memory to store result

    // Input vector size for interger vectors. However kernel is directly
    // accessing 512bit data (total 16 elements). So total number of read
    // from global memory is calculated here:
    int size_in16 = (size-1) / VECTOR_SIZE + 1;

    //Per iteration of this loop perform BUFFER_SIZE vector addition
    for(int i = 0; i < size_in16;  i += BUFFER_SIZE)
    {
        #pragma HLS LOOP_TRIPCOUNT min=8 max=8
        int chunk_size = BUFFER_SIZE;

        //boundary checks
        if ((i + BUFFER_SIZE) > size_in16)
            chunk_size = size_in16 - i;

        //burst read first vector from global memory to local memory
        v1_rd: for (int j = 0 ; j <  chunk_size; j++){
        #pragma HLS pipeline
        #pragma HLS LOOP_TRIPCOUNT min=32 max=32
            v1_local[j] = in1 [i + j];
        }

        //burst read second vector and perform vector addition
        v2_rd_add: for (int j = 0 ; j < chunk_size; j++){
        #pragma HLS pipeline
        #pragma HLS LOOP_TRIPCOUNT min=32 max=32
            uint128_dt tmpV1     = v1_local[j];
            uint128_dt tmpV2     = in2[i+j];
            result_local[j] = tmpV1 + tmpV2; // Vector Addition Operation
        }

        //burst write the result
        out_write: for (int j = 0 ; j < chunk_size; j++){
        #pragma HLS pipeline
        #pragma HLS LOOP_TRIPCOUNT min=32 max=32
            out[i+j] = result_local[j];
       }
    }
}
