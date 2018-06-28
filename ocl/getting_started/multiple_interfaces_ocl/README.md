Multiple Interfaces (CL)
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
This is a simple example of vector addition. The purpose of this example is to demonstrate on how to use multiple interfaces and as a result allow C-kernel to access both interfaces simultaneous.

## 2. HOW TO DOWNLOAD THE REPOSITORY
To get a local copy of the SDSoC example repository, clone this repository to the local system with the following command:
```
git clone https://github.com/Xilinx/SDSoC_Examples examples
```
where examples is the name of the directory where the repository will be stored on the local system.This command needs to be executed only once to retrieve the latest version of all SDSoC examples. The only required software is a local installation of git.

## 3. SOFTWARE AND SYSTEM REQUIREMENTS
Board | Device Name | Software Version
------|-------------|-----------------
ZCU102 OpenCL|zcu102|SDx 2017.4
ZCU104 OpenCL|zcu104|SDx 2017.4
ZCU106 OpenCL|zcu106|SDx 2017.4


*NOTE:* The board/platform used for compilation can be changed by adding the PLATFORM environmental variable to the make command as shown below
```
make PLATFORM=<board name> or make all PLATFORM=<board name>
```
where the *PLATFORM* variable accepts one board.

## 4. DESIGN FILE HIERARCHY
Application code is located in the src directory. Accelerator binary files will be compiled to the build directory. A listing of all the files in this example is shown below

```
Makefile
README.md
description.json
src/host.cpp
src/vadd.cpp
```

## 5. COMPILATION AND EXECUTION
### Compiling for Application Execution on the FPGA Board
The command to compile the application for execution on the FPGA acceleration board is
```
make all
```
The default target for the makefile is to compile for hardware. Therefore, setting the TARGETS option is not required.

*NOTE:* Compilation for application execution in hardware generates custom logic to implement the functionality of the kernels in an application.
It is typical for hardware compile times to range from 30 minutes to a couple of hours.


## 6. SUPPORT
For more information about SDSoC check the [SDSoC user Guides][]

For questions and to get help on this project or your own projects, visit the [SDSoC Forums][].


## 7. LICENSE AND CONTRIBUTING TO THE REPOSITORY
The source for this project is licensed under the [3-Clause BSD License][]

To contribute to this project, follow the guidelines in the [Repository Contribution README][]

## 8. ACKNOWLEDGEMENTS
This example is written by developers at
- [Xilinx, Inc.](http://www.xilinx.com)


[3-Clause BSD License]: ../../../LICENSE.txt
[SDSoC Forums]: https://forums.xilinx.com/t5/SDSoC-Development-Environment/bd-p/sdsoc
[SDSoC User Guides]: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2017_2/ug1027-sdsoc-user-guide.pdf
[Repository Contribution README]: ../../../CONTRIBUTING.md
