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

/*******************************************************************************
    
    This example intends to demonstrate HLS Dependence Pragma.
    Using "HLS DEPENDECE" pragma user can provide additional dependency 
    details to compiler which allows compiler to implement unrolling/pipelining 
    in optimized manner.
*******************************************************************************/

#include <hls_stream.h>
#include "vconv.h"

// Read Data from DDR Memory and write into Stream inStream
static void read_input(int *in, hls::stream<int> &inStream,
        int size)
{
    mem_rd: for (int i = 0 ; i < size ; i++){
    #pragma HLS pipeline
    #pragma HLS LOOP_TRIPCOUNT min=c_image_size max=c_image_size
        //Blocking write command to inStream 
        inStream << in[i];
    }
}

// Read Input data from inStream and write the result into outStream
static void vconv_compute(hls::stream<int> &inStream , 
        hls::stream<int> &outStream, int height, int width)
{
    int linebuf[K - 1][MAX_COLS];
    #pragma HLS ARRAY_PARTITION variable=linebuf dim=1 complete
    VConvH:for(int col = 0; col < height; col++) {
        VConvW:for(int row = 0; row < width; row++) {
        #pragma HLS DEPENDENCE variable=linebuf inter false
        #pragma HLS PIPELINE
        // HLS Dependence pragma provides extra dependency information to compiler.
        // For example here linebuf has false inter dependency. Which means
        // each iteration of loop is independent for linebuf access.
        // It allows compiler to ignore dependency of linebuf and generate
        // a pipeline with lower II count. 

        // If user does not provide this pragma, by default compiler assumes
        // dependency exists on linebuf between iterations. As a result, 
        // compiler schedules unoptimized design with larger II factor
        // which in turn leads to slow performance.
            int in_val  = inStream.read();
            int out_val = 0;
            VConv:for(int i = 0; i < K; i++) {
                int vwin_val = i < (K - 1) ? linebuf[i][row] : in_val;
                out_val += vwin_val * vcoeff[i];
                if (i > 0)
                    linebuf[i - 1][row] = vwin_val;
            }
            if (col >= (K - 1))
                outStream << out_val;
        }
    }
}

// Read result from outStream and write the result to Global Memory
static void write_result(int *out, hls::stream<int> &outStream , 
        int size)
{
    mem_wr: for (int i = 0 ; i < size ; i++){
    #pragma HLS pipeline
    #pragma HLS LOOP_TRIPCOUNT min=c_image_size max=c_image_size
        //Blocking read command to outStream 
        out[i] = outStream.read();
    }
}

void vconv_hw(int *in, int *out, int height, int width)
{
    int vconv_height = height - (K-1);
    int vconv_size = vconv_height * width;

    hls::stream<int> inStream;
    hls::stream<int> outStream;
    #pragma HLS STREAM variable=inStream  depth=32
    #pragma HLS STREAM variable=outStream depth=32

    #pragma HLS dataflow
    //dataflow pragma instruct compiler to run following three APIs in parallel
    read_input(in,inStream,height * width );
    vconv_compute(inStream,outStream,height,width);
    write_result(out,outStream,vconv_size);
}
