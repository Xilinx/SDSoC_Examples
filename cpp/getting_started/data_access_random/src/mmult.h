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
#ifndef MMULT_H_
#define MMULT_H_

// Size of the input array
#define DATA_SIZE 32 

// Maximum Supported Size
#define MAX_SIZE 64

// Max Number of times to run
#define NUM_TIMES 2

//TRIPCOUNT indentifier
const unsigned int c_min = 1;
const unsigned int c_max = DATA_SIZE;

// By default access_pattern is RANDOM, to highlight, the access pattern is explicitly declared
#pragma SDS data copy(in1[0:dim*dim], in2[0:dim*dim], out[0:dim*dim])
#pragma SDS data access_pattern(in1:RANDOM, in2:RANDOM, out:RANDOM)
void mmult_accel(
                    const int in1[MAX_SIZE * MAX_SIZE],     // Read-Only Matrix 1
                    const int in2[MAX_SIZE * MAX_SIZE],     // Read-Only Matrix 2
                    int out[MAX_SIZE * MAX_SIZE],           // Output Result
                    int dim             // Size of one dimension of the matrices
                );

#endif
