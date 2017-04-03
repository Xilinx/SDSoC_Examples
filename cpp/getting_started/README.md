Getting Started Examples
======================

This is a main repository which contains variety of SDSoC coding guidelines related examples which are intended to help users to get exposed to various important features of SDSoC. Xilinx SDx 2017.1 tool is used to develop these examples.

## SDSoC Examples

Table below presents overall summary of each example in a precise manner. These examples are categorized to help users to cover various area that needs to be focused while using SDSoC for their application optimization

Sl.No | Title | Description | Category
------|-------|-------------|----------
1|Array Partition|This example shows how to use array partitioning to improve performance of a kernel|Optimization|
2|Burst Read/Write|This is simple example of using AXI4-master interface for burst read and write|Memory Transfer (DDR to PL)|
3|Custom Data Type|This is a simple example of RGB to HSV conversion to demonstrate Custom DATA Type usage in hardware accelerator. Xilinx HLS compiler supports custom data type to operate within the kernel and also it acts as a memory interface between PL to DDR|Optimization|
4|Loop Iteration Dependency|This is a simple example to demonstrate inter dependence attribute. Using inter dependence attribute user can provide additional dependency details to compiler which allow compiler to perform unrolling/pipelining to get better performance|Optimization|


