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

/**********************************************************************************
   Loop Pipelining

   Pipelining is a form of parallelism that allows the FPGA to reuse the
   hardware for the next instruction before the current instruction has finished
   processing. This maximizes the utilization of the FPGA fabric and allows the
   processing of multiple elements of data at the same time.

   In this example we will demonstrate ways to improve the throughput of a
   vector addition hardware function using the HLS PIPELINE pragma.
************************************************************************************/

#include "vector_addition.h"

void vadd_accel(int *a, int *b, int *c, const int len)
{
    //Loop will do burst read from A and B and will do burst write
    //to C due to pipeline pragma
    vadd: for(int i = 0; i < len; i++) {
        //By-Default SDSoC accelerators will create separate AXI master interface
        //for each memory accessing arguments (here it is a,b, and c), so 
        //accelerator can initiate burst request to all interfaces concurrently. 
        #pragma HLS PIPELINE
        #pragma HLS LOOP_TRIPCOUNT min=c_dim max=c_dim
        c[i] = a[i] + b[i];
    }
}
