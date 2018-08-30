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
#ifndef VADD_H_
#define VADD_H_

#define NUM_ELEMENTS   4 // To make structure size 128bit
//Structure overall width is set to 4 Integers = 4 *32 = 128bit to match to
//Zynq ultrascale Memory Interface Datawidth to get the optimum memory access 
//performance.
typedef struct wide_dt_struct{
    int data[NUM_ELEMENTS];
} __attribute__ ((packed, aligned(4))) wide_dt;

#define DATA_SIZE 16384

//TRIPCOUNT identifier
const unsigned int c_size = DATA_SIZE/NUM_ELEMENTS;

// Pragma below Specifies sds++ Compiler to Generate a Programmable Logic Design
// Which has Direct Memory Interface with DDR and PL.  
#pragma SDS data zero_copy(in1[0:size],in2[0:size],out[0:size])
void vadd_accel(const wide_dt *in1, // Read-Only Vector 1
                const wide_dt *in2, // Read-Only Vector 2
                wide_dt *out,       // Output Result
                int size               // Size in integer
               );
#endif
