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
    
    Wide Memory Access Example using struct data type of 128bit size
    
    This is vector addition example to demonstrate Wide Memory access of 128bit 
    data width using struct datatype of 128bit size

*******************************************************************************/
#include "vadd.h"

//Memory Datawidth of accelerator is calculated based on argument type.
//Here argument type of in1 and in2 is wide_dt which is 128bit wide, so memory
//interface will be created to 128bit wide. 
void vadd_accel(
        const wide_dt *in1, // Read-Only Vector 1
        const wide_dt *in2, // Read-Only Vector 2
        wide_dt *out,       // Output Result
        int size            // Size of total elements
        )
{
    vadd:for(int i = 0; i < size;  ++i)
    {
        //Pipelined this loop which will eventually infer burst read/write
        //for in1, in2 and out as access pattern is sequential
        #pragma HLS pipeline
        #pragma HLS LOOP_TRIPCOUNT min=c_size max=c_size
        wide_dt tmpV1     = in1[i];
        wide_dt tmpV2     = in2[i];
        wide_dt tmpOut;
        for (int k = 0 ; k < NUM_ELEMENTS ; k++){
            //As Upper loop "vadd" is marked for Pipeline so this loop 
            //will be unrolled and will do parallel vector addition for 
            //all elements of structure.
            tmpOut.data[k] = tmpV1.data[k] + tmpV2.data[k];
        }
        out[i] = tmpOut;
    }
}
