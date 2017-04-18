Read/Write Window of 2D Array
======================

This README file contains the following sections:

1. OVERVIEW
2. HOW TO DOWLOAD THE REPOSITORY
3. SOFTWARE TOOLS AND SYSTEM REQUIREMENTS
4. DESIGN FILE HIERARCHY
5. COMPILATION AND EXECUTION
6. SUPPORT
7. LICENSE AND CONTRIBUTING TO THE REPOSITORY
8. ACKNOWLEDGEMENTS
9. REVISION HISTORY


## 1. OVERVIEW
This is a simple example of accessing each row of data from 2d array

***KEY CONCEPTS:*** Window of 2D data array access

***KEYWORDS:*** #pragma HLS DATAFLOW, #pragma HLS PIPELINE, #pragma HLS stream

## 2. HOW TO DOWNLOAD THE REPOSITORY
To get a local copy of the SDSoC example repository, clone this repository to the local system with the following command:
```
git clone https://github.com/Xilinx/SDSoC_Examples examples
```
Here *examples* is the name of the directory which is used to store the repository in local file system.This command needs to be executed only once to retrieve the latest version of all SDSoC examples. The only required software is a local installation of git.

## 3. SOFTWARE AND SYSTEM REQUIREMENTS
Board | Family | Part | Flow | OS 
------|-------------|----------|----------|----------
zc702|zynq|xc7z020|Emulation/Hardware|linux/standalone|
zc706|zynq|xc7z045|Emulation/Hardware|linux/standalone|
zcu102|zynquplus|xczu9eg|Hardware|linux/standalone|
zcu102_es2|zynquplus|xczu9eg|Hardware|linux/standalone|


Board targeted by default = ***zc706***

*NOTE:* The board/platform used for compilation can be changed by adding the PLATFORM environmental variable to the make command as shown below
```
make check PLATFORM=<board name> or make all PLATFORM=<board name>
```
where the *PLATFORM* variable accepts one device.

## 4. DESIGN FILE HIERARCHY
Application code is located in the src directory. Application executable and hardware function binary files are placed in a folder which is flow specific. For emulation directory name is "emu" in case of hardware flow "hw" 
```
Makefile
README.md
description.json
src/main.cpp
src/window_array_2d.cpp
src/window_array_2d.h
```

## 5. COMPILATION AND EXECUTION
### Compiling for Application Emulation
As part of capabilities available to an application developer, SDSoC includes emulation environment to check the functional and design compatibility with selected hardware platform.
SDSoC emulation mode is named as "emu" , this mode allows developer to profile and evaluate the performance of a design before compiling for board deployment. It is highly recommended that all the applications are executed in emulation flow.
```
make all TARGET=emu
```
where
```
	make all TARGET=emu   -> Sources are built for emulation flow
```
### Executing Emulated Application 
***Recommended Execution Flow for Example Applications in Emulation*** 

The makefile for the application can directly execute with the following command:
```
make check TARGET=emu
```
If the application has not been previously compiled, the check makefile rule will compile and execute the application in the emulation mode selected by the user.

### Compiling for Application Execution in the FPGA Accelerator Card
The command to deploy hardware function on programmable logic (PL)
```
make all TARGET=hw
```
The default target for the makefile is to compile for emulation. Therefore, setting the TARGET option is required.

*NOTE:* Compilation for hardware target results in generating custom logic for the specified hardware function in source code. 
It is typical for hardware compile times to range from 30 minutes to a couple of hours.


## 6. SUPPORT
For more information about SDSoC check the [SDSoC User Guides][]

For questions and to get help on this project or your own projects, visit the [SDSoC Forums][].


## 7. LICENSE AND CONTRIBUTING TO THE REPOSITORY
The source for this project is licensed under the [3-Clause BSD License][]

To contribute to this project, follow the guidelines in the [Repository Contribution README][]

## 8. ACKNOWLEDGEMENTS
This example is written by developers at
- [Xilinx](http://www.xilinx.com)

## 9. REVISION HISTORY
Date | README Version | Description
-----|----------------|------------
MAR2017|1.0|Initial Xilinx Release

[3-Clause BSD License]: ../../LICENSE.txt
[SDSoC Forums]: https://forums.xilinx.com/t5/SDSoC-Development-Environment/bd-p/sdsoc
[SDSoC User Guides]: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_4/ug1027-sdsoc-user-guide.pdf
[Repository Contribution README]: ../../CONTRIBUTING.md
