Getting Started
======================

This is a main directory which contains variety of SDSoC coding guidelines related examples which are intended to help users to get exposed to various important features of SDSoC. Xilinx SDx 2017.1 tool is used to develop these examples.

## SDSoC Examples

Table below presents overall summary of each example in a precise manner. These examples are categorized to help users to cover various areas that needs to be focused while using SDSoC for their application optimization

Sl.No | Title | Overview |Key Concept | Key Words | Category
------|-------|----------|---|-----------|---------
1|Array Partition|This example shows how to use array partitioning to improve performance of a kernel|Hardware Function Optimization, Array Partitioning|#pragma HLS ARRAY PARTITION, complete|Optimization|
3|Custom Data Type|This is a simple example of RGB to HSV conversion to demonstrate Custom DATA Type usage in hardware accelerator. Xilinx HLS compiler supports custom data type to operate within the kernel and also it acts as a memory interface between PL to DDR|Dataflow, Custom Datatype|struct, #pragma HLS LOOP_TRIPCOUNT|Optimization|
4|Loop Iteration Dependency|This is a simple example to demonstrate inter dependence attribute. Using inter dependence attribute user can provide additional dependency details to compiler which allow compiler to perform unrolling/pipelining to get better performance|Inter Dependence|DEPENDENCE, inter|Optimization|
6|Two Parallel Read/Write on Local Memory|This is a simple example of vector addition to demonstrate how to utilize both ports of Local Memory|Hardware Function Optimization, 2port BRAM Utilization, Two read/write local memory|#pragma HLS UNROLL FACTOR=2|Optimization|
7|Loop Fusion|This example will demonstrate how to fuse two loops into one to improve the performance of a C/C++ accelerator.|Hardware Function Optimization, loop fusion, loop pipelining|#pragma HLS PIPELINE|Optimization|
8|Loop Perfect|This nearest neighbor example is to demonstrate how to achieve better performance using perfect loop.|Loop perfect|#pragma HLS PIPELINE, #pragma HLS ARRAY_PARTITION|Optimization|
9|Loop Pipelining|This example demonstrates how loop pipelining can be used to improve the performance of a kernel|Hardware Function Optimization, Loop pipelining|#pragma HLS PIPELINE|Optimization|
10|Loop Reorder for Better Performance|This is a simple example of matrix multiplication (Row x Col) to demonstrate how to achieve better pipeline II factor by loop reordering|Hardware Optimization, Loop Reorder to Improve II factor|#pragma HLS PIPELINE, #pragma HLS ARRAY_PARTITION|Optimization|
12|Shift Register|This example demonstrates how to shift values in each clock cycle|Hardware Function Optimization, Shift register, FIR|#pragma HLS ARRAY_PARTITION|Optimization|
13|Systolic Array Implementation|This is a simple example of matrix multiplication (Row x Col) to help developers learn systolic array based algorithm design. Note : Systolic array based algorithm design is well suited for FPGA.|Systolic Array|#pragma HLS PIPELINE, #pragma HLS ARRAY_PARTITION|Optimization|
14|Wide Memory Read/Write|This is a simple example of vector addition to demonstrate Wide Memory Access using ap_uint<512> data type. Based on input argument type, sds++ compiler will figure out the memory bandwidth between global memory and kernel. For this example, ap_uint<512> datatype is used, so memory datawidth will be 16 x (integer bit size) = 16 x 32 = 512bit|Kernel, to DDR, wide memory access, burst read and write|ap_uint<DATAWIDTH>, ap_int.h (HLS Header)|Memory Transfer (DDR to PL)|
15|Read/Write Window of 2D Array|This is a simple example of accessing each row of data from 2d array|Window of 2D data array access|#pragma HLS DATAFLOW, #pragma HLS PIPELINE, #pragma HLS stream|Memory Transfer (DDR to PL)|
2|Burst Read/Write|This is simple example of using AXI4-master interface for burst read and write|Burst Access|Burst Copy|Memory Transfer (DDR to PL)|
5|Full 2D Array Read/Write|This is a simple example of accessing full data from 2d array|2D data array access|N/A|Memory Transfer (DDR to PL)|
11|Read/Write Row of 2D Array|This is a simple example of accessing each row of data from 2d array|Row of 2D data array access|hls::stream|Memory Transfer (DDR to PL)|


