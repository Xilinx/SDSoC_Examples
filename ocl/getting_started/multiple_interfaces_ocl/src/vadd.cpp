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

extern "C"{
void vadd_accel(
        int* a,
        int* b,
        int* c,
        const int length) {

        //TRIPCOUNT identifier
	const unsigned int c_size = length;

        // Using Separate interface bundle gmem0 and gmem1 for both argument
        // a and b, same interface bundle gmem0 is used for a and c since both
        // read and write can happen simultaneously. It will allow user to 
        // create two separate interfaces and as a result allow kernel to 
        // access both interfaces simultaneous. 
        #pragma HLS INTERFACE m_axi port=a offset=slave bundle=gmem0
        #pragma HLS INTERFACE m_axi port=b offset=slave bundle=gmem1
        #pragma HLS INTERFACE m_axi port=c offset=slave bundle=gmem0
        #pragma HLS INTERFACE s_axilite port=a bundle=control
        #pragma HLS INTERFACE s_axilite port=b bundle=control
        #pragma HLS INTERFACE s_axilite port=c bundle=control
        #pragma HLS INTERFACE s_axilite port=length bundle=control
        #pragma HLS INTERFACE s_axilite port=return bundle=control

        multiple_interfaces:
            for(int i=0; i < length; i++) {
                #pragma HLS PIPELINE
                #pragma HLS LOOP_TRIPCOUNT min=c_size max=c_size
                c[i] = a[i] + b[i];
        }
    return;
    }
}
