Getting Started Examples
==================================
This page contains examples for users who are new to Xilinx SDx SDSoC Flows.

 __Examples Table__ 

Example        | Description           | Key Concepts / Keywords 
---------------|-----------------------|-------------------------
[array_partition/][]|This example shows how to use array partitioning to improve performance of a hardware function|__Key__ __Concepts__<br> - Hardware Function Optimization<br> - Array Partitioning<br>__Keywords__<br> - #pragma HLS ARRAY_PARTITION<br> - complete
[burst_rw/][]|This is a simple vector increment example which demonstrates usage of  AXI4-master interface for burst read and write|__Key__ __Concepts__<br> - Burst Access<br>
[custom_data_type/][]|This is a simple example of RGB to HSV conversion to demonstrate Custom Data Type usage in hardware accelerator. Xilinx HLS compiler supports custom data type to operate within the hardware function and also it acts as a memory interface between PL to DDR|__Key__ __Concepts__<br> - Custom Data type<br>__Keywords__<br> - struct<br> - packed<br> - aligned
[data_access_random/][]|This is a simple example of matrix multiplication (Row x Col) to demonstrate random data access pattern.|__Key__ __Concepts__<br> - Data Access Random<br>__Keywords__<br> - #pragma HLS PIPELINE<br> - #pragma sds data access_pattern(a:RANDOM, b:RANDOM)<br> - #pragma sds data copy
[dependence_inter/][]|This is a simple example to demonstrate inter dependence attribute using vertical convolution example. Using inter dependence attribute user can provide additional dependency details to compiler which allow compiler to perform unrolling/pipelining to get better performance |__Key__ __Concepts__<br> - Inter Dependence<br>__Keywords__<br> - DEPENDENCE<br> - inter
[direct_connect/][]|This is a simple example of matrix multiplication with matrix addition (Out = (A x B) + C)to demonstrate direct connection which helps to achieve increasing in system parallelism and concurrency.|__Key__ __Concepts__<br> - Direct Connection<br> - Multiple Accelerators<br>__Keywords__<br> - #pragma SDS data access_pattern
[dma_sg/][]|This example demonstrates how to use Scatter-Gather DMAs for data transfer to/from hardware accelerator|__Key__ __Concepts__<br> - Scatter Gather DMA<br> - FIFO Interface<br>__Keywords__<br> - #pragma SDS access_pattern(a:SEQUENTIAL)<br> - #pragma SDS data_mover(a:AXIDMA_SG)<br> - #pragma SDS data copy
[dma_simple/][]|This example demonstrates how to insert Simple DMAs for data transfer between User program and hardware accelerator|__Key__ __Concepts__<br> - Simple DMA<br> - FIFO Interface<br>__Keywords__<br> - #pragma SDS access_pattern(a:SEQUENTIAL)<br> - #pragma SDS data_mover(a:AXIDMA_SIMPLE)<br> - #pragma SDS data copy
[full_array_2d/][]|This is a simple example of accessing full data from 2D array|__Key__ __Concepts__<br> - 2D data array access<br>
[hello_vadd/][]|This is a basic hello world kind of example which demonstrates how to achieve vector addition using hardware function.|__Key__ __Concepts__<br> - Loop Pipelining<br>__Keywords__<br> - #pragma HLS PIPELINE
[lmem_2rw/][]|This is a simple example of vector addition to demonstrate how to utilize both ports of Local Memory |__Key__ __Concepts__<br> - Hardware Function Optimization<br> - 2port BRAM Utilization<br> - Two read/write Local Memory<br>__Keywords__<br> - #pragma HLS UNROLL FACTOR=2
[loop_fusion/][]|This example will demonstrate how to fuse two loops into one to improve the performance of a C/C++ hardware function.|__Key__ __Concepts__<br> - Hardware Function Optimization<br> - Loop Fusion<br> - Loop Pipelining<br>__Keywords__<br> - #pragma HLS PIPELINE
[loop_perfect/][]|This nearest neighbor example is to demonstrate how to achieve better performance using perfect loop.|__Key__ __Concepts__<br> - Loop perfect<br>__Keywords__<br> - #pragma HLS PIPELINE<br> - #pragma HLS ARRAY_PARTITION
[loop_reorder/][]|This is a simple example of matrix multiplication (Row x Col) to demonstrate how to achieve better pipeline II factor by loop reordering.|__Key__ __Concepts__<br> - Hardware Function Optimization<br> - Loop Reorder to Improve II<br>__Keywords__<br> - #pragma HLS PIPELINE<br> - #pragma HLS ARRAY_PARTITION
[multiple_hw_instance/][]|This is simple matrix multiplication example which showcases how to create multiple hardware instances of a hardware function for better performance.|__Key__ __Concepts__<br> - Multiple instances of HW functiong<br>__Keywords__<br> - #pragma HLS resource
[multi_threading/][]|Simple Multi-Threading application demonstrating performance comparision between software and hardware - with and without threads|__Key__ __Concepts__<br> - multi threading<br>__Keywords__<br> - #pragma HLS array_partition<br> - #pragma HLS PIPELINE<br> - #pragma SDS data access_pattern
[parallel_accel/][]|This is a simple example of matrix addition and matrix multiplication (two accelerators) to demonstrate the async and wait which helps to achieve increasing in system parallelism and concurrency.|__Key__ __Concepts__<br> - Multiple Accelerators<br>__Keywords__<br> - #pragma SDS async<br> - #pragma SDS wait
[row_array_2d/][]|This is a simple example of accessing each row of data from 2D array|__Key__ __Concepts__<br> - Row of 2D data array access<br>__Keywords__<br> - hls::stream
[shift_register/][]|This example demonstrates how to shift values in each clock cycle|__Key__ __Concepts__<br> - Hardware Function Optimization<br> - Shift Register<br> - FIR<br>__Keywords__<br> - #pragma HLS ARRAY_PARTITION
[sys_port/][]|This is a simple example which demonstrates sys_port usage|__Key__ __Concepts__<br> - sys_port<br> - memory interface<br> - memory non-caching<br>__Keywords__<br> - #pragma SDS data sys_port<br> - #pragms HLS PIPELINE<br> - sds_alloc_non_cacheable
[systolic_array/][]|This is a simple example of matrix multiplication (Row x Col) to help developers learn systolic array based algorithm design. Note : Systolic array based algorithm design is well suited for FPGA.|__Key__ __Concepts__<br> - Systolic Array<br>__Keywords__<br> - #pragma HLS PIPELINE<br> - #pragma HLS ARRAY_PARTITION
[wide_memory_rw/][]|This is a simple example of vector addition to demonstrate Wide Memory Access using structure data type of 128bit wide. Based on input argument type, sds++ compiler will figure out the memory interface datawidth of hardware accelerator.|__Key__ __Concepts__<br> - wide memory access<br> - burst read and write<br> - custom datatype<br>__Keywords__<br> - struct
[window_array_2d/][]|This is a simple example of accessing window of data from 2D array|__Key__ __Concepts__<br> - Window of 2D data array access<br>__Keywords__<br> - #pragma HLS DATAFLOW<br> - #pragma HLS PIPELINE<br> - #pragma HLS stream
[cpu_to_fpga/01_mmult_sw/][]|This example shows how to perform matrix multiplication on software with no hardware function involved.|
[cpu_to_fpga/02_mmult_hw/][]|This example shows how to perform matrix multiplication on hardware without specifying any optimizations (the same software function is taken and just targeted to hardware). This results in default random data access and DMA transfers the data to BRAM blocks. The hardware results are compared with the software results for verification and speedup is shown withrespect to running on hardware versus software.|__Keywords__<br> - #pragma HLS loop_tripcount
[cpu_to_fpga/03_mmult_pipeline/][]|This example takes the same hardware function from the previous example and highlights the pipeline kernel optimization in hardware function to achieve better performance. Pipelining a loop results in lower initiation interval(II), which is the number of clock cycles between the start times of consecutive loop iterations by allowing multiple iterations of a loop to run in parallel.|__Key__ __Concepts__<br> - Pipelining<br>__Keywords__<br> - #pragma HLS PIPIELINE
[cpu_to_fpga/04_mmult_zero_copy/][]|This example shows how matrix multiplication can be made more efficent in the same hardware function by using local buffers and direct memory interface technique using the zero_copy pragma. The local buffers are implemented as BRAM memory blocks in Programmable Logic (PL) and the zero_copy pragma allows burst read/write from/to DDR memory to/from local memory by generating a direct memory interface between DDR and hardware function via an AXI master bus interface.|__Key__ __Concepts__<br> - Local buffers, Zero_copy<br>__Keywords__<br> - #pragma SDS data zero_copy
[cpu_to_fpga/05_mmult_array_partition/][]|This example shows how matrix multiplication using array partitioning technique on top of the same hardware function from previous example achieves better performance. Array partitioning results in increased number of effective read/write ports for a local BRAM array by partitioning the array into smaller arrays. Increase in number of read/write ports leads to parallel processing of the data elements.|__Key__ __Concepts__<br> - Array Partitioning<br>__Keywords__<br> - #pragma HLS ARRAY_PARTITION

[.]:.
[array_partition/]:array_partition/
[burst_rw/]:burst_rw/
[custom_data_type/]:custom_data_type/
[data_access_random/]:data_access_random/
[dependence_inter/]:dependence_inter/
[direct_connect/]:direct_connect/
[dma_sg/]:dma_sg/
[dma_simple/]:dma_simple/
[full_array_2d/]:full_array_2d/
[hello_vadd/]:hello_vadd/
[lmem_2rw/]:lmem_2rw/
[loop_fusion/]:loop_fusion/
[loop_perfect/]:loop_perfect/
[loop_reorder/]:loop_reorder/
[parallel_accel/]:parallel_accel/
[row_array_2d/]:row_array_2d/
[shift_register/]:shift_register/
[sys_port/]:sys_port/
[systolic_array/]:systolic_array/
[wide_memory_rw/]:wide_memory_rw/
[window_array_2d/]:window_array_2d/
[cpu_to_fpga/01_mmult_sw/]:cpu_to_fpga/01_mmult_sw/
[cpu_to_fpga/02_mmult_hw/]:cpu_to_fpga/02_mmult_hw/
[cpu_to_fpga/03_mmult_pipeline/]:cpu_to_fpga/03_mmult_pipeline/
[cpu_to_fpga/04_mmult_zero_copy/]:cpu_to_fpga/04_mmult_zero_copy/
[cpu_to_fpga/05_mmult_array_partition/]:cpu_to_fpga/05_mmult_array_partition/
