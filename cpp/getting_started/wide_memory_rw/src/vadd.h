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

#ifndef VADD_H_
#define VADD_H_
#include <ap_int.h>

#define BUFFER_SIZE 32 
#define DATAWIDTH   128
#define VECTOR_SIZE (DATAWIDTH / 8) // vector size is 16 (128/8 = 16)
typedef ap_uint<DATAWIDTH> uint128_dt;

//DATA_SIZE should be multiple of 16 as Kernel Code is using int16 vector datatype
//to read the operands from Global Memory. So every read/write to global memory
//will read 16 integers value.
#define DATA_SIZE 16384

#pragma SDS data zero_copy(in1[0:1024],in2[0:1024],out[0:1024])
void vadd_accel(const uint128_dt *in1, // Read-Only Vector 1
                const uint128_dt *in2, // Read-Only Vector 2
                uint128_dt *out,        // Output Result
                int size               // Size in integer
               );
#endif
