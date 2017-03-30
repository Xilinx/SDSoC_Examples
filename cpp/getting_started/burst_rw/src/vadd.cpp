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
    
        HLS Example using AXI4-master interface for burst read and write
        
*******************************************************************************/

//Includes
#include <stdio.h>
#include <string.h>
#include "vadd.h"
//define internal buffer max size
#define BURSTBUFFERSIZE 2048

#define DATA_SIZE 256
#define INCR_VALUE 10

void vadd_accel(int *a, int size, int inc_value, int *out){

    int burstbuffer[BURSTBUFFERSIZE];

    //Per iteration of this loop perform BURSTBUFFERSIZE vector addition
    for(int i=0; i < size;  i+=BURSTBUFFERSIZE)
    {
    #pragma HLS LOOP_TRIPCOUNT min=1 max=64
        int chunk_size = BURSTBUFFERSIZE;
        //boundary checks
        if ((i + BURSTBUFFERSIZE) > size)
            chunk_size = size - i;

        // memcpy creates a burst access to memory
        // multiple calls of memcpy cannot be pipelined and will be scheduled 
        // sequentially
        // memcpy requires a local buffer to store the results of the memory 
        // transaction

        for(int k=0; k < chunk_size; k++){
        #pragma HLS LOOP_TRIPCOUNT min=256 max=2048
            burstbuffer[k] = a[i+k];
        }

        // calculate and write results to global memory, the sequential write in a 
        // for loop can be inferred to a memory burst access automatically
        calc_write: for(int j=0; j < chunk_size; j++){
        #pragma HLS LOOP_TRIPCOUNT min=256 max=2048
        #pragma HLS PIPELINE
            burstbuffer[j] = burstbuffer[j] + inc_value;
            out[i+j] = burstbuffer[j];
        }
    }
}

