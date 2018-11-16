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
#ifndef VADD_VMUL_H_
#define VADD_VMUL_H_

// Size of the input array
#define TEST_DATA_SIZE 4096

// Maximum times run example 
#define NUM_TIMES 4

//TRIPCOUNT identifiers
const unsigned int c_size_min = 1;
const unsigned int c_size_max = TEST_DATA_SIZE;

#pragma SDS data zero_copy(in1[0:dim], in2[0:dim], out[0:dim])
void vadd_accel(
                    const int *in1,     // Read-Only Vector 1
                    const int *in2,     // Read-Only Vector 2
                    int *out,           // Output Vector
                    int dim             // Size of dimension of the vector
                );

#pragma SDS data zero_copy(in1[0:dim], in2[0:dim], out[0:dim])
void vmul_accel(
                const int *in1,         // Read-Only Vector 1
                const int *in2,         // Read-Only Vector 2
                int *out,               // Output Vector
                int dim                 // Size of dimension of the vector
               );

#endif
