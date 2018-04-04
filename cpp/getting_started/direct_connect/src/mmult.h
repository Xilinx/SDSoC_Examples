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

// Maximum times run example 
#define MAX_NUM_TIMES 2

#pragma SDS data access_pattern(in1:SEQUENTIAL, in2:SEQUENTIAL, out:SEQUENTIAL)
void mmult_accel(
                    const int *in1,     // Read-Only Matrix 1
                    const int *in2,     // Read-Only Matrix 2
                    int *out,           // Output Matrix
                    int dim             // Size of one dimension of the matrices
                );

#pragma SDS data access_pattern(mmult_in:SEQUENTIAL, in3:SEQUENTIAL, out:SEQUENTIAL)
void madd_accel(
                const int *mmult_in,    // Read-Only Matrix
                const int *in3,         // Read-Only Matrix
                int *out,               // Output Matrix
                int dim                 // Size of one dimension of the matrices
               );

#endif
