Getting Started Examples
==================================
This page contains examples for users who are new to Xilinx SDx OpenCL Flows. The focus of the examples is towards code optimization for Xilinx devices.The table lists various categories of examples in suggested order which users can follow.


__Prerequisites__
 - User is familiar with basics of OpenCL flow.
 - User has gone through SDx tutorial and is familiar with basics of tool functionality and terminology.

 __Examples Table__ 

Example        | Description           | Key Concepts / Keywords 
---------------|-----------------------|-------------------------
[array_partition/][]|This example shows how to use array partitioning to improve performance of a hardware function|__Key__ __Concepts__<br> - Hardware Function Optimization<br> - Array Partitioning<br>__Keywords__<br> - #pragma HLS ARRAY_PARTITION<br> - complete
[burst_rw/][]|This is simple example of using AXI4-master interface for burst read and write|__Key__ __Concepts__<br> - Burst Access<br>
[custom_data_type/][]|This is a simple example of RGB to HSV conversion to demonstrate Custom Data Type usage in hardware accelerator. Xilinx HLS compiler supports custom data type to operate within the hardware function and also it acts as a memory interface between PL to DDR|__Key__ __Concepts__<br> - Dataflow<br> - Custom Data type<br>__Keywords__<br> - struct<br> - #pragma HLS data_pack<br> - #pragma HLS LOOP_TRIPCOUNT
[dependence_inter/][]|This is a simple example to demonstrate inter dependence attribute. Using inter dependence attribute user can provide additional dependency details to compiler which allow compiler to perform unrolling/pipelining to get better performance |__Key__ __Concepts__<br> - Inter Dependence<br>__Keywords__<br> - DEPENDENCE<br> - inter
[full_array_2d/][]|This is a simple example of accessing full data from 2D array|__Key__ __Concepts__<br> - 2D data array access<br>__Keywords__<br> - N/A
[lmem_2rw/][]|This is a simple example of vector addition to demonstrate how to utilize both ports of Local Memory |__Key__ __Concepts__<br> - Hardware Function Optimization<br> - 2port BRAM Utilization<br> - Two read/write Local Memory<br>__Keywords__<br> - #pragma HLS UNROLL FACTOR=2
[loop_fusion/][]|This example will demonstrate how to fuse two loops into one to improve the performance of a C/C++ hardware function.|__Key__ __Concepts__<br> - Hardware Function Optimization<br> - Loop Fusion<br> - Loop Pipelining<br>__Keywords__<br> - #pragma HLS PIPELINE
[loop_perfect/][]|This nearest neighbor example is to demonstrate how to achieve better performance using perfect loop.|__Key__ __Concepts__<br> - Loop perfect<br>__Keywords__<br> - #pragma HLS PIPELINE<br> - #pragma HLS ARRAY_PARTITION
[loop_pipeline/][]|This example demonstrates how loop pipelining can be used to improve the performance of a hardware function|__Key__ __Concepts__<br> - Hardware Function Optimization<br> - Loop Pipelining<br>__Keywords__<br> - #pragma HLS PIPELINE
[loop_reorder/][]|This is a simple example of matrix multiplication (Row x Col) to demonstrate how to achieve better pipeline II factor by loop reordering.|__Key__ __Concepts__<br> - Hardware Function Optimization<br> - Loop Reorder to Improve II<br>__Keywords__<br> - #pragma HLS PIPELINE<br> - #pragma HLS ARRAY_PARTITION
[row_array_2d/][]|This is a simple example of accessing each row of data from 2D array|__Key__ __Concepts__<br> - Row of 2D data array access<br>__Keywords__<br> - hls::stream
[shift_register/][]|This example demonstrates how to shift values in each clock cycle|__Key__ __Concepts__<br> - Hardware Function Optimization<br> - Shift Register<br> - FIR<br>__Keywords__<br> - #pragma HLS ARRAY_PARTITION
[systolic_array/][]|This is a simple example of matrix multiplication (Row x Col) to help developers learn systolic array based algorithm design. Note : Systolic array based algorithm design is well suited for FPGA.|__Key__ __Concepts__<br> - Systolic Array<br>__Keywords__<br> - #pragma HLS PIPELINE<br> - #pragma HLS ARRAY_PARTITION
[wide_memory_rw/][]|This is a simple example of vector addition to demonstrate Wide Memory Access using ap_uint<128> data type. Based on input argument type, sds++ compiler will figure out the memory bandwidth between DDR and PL.|__Key__ __Concepts__<br> - Accelerator to Memory Access<br> - wide memory access<br> - burst read and write<br>__Keywords__<br> - ap_uint<DATAWIDTH><br> - ap_int.h
[window_array_2d/][]|This is a simple example of accessing window of data from 2D array|__Key__ __Concepts__<br> - Window of 2D data array access<br>__Keywords__<br> - #pragma HLS DATAFLOW<br> - #pragma HLS PIPELINE<br> - #pragma HLS stream
[full_array_2d_bkup/][]|This is a simple example of accessing full data from 2D array|__Key__ __Concepts__<br> - 2D data array access<br>__Keywords__<br> - N/A

[.]:.
[array_partition/]:array_partition/
[burst_rw/]:burst_rw/
[custom_data_type/]:custom_data_type/
[dependence_inter/]:dependence_inter/
[full_array_2d/]:full_array_2d/
[lmem_2rw/]:lmem_2rw/
[loop_fusion/]:loop_fusion/
[loop_perfect/]:loop_perfect/
[loop_pipeline/]:loop_pipeline/
[loop_reorder/]:loop_reorder/
[row_array_2d/]:row_array_2d/
[shift_register/]:shift_register/
[systolic_array/]:systolic_array/
[wide_memory_rw/]:wide_memory_rw/
[window_array_2d/]:window_array_2d/
[full_array_2d_bkup/]:full_array_2d_bkup/
