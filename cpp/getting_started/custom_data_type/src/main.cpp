/**********
Copyright (c) 2018, Xilinx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**********/

/*****************************************************************************

    This example is intended to demonstrate custom data type usage in hardware
    function. In this example RGB color and HSV color structures are declared
    and used directly from hardware function.

*******************************************************************************/


#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include "rgb_to_hsv.h"
#include "sds_utils.h"

#ifndef NUM_TIMES
#define NUM_TIMES 2  
#endif

//Utility Function Declaration
void sw_RgbToHsv(RGBcolor *in, HSVcolor *out, int image_size);
int compareImages(unsigned int *in, unsigned int *out, int image_size);

int main(int argc, char* argv[])
{
    // Size of synthetic image
    int image_size = IMAGE_DIM * IMAGE_DIM;

    // Allocate buffers using sds_alloc and malloc
    RGBcolor *rgbImage   = (RGBcolor *)(sds_alloc(sizeof(RGBcolor) * image_size));
    HSVcolor *hwHsvImage = (HSVcolor *)(sds_alloc(sizeof(HSVcolor) * image_size));
    HSVcolor *swHsvImage = (HSVcolor *)(malloc(sizeof(HSVcolor) * image_size));

    // Check for failed memory allocation
    if((swHsvImage == NULL) || (hwHsvImage == NULL) || (rgbImage == NULL)){
      std::cout << "TEST FAILED : Failed to allocate memory" << std::endl;
      return -1;
    }    

    sds_utils::perf_counter hw_ctr, sw_ctr;
    bool match;

    for (int i = 0; i < NUM_TIMES; i++)
    {
        // Initialize Test Input Data randomly
        for(int i = 0;i < image_size; i++){
            rgbImage[i].r = rand() % 256 ;
            rgbImage[i].g = rand() % 256 ;
            rgbImage[i].b = rand() % 256 ;
            rgbImage[i].pad = 0;
        }

        hw_ctr.start();
        //Launch the Hardware Function
        rgb_to_hsv_accel(rgbImage, hwHsvImage, image_size);
        hw_ctr.stop();

        //Calculating sw based HSV Image
        sw_ctr.start();
        sw_RgbToHsv(rgbImage, swHsvImage, image_size);
        sw_ctr.stop();

        //Compare the results of the Hardware to the Sw Solution
        match = compareImages((unsigned int *)swHsvImage, 
                (unsigned int *)hwHsvImage, image_size);

    }

    uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
    double speedup = (double) sw_cycles / (double) hw_cycles;

    std::cout << "Number of CPU cycles running application in software: "
        << sw_cycles << std::endl;
    std::cout << "Number of CPU cycles running application in hardware: "
        << hw_cycles << std::endl;
    std::cout << "Speed up: " << speedup << std::endl;
    std::cout << "Note: Speed up is meaningful for real hardware execution only, not for emulation." << std::endl;

    // Release Memory 
    free(swHsvImage);
    sds_free(rgbImage);
    sds_free(hwHsvImage);

    if (match){
        std::cout << "TEST FAILED." << std::endl;
        return -1;
    }
    std::cout << "TEST PASSED." << std::endl;
    return 0;
}


// Utility Functions Definitions Start Here

// Convert RGB to HSV Format
void sw_RgbToHsv(RGBcolor* in, HSVcolor *out, int image_size)
{
    for(int i = 0 ; i < image_size; i++){
        unsigned char rgbMin, rgbMax, tempS;

        RGBcolor rgb = in[i];
        HSVcolor hsv;

        rgbMin = imin(rgb.r, (imin(rgb.g,rgb.b)));
        rgbMax = imax(rgb.r, (imax(rgb.g,rgb.b)));

        tempS = 255 * ((long)(rgbMax - rgbMin)) / rgbMax;

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

        hsv.pad = rgb.pad;

        out[i] = hsv;
    }
}

int compareImages(unsigned int *img1, unsigned int *img2, int image_size)
{
    for (int i = 0, cnt = 0 ; i < image_size ; i++)
    {
        unsigned int in  = img1[i];
        unsigned int out = img2[i];
        if (in != out ){
            cnt++;
            std::cout << "ERROR: Pixel=" << i << " mismatch Expected="
               <<  std::hex << in << " and Got=" << out << std::endl;
            return -1;
        }
    }
    return 0;
}
