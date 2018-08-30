Wide Memory Read/Write
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


## 1. OVERVIEW
This is a simple example of vector addition to demonstrate Wide Memory Access using structure data type of 128bit wide. Based on input argument type, sds++ compiler will figure out the memory interface datawidth of hardware accelerator.

***KEY CONCEPTS:*** wide memory access, burst read and write, custom datatype

***KEYWORDS:*** struct

## 2. HOW TO DOWNLOAD THE REPOSITORY
To get a local copy of the SDSoC example repository, clone this repository to the local system with the following command:
```
git clone https://github.com/Xilinx/SDSoC_Examples examples
```
Here *examples* is the name of the directory which is used to store the repository in local file system. This command needs to be executed only once to retrieve the latest version of all the SDSoC examples. *Git* software needs to be installed prior to the execution of command above.

## 3. SOFTWARE AND SYSTEM REQUIREMENTS
Board | Family | Part | Flow | OS 
------|-------------|----------|----------|----------
zc706|zynq|xc7z045|Emulation/Hardware|linux|
zcu102|zynquplus|xczu9eg|Emulation/Hardware|linux|


Board targeted by default = ***zcu102***

*NOTE:* The board/platform used for compilation can be changed by adding the PLATFORM environmental variable to the make command as shown below
```
make check PLATFORM=<board name> or make all PLATFORM=<board name>
```
where the *PLATFORM* variable accepts one board.

*NOTE:* The Makefiles provided by the examples do not run on Windows, but the source files could be used in the SDSoC environment GUI under Windows

## 4. DESIGN FILE HIERARCHY
Application code is located in the src/ directory. Application executable and hardware function binary files are placed in a folder which is flow specific. For emulation flow, directory name is "emu" and in case of hardware flow it is named as "hw" 
```
Makefile
README.md
description.json
src/main.cpp
src/vadd.cpp
src/vadd.h
```

## 5. COMPILATION AND EXECUTION
### Compiling for Application Emulation
As part of capabilities available to an application developer, SDSoC includes emulation environment to check the functional and design compatibility with selected hardware platform.
SDSoC emulation mode is named as "emu" , this mode allows developer to profile and evaluate the performance of a design before compiling for board deployment. It is highly recommended that all the applications are executed in emulation flow.


Platform | Supported Flow 
------|-------------
Linux|Makefile/GUI|
Windows|GUI|


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

### Compiling for Quick CPU Emulation
This mode allows quick functionality check of the application code by treating all hardware functions as CPU functions and then going through the usual emulation flow.
```
make check TARGET=cpu_emu
```
*NOTE:* This is the quickest mode and is used only to verify the functional correctness of the application code. 

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


[3-Clause BSD License]: ../../../LICENSE.txt
[SDSoC Forums]: https://forums.xilinx.com/t5/SDSoC-Development-Environment/bd-p/sdsoc
[SDSoC User Guides]: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2017_2/ug1027-sdsoc-user-guide.pdf
[Repository Contribution README]: ../../../CONTRIBUTING.md
