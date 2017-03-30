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

#ifndef RGB_TO_HSV_H_
#define RGB_TO_HSV_H_

//Min and Max Macro Function
#define imin(X, Y) (((X) < (Y)) ? (X) : (Y))
#define imax(X, Y) (((X) > (Y)) ? (X) : (Y))

//Custom Data Type for RGB Image Pixel containing Red(r), Green(g) and Blue(b)
//element. Extra Pad element is added to make struct size to 32bit.
// It is recommended to make custom datatype multiple of 32 bit to use global
// memory access efficiently.
typedef struct RGBcolor_struct
{
  unsigned char r;
  unsigned char g;
  unsigned char b;
  unsigned char a;
 } __attribute__ ((packed, aligned(4))) RGBcolor;


//Custom Data Type for HSV Image Pixel containing Hue(h), Saturation(s),
//and Value(v) element. Extra pad element is added to make struct size to 32bit.
// It is recommended to make custom datatype multiple of 32 bit to use global
// memory access efficiently.
typedef struct HSVcolor_struct
{
  unsigned char h;
  unsigned char s;
  unsigned char v;
  unsigned char a;
 } __attribute__ ((packed, aligned(4))) HSVcolor;

#pragma SDS data zero_copy(in[0:16384],out[0:16384])
void rgb_to_hsv_accel(RGBcolor *in,  // Access global memory as RGBcolor struct-wise
                      HSVcolor *out, // Access Global Memory as HSVcolor struct-wise
                      int size);
#endif
