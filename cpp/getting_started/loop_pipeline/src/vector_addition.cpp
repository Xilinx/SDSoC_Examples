/*
# (c) Copyright 2013 - 2016 Xilinx, Inc. All rights reserved.
#
# This file contains confidential and proprietary information of Xilinx, Inc. and
# is protected under U.S. and international copyright and other intellectual
# property laws.
# 
# DISCLAIMER 
# This disclaimer is not a license and does not grant any rights to the materials
# distributed herewith. Except as otherwise provided in a valid license issued to
# you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE
# MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY
# DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
# INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR
# FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether
# in contract or tort, including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature related to, arising
# under or in connection with these materials, including for any direct, or any
# indirect, special, incidental, or consequential loss or damage (including loss
# of data, profits, goodwill, or any type of loss or damage suffered as a result
# of any action brought by a third party) even if such damage or loss was
# reasonably foreseeable or Xilinx had been advised of the possibility of the
# same.
#
# CRITICAL APPLICATIONS
# Xilinx products are not designed or intended to be fail-safe, or for use in any
# application requiring fail-safe performance, such as life-support or safety
# devices or systems, Class III medical devices, nuclear facilities, applications
# related to the deployment of airbags, or any other applications that could lead
# to death, personal injury, or severe property or environmental damage
# (individually and collectively, "Critical Applications").Customer assumes the
# sole risk and liability of any use of Xilinx products in Critical Applications,
# subject only to applicable laws and regulations governing limitations on product
# liability.
#
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT
# ALL TIMES.
*/

/**********************************************************************************
   Loop Pipelining

   Pipelining is a form of parallelism that allows the FPGA to reuse the
   hardware for the next instruction before the current instruction has finished
   processing. This maximizes the utilization of the FPGA fabric and allows the
   processing of multiple elements of data at the same time.

   The xocc compiler automatically performs this optimization on loops so no
   user intervention is required for most cases. The outer most loops will be
   pipelined and inner loops will be unrolled if possible.

   There are instances where this technique will not yield the best performance.
   For example, if you access two or more global cl_mem objects from within a
   pipelined loop. By default xocc will assign one global memory port to each
   kernel. Because the operations within a pipelined loop are executing in
   parallel different stages of the pipeline will need access to the memory
   port. In order to accommodate this design, xocc will need to serialize the
   access to these ports and therefore increase the initiation interval(II)
   and by extension reduce the throughput.

   In this example we will demonstrate ways to improve the throughput of a
   vector addition kernel using the xcl_pipeline_loop attribute.
************************************************************************************/

#define N 128
#include "vector_addition.h"

const int DATA_SIZE = 1<<10;

// This kernel is optimized to access only one global variable in a pipelined
// loop. This will improve the II and increase throughput of the kernel.
void vadd_pipelined_accel(int a[DATA_SIZE],
                          int b[DATA_SIZE],
                          int c[DATA_SIZE],
                          const int len)
{
    int result[N];
    int iterations = len / N;

    // Default behavior of xocc will pipeline the outer loop. Since we have
    // multiple inner loops, the pipelining will fail. We can instead pipeline
    // the inner loops using the xcl_pipeline_loop attribute to guide the
    // compiler.
    for(int i = 0; i < iterations; i++) {

        // Pipelining loops that access only one variable is the ideal way to
        // increase the global memory bandwidth.
        read_a:
        for (int x=0; x<N; ++x) {
        #pragma HLS PIPELINE
            result[x] = a[i*N+x];
        }
        read_b:
        for (int x=0; x<N; ++x) {
        #pragma HLS PIPELINE
            result[x] += b[i*N+x];
        }
        write:
        for (int x=0; x<N; ++x) {
        #pragma HLS PIPELINE
            c[i*N+x] = result[x];
        }
    }
}
