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

/*****************************************************************************

    This example is intended to demonstrate custom data type usage in hardware
    function. In this example RGB color and HSV color structures are declared
    and used directly from hardware function.

*******************************************************************************/


#include <iostream>
#include <stdio.h>
#include "bitmap.h"
#include "rgb_to_hsv.h"
#include "sds_utils.h"

#define IMAGE_SIZE 128

//Utility Function Declaration
void sw_RgbToHsv(int* in, int *out, int image_size);
void sw_HsvToRgb(int *in, int *out, int image_size);
int compareImages(int * _in, int * _out, int image_size);

void extract_pixel_data(int *in, RGBcolor *hardware_input, int size)
{
    for(int i = 0;i < size; i++){
        hardware_input[i].r = (in[i]) & 0xff;
        hardware_input[i].g = ( (in[i]) & 0xff00 ) >> 8;
        hardware_input[i].b = ( (in[i]) & 0xff0000 ) >> 16;
    }
}

void pack_output_int(HSVcolor *in, int *out, int size)
{
    for(int i = 0;i < size; i++){
        out[i] = in[i].h | (in[i].s << 8) | (in[i].v << 16);
    }
}

int main(int argc, char* argv[])
{
    // Size of synthetic image
    int image_size = IMAGE_SIZE * IMAGE_SIZE;

    // Synthetic Image Data
    int *input_bmp   = (int*)malloc(sizeof(int) * image_size);

    // Input Data Size
    size_t image_size_bytes = sizeof(int) * image_size;

    // Software Output Data
    int* swHsvImage  = (int*)malloc(image_size_bytes);
    int* hwHsvImage  = (int*)malloc(image_size_bytes);

    // Allocate buffers using sds_alloc
    RGBcolor *hardware_input  = (RGBcolor *)(sds_alloc(sizeof(RGBcolor) * image_size));
    HSVcolor *hardware_output = (HSVcolor *)(sds_alloc(sizeof(HSVcolor) * image_size));

    // Check for failed memory allocation
    if((input_bmp == NULL) || (swHsvImage == NULL) || (hwHsvImage == NULL) || (hardware_input == NULL) || (hardware_output == NULL)){
      std::cout << "TEST FAILED : Failed to allocate memory" << std::endl;
      return -1;
    }    

    // Initialize Synthetic Input Data
    for(int i = 0;i < image_size; i++)
    	input_bmp[i] = i * 2;

    sds_utils::perf_counter hw_ctr, sw_ctr;

    extract_pixel_data(input_bmp, hardware_input, image_size);

    hw_ctr.start();
    //Launch the Hardware Function
    rgb_to_hsv_accel(hardware_input, hardware_output, image_size);
    hw_ctr.stop();

    // Pack the data
    pack_output_int(hardware_output, hwHsvImage, image_size);

    //Calculating sw based HSV Image
    sw_ctr.start();
    sw_RgbToHsv(input_bmp, swHsvImage, image_size);
    sw_ctr.stop();

    uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
    double speedup = (double) sw_cycles / (double) hw_cycles;

	std::cout << "Number of CPU cycles running application in software: "
		<< sw_cycles << std::endl;
	std::cout << "Number of CPU cycles running application in hardware: "
		<< hw_cycles << std::endl;
	std::cout << "Speed up: " << speedup << std::endl;

    //Compare the results of the Hardware to the Sw Solution
    int match = compareImages(swHsvImage, hwHsvImage, image_size);

    // Release Memory 
    free(input_bmp);
    free(hwHsvImage);
    free(swHsvImage);
    sds_free(hardware_input);
    sds_free(hardware_output);

    if (match){
        std::cout << "TEST FAILED." << std::endl;
        return -1;
    }
    std::cout << "TEST PASSED." << std::endl;
    return 0;
}


// Utility Functions Definitions Start Here

// Convert RGB to HSV Format
void sw_RgbToHsv(int* in, int *out, int image_size)
{
    RGBcolor rgb;
    HSVcolor hsv;
    for(unsigned int i = 0 ; i < image_size ; out[i] = hsv.h | (hsv.s << 8) | (hsv.v 
        << 16), i++){
        
        rgb.r =  (in[i]) & 0xff;
        rgb.g = ( (in[i]) & 0xff00 ) >> 8 ;
        rgb.b = ( (in[i]) & 0xff0000 ) >> 16 ;
        unsigned char rgbMin, rgbMax;

        rgbMin = imin(rgb.r, (imin(rgb.g,rgb.b)));
        rgbMax = imax(rgb.r, (imax(rgb.g,rgb.b)));

        hsv.v = rgbMax;
        if (hsv.v == 0)
        {
            hsv.h = 0;
            hsv.s = 0;
            continue;
        }

        hsv.s = 255 * ((long)(rgbMax - rgbMin)) / hsv.v;
        if (hsv.s == 0)
        {
            hsv.h = 0;
            continue;
        }

        if (rgbMax == rgb.r)
            hsv.h = 0 + 43 * (rgb.g - rgb.b) / (rgbMax - rgbMin);
        else if (rgbMax == rgb.g)
            hsv.h = 85 + 43 * (rgb.b - rgb.r) / (rgbMax - rgbMin);
        else
            hsv.h = 171 + 43 * (rgb.r - rgb.g) / (rgbMax - rgbMin);
        }
}

// Convert RGB to HSV Format
void sw_HsvToRgb(int *in, int *out, int image_size)
{
    RGBcolor rgb;
    HSVcolor hsv;
    for(int i = 0; i < image_size;out[i] = rgb.r | (rgb.g << 8) | (rgb.b << 16), i++)
    {
        hsv.h = in[i] & 0xff;
        hsv.s = (in[i] & 0xff00) >> 8;
        hsv.v = (in[i] & 0xff0000) >> 16;
        unsigned char region, p, q, t;
        unsigned int h, s, v, remainder;

        if (hsv.s == 0)
        {
            rgb.r = hsv.v;
            rgb.g = hsv.v;
            rgb.b = hsv.v;
            continue;
        }

        // converting to 16 bit to prevent overflow
        h = hsv.h;
        s = hsv.s;
        v = hsv.v;

        region = h / 43;
        remainder = (h - (region * 43)) * 6;

        p = (v * (255 - s)) >> 8;
        q = (v * (255 - ((s * remainder) >> 8))) >> 8;
        t = (v * (255 - ((s * (255 - remainder)) >> 8))) >> 8;

        switch (region)
        {
            case 0:
                rgb.r = v;
                rgb.g = t;
                rgb.b = p;
                break;
            case 1:
                rgb.r = q;
                rgb.g = v;
                rgb.b = p;
                break;
            case 2:
                rgb.r = p;
                rgb.g = v;
                rgb.b = t;
                break;
            case 3:
                rgb.r = p;
                rgb.g = q;
                rgb.b = v;
                break;
            case 4:
                rgb.r = t;
                rgb.g = p;
                rgb.b = v;
                break;
            default:
                rgb.r = v;
                rgb.g = p;
                rgb.b = q;
                break;
        }
    }
}

int compareImages(int * _in, int * _out, int image_size)
{
    for (int i = 0, cnt = 0 ; i < image_size ; i++)
    {
        int in  = _in[i];
        int out = _out[i];
        in  = in  & 0xffffff;
        out = out & 0xffffff;
        if (in != out ){
            cnt++;
            std::cout << "ERROR: Pixel=" << i << " mismatch Expected="
                << in << " and Got=" << out << std::endl;
            return -1;
        }
    }
    return 0;
}

