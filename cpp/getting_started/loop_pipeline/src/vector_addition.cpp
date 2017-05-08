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

/**********************************************************************************
   Loop Pipelining

   Pipelining is a form of parallelism that allows the FPGA to reuse the
   hardware for the next instruction before the current instruction has finished
   processing. This maximizes the utilization of the FPGA fabric and allows the
   processing of multiple elements of data at the same time.

   In this example we will demonstrate ways to improve the throughput of a
   vector addition hardware function using the HLS PIPELINE pragma.
************************************************************************************/

#define N 128
#include "vector_addition.h"

void vadd_pipelined_accel(int *a, int *b, int *c, const int len)
{
    //Local buffer size is restricted to N size
    int result[N];
    
    int iterations = len / N;
    for(int i = 0; i < iterations; i++) {
        #pragma HLS PIPELINE
        #pragma HLS LOOP_TRIPCOUNT min=1 max=8
        int chunk_size = N;

        //Boundary Check
        if (i + chunk_size > len) chunk_size = len-i;

        read_a:
        for (int x=0; x<chunk_size; ++x) {
            #pragma HLS LOOP_TRIPCOUNT min=128 max=128
            #pragma HLS PIPELINE
            //Loop will do burst read from A due to pipeline pragma
            result[x] = a[i*N+x];
        }
        
        read_b:
        for (int x=0; x<chunk_size; ++x) {
            #pragma HLS LOOP_TRIPCOUNT min=128 max=128
            #pragma HLS PIPELINE
            //Loop will do burst read from B due to pipeline pragma
            result[x] += b[i*N+x];
        }

        write:
        for (int x=0; x<chunk_size; ++x) {
            #pragma HLS LOOP_TRIPCOUNT min=128 max=128
            #pragma HLS PIPELINE
            //Loop will do burst write to C due to pipeline pragma
            c[i*N+x] = result[x];
        }
    }
}
