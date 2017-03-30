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

#include <iostream>
#include <stdio.h>
#include <stdint.h>
#include "bitmap.h"
#include "rgb_to_hsv.h"
#include "sds_lib.h"

#define IMAGE_SIZE 128

//Utility Function Declaration
void sw_RgbToHsv(int* in, int *out, int image_size);
void sw_HsvToRgb(int *in, int *out, int image_size);
int compareImages(int * _in, int * _out, int image_size);

void extract_pixel_data(int *in, RGBcolor *device_input, int size)
{
	for(int i = 0;i < size; i++){
		device_input[i].r = (in[i]) & 0xff;
		device_input[i].g = ( (in[i]) & 0xff00 ) >> 8;
		device_input[i].b = ( (in[i]) & 0xff0000 ) >> 16;
	}
}

void pack_output_int(HSVcolor *in, int *out, int size)
{
	for(int i = 0;i < size; i++){
		out[i] = in[i].h | (in[i].s << 8) | (in[i].v << 16);
	}
}


class perf_counter
{
public:
     uint64_t tot, cnt, calls;
     perf_counter() : tot(0), cnt(0), calls(0) {};
     inline void reset() { tot = cnt = calls = 0; }
     inline void start() { cnt = sds_clock_counter(); calls++; };
     inline void stop() { tot += (sds_clock_counter() - cnt); };
     inline uint64_t avg_cpu_cycles() { return (tot / calls); };
};


int main(int argc, char* argv[])
{
    //Allocate Memory in Host Memory
    int image_size = IMAGE_SIZE * IMAGE_SIZE;

    int *input_bmp = (int *)sds_alloc(sizeof(int) * image_size);

    // Initialize
    for(int i = 0;i < image_size; i++)
    	input_bmp[i] = i * 2;

    size_t image_size_bytes = sizeof(int) * image_size;
    int* swHsvImage  = (int*)(malloc(image_size_bytes)) ;
    int* hwHsvImage  = (int*)(sds_alloc(image_size_bytes)) ;
    int* outRgbImage = (int*)(sds_alloc(image_size_bytes)) ;
    
    // Allocate input and output buffers
    RGBcolor *device_input = (RGBcolor *)(sds_alloc(sizeof(RGBcolor) * image_size));
    HSVcolor *device_output = (HSVcolor *)(sds_alloc(sizeof(HSVcolor) * image_size));

    perf_counter hw_ctr, sw_ctr;

    //Launch the Hardware Funciton
    extract_pixel_data(input_bmp, device_input, image_size);

    hw_ctr.start();
    rgb_to_hsv_accel(device_input, device_output, image_size);
    hw_ctr.stop();

    // Pack the data
    pack_output_int(device_output, hwHsvImage, image_size);

    //Calculating sw based HSV Image
    sw_ctr.start();
    sw_RgbToHsv(input_bmp, swHsvImage, image_size);
    sw_ctr.stop();

    uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
	double speedup = (double) sw_cycles / (double) hw_cycles;

	std::cout << "Average number of CPU cycles running mmult in software: "
		   << sw_cycles << std::endl;
	std::cout << "Average number of CPU cycles running mmult in hardware: "
		   << hw_cycles << std::endl;
	std::cout << "Speed up: " << speedup << std::endl;

    //Compare the results of the Device to the Sw Based
    int match= compareImages(swHsvImage, hwHsvImage, image_size);

    // Release Memory from Host Memory
    sds_free(hwHsvImage);
    free(swHsvImage);
    sds_free(outRgbImage);

    if (match){
        std::cout << "TEST FAILED." << std::endl;
        return EXIT_FAILURE;
    }
    std::cout << "TEST PASSED." << std::endl;
    return EXIT_SUCCESS;
}


//Utility Functions Definitions Start Here

//Convert RGB to HSV Format
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

//Convert RGB to HSV Format
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
            return EXIT_FAILURE;
        }
    }
    return EXIT_SUCCESS;
}

