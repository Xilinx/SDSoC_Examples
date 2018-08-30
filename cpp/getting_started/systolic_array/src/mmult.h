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

// Array Size to access
#define DATA_SIZE 12

// Maximum Array Size
#define MAX_SIZE 12

//TRIPCOUNT identifier
const unsigned int c_dim = DATA_SIZE;

// Pragma below Specifies sds++ Compiler to Generate a Programmable Logic Design
// Which has Direct Memory Interface with DDR and PL.  
#pragma SDS data zero_copy(a[0:a_row*a_col], b[0:a_col*b_col], c[0:a_row*b_col])
void mmult_accel(
                    const int *a,   // Read-Only Matrix A
                    const int *b,   // Read-Only Matrix B
                    int *c,         // Output Result
                    int a_row,      // Matrix A Row Size
                    int a_col,      // Matrix A Col Size
                    int b_col       // Matrix B Col Size
                );
#endif
