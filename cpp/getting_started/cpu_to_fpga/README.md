CPU_To_FPGA Examples
==================================
Labs to showcase cpu to fpga conversion with kernel optimizations.

 __Examples Table__ 

Example        | Description           | Key Concepts / Keywords 
---------------|-----------------------|-------------------------
[01_mmult_sw/][]|This example shows how to perform matrix multiplication on software with no hardware function involved.|
[02_mmult_hw/][]|This example shows how to perform matrix multiplication on hardware without specifying any optimizations (the same software function is taken and just targeted to hardware). This results in default random data access and DMA transfers the data to BRAM blocks. The hardware results are compared with the software results for verification and speedup is shown withrespect to running on hardware versus software.|__Keywords__<br> - #pragma HLS loop_tripcount
[03_mmult_pipeline/][]|This example takes the same hardware function from the previous example and highlights the pipeline kernel optimization in hardware function to achieve better performance. Pipelining a loop results in lower initiation interval(II), which is the number of clock cycles between the start times of consecutive loop iterations by allowing multiple iterations of a loop to run in parallel.|__Key__ __Concepts__<br> - Pipelining<br>__Keywords__<br> - #pragma HLS PIPIELINE
[04_mmult_zero_copy/][]|This example shows how matrix multiplication can be made more efficent in the same hardware function by using local buffers and direct memory interface technique using the zero_copy pragma. The local buffers are implemented as BRAM memory blocks in Programmable Logic (PL) and the zero_copy pragma allows burst read/write from/to DDR memory to/from local memory by generating a direct memory interface between DDR and hardware function via an AXI master bus interface.|__Key__ __Concepts__<br> - Local buffers, Zero_copy<br>__Keywords__<br> - #pragma SDS data zero_copy
[05_mmult_array_partition/][]|This example shows how matrix multiplication using array partitioning technique on top of the same hardware function from previous example achieves better performance. Array partitioning results in increased number of effective read/write ports for a local BRAM array by partitioning the array into smaller arrays. Increase in number of read/write ports leads to parallel processing of the data elements.|__Key__ __Concepts__<br> - Array Partitioning<br>__Keywords__<br> - #pragma HLS ARRAY_PARTITION

[.]:.
[01_mmult_sw/]:01_mmult_sw/
[02_mmult_hw/]:02_mmult_hw/
[03_mmult_pipeline/]:03_mmult_pipeline/
[04_mmult_zero_copy/]:04_mmult_zero_copy/
[05_mmult_array_partition/]:05_mmult_array_partition/
