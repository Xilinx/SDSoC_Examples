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
    
        This example demonstrate How a Custom data type can used in Kernel code.
        Here RGBcolor and HSVcolor two structure is declared and used as global
        memory access type.
        
*******************************************************************************/


#include "rgb_to_hsv.h"
#define IMAGE_SIZE 128

void rgb_to_hsv_accel(RGBcolor *in,  // Access global memory as RGBcolor struct-wise
                      HSVcolor *out, // Access Global Memory as HSVcolor struct-wise
                      int size)
{
    RGBcolor rgb;
	HSVcolor hsv;

    //Single loop is sufficient to read each RGB pixel from Global memory,
    //Converting RGB pixel to HSV Pixel, and writing HSV Pixel Back to Global
    //Memory.
    rgb2hsv_loop: for(unsigned int i = 0 ; i < size ; i ++){
#pragma HLS pipeline
        // Loop is marked for pipeline. Compiler will be able to get Loop II=1
        // as a result, Kernel will be able to do burst read and burst write.
        // Kernel will be performing RGB to HSV conversion per pixel per clock.
#pragma HLS LOOP_TRIPCOUNT min=16384 max=16384
        // LOOP TRIPCOUNT is added so that report estimate can provide estimated
        //  latency Information

        unsigned char rgbMin, rgbMax, tempS;

        rgb = in[i];

        //Getting Minimum and Maximum value in R, G, and B element of Pixel
        rgbMin = imin(rgb.r, (imin(rgb.g,rgb.b)));
        rgbMax = imax(rgb.r, (imax(rgb.g,rgb.b)));

        //Calculating TempS
        tempS = 255 * ((long)(rgbMax - rgbMin)) / rgbMax;

        //Algorithm to Calculate HSV from RSB
        if (rgbMax == 0){
            hsv.h = 0;
            hsv.s = 0;
            hsv.v = 0;
        }else if (tempS == 0){
            hsv.h = 0;
            hsv.s = 0;
            hsv.v = rgbMax;
        }else if (rgbMax == rgb.r){
            hsv.h = 0 + 43 * (rgb.g - rgb.b) / (rgbMax - rgbMin);
            hsv.s = tempS;
            hsv.v = rgbMax;
        }else if (rgbMax == rgb.g){
            hsv.h = 85 + 43 * (rgb.b - rgb.r) / (rgbMax - rgbMin);
            hsv.s = tempS;
            hsv.v = rgbMax;
        }else{
            hsv.h = 171 + 43 * (rgb.r - rgb.g) / (rgbMax - rgbMin);
            hsv.s = tempS;
            hsv.v = rgbMax;
        }

        //Writing computed HSV Pixel value into Global Memory
        out[i] = hsv;
    }
}
