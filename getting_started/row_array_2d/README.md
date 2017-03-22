Read/Write Row of 2D Array
======================

This README file contains the following sections:

1. OVERVIEW
2. HOW TO DOWLOAD THE REPOSITORY
3. SOFTWARE TOOLS AND SYSTEM REQUIREMENTS
4. DESIGN FILE HIERARCHY
5. COMPILATION AND EXECUTION
6. EXECUTION IN CLOUD ENVIRONMENTS
7. SUPPORT
8. LICENSE AND CONTRIBUTING TO THE REPOSITORY
9. ACKNOWLEDGEMENTS
10. REVISION HISTORY


## 1. OVERVIEW
This is a simple example of accessing each row of data from 2d array

***KEY CONCEPTS:*** Row of 2D data array access

***KEYWORDS:*** hls::stream

## 2. HOW TO DOWNLOAD THE REPOSITORY
To get a local copy of the SDSoC example repository, clone this repository to the local system with the following command:
```
git clone https://github.com/Xilinx/SDSoC_Examples examples
```
where examples is the name of the directory where the repository will be stored on the local system.This command needs to be executed only once to retrieve the latest version of all SDAccel examples. The only required software is a local installation of git.

## 3. SOFTWARE AND SYSTEM REQUIREMENTS
Board | Device Name | Software Version
------|-------------|-----------------
zynq7000 702|zc702|SDx 2016.4
zynq7000 706|zc706|SDx 2016.4
UltraScale+ 102|zcu102|SDx 2016.4


Board targeted by default = ***zc706***

*NOTE:* The board/device used for compilation can be changed by adding the DEVICES variable to the make command as shown below
```
make PLATFORM=<device name>
```
where the *DEVICES* variable accepts one device.

## 4. DESIGN FILE HIERARCHY
Application code is located in the src directory. Application executable and hardware function binary files are placed in a folder which is flow specific. For emulation directory name is "emu" in case of hardware flow "hw" 
```
Makefile
README.md
description.json
src/main.cpp
src/row_array_2d.cpp
src/row_array_2d.h
```

## 5. COMPILATION AND EXECUTION
### Compiling for Application Emulation
As part of capabilities available to an application developer, SDSoC includes emulation environment to check the functional and design compatibility with selected hardware platform.
SDSoC emulation mode is named as "emu" , this mode allows developer to profile and evaluate the performance of a design before compiling for board deployment. It is highly recommended that all the applications are executed in emulation flow.
```
make all TARGET=<emu>
or
make check TARGET=<emu>
```
where
```
	sw_emu = software emulation
	hw_emu = hardware emulation
```
*NOTE:* The software emulation flow is a functional correctness check only. It does not estimate the performance of the application in hardware.
The hardware emulation flow is a cycle accurate simulation of the hardware generated for the application. As such, it is expected for this simulation to take a long time.
It is recommended that for this example the user skips running hardware emulation or modifies the example to work on a reduced data set.
### Executing Emulated Application 
***Recommended Execution Flow for Example Applications in Emulation*** 

The makefile for the application can directly executed the application with the following command:
```
make TARGETS=<sw_emu|hw_emu> check

```
where
```
	sw_emu = software emulation
	hw_emu = hardware emulation
```
If the application has not been previously compiled, the check makefile rule will compile and execute the application in the emulation mode selected by the user.

***Alternative Execution Flow for Example Applications in Emulation*** 

An emulated application can also be executed directly from the command line without using the check makefile rule as long as the user environment has been properly configured.
To manually configure the environment to run the application, set the following
```
export LD_LIBRARY_PATH=$XILINX_SDX/runtime/lib/x86_64/:$LD_LIBRARY_PATH
export XCL_EMULATION_MODE=<sw_emu|hw_emu>
emconfigutil --xdevice 'zc706 --nd 1
```
Once the environment has been configured, the application can be executed by
```
../../utility/emu_run.sh row_array_2d_accel.elf
```
This is the same command executed by the check makefile rule
### Compiling for Application Execution in the FPGA Accelerator Card
The command to compile the application for execution on the FPGA acceleration board is
```
make all
```
The default target for the makefile is to compile for hardware. Therefore, setting the TARGETS option is not required.
*NOTE:* Compilation for application execution in hardware generates custom logic to implement the functionality of the kernels in an application.
It is typical for hardware compile times to range from 30 minutes to a couple of hours.

## 6. Execution in Cloud Environments
FPGA acceleration boards have been deployed to the cloud. For information on how to execute the example within a specific cloud, take a look at the following guides.
* [AWS F1 Application Execution on Xilinx Virtex UltraScale Devices] (Coming Soon)
* [Nimbix Application Execution on Xilinx Kintex UltraScale Devices]
* [IBM SuperVessel Research Cloud on Xilinx Virtex Devices]


## 7. SUPPORT
For more information about SDAccel check the [SDAccel User Guides][]

For questions and to get help on this project or your own projects, visit the [SDAccel Forums][].

To execute this example using the SDAccel GUI, follow the setup instructions in [SDAccel GUI README][]


## 8. LICENSE AND CONTRIBUTING TO THE REPOSITORY
The source for this project is licensed under the [3-Clause BSD License][]

To contribute to this project, follow the guidelines in the [Repository Contribution README][]

## 9. ACKNOWLEDGEMENTS
This example is written by developers at
- [Xilinx](http://www.xilinx.com)

## 10. REVISION HISTORY
Date | README Version | Description
-----|----------------|------------
DEC2016|1.0|Initial Xilinx Release

[3-Clause BSD License]: ../../../../../../../../../../../../../../../../../../../../../LICENSE.txt
[SDAccel Forums]: https://forums.xilinx.com/t5/SDAccel/bd-p/SDx
[SDAccel User Guides]: http://www.xilinx.com/support/documentation-navigation/development-tools/software-development/sdaccel.html?resultsTablePreSelect=documenttype:SeeAll#documentation
[Nimbix Getting Started Guide]: http://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_2/ug1240-sdaccel-nimbix-getting-started.pdf
[Walkthrough Video]: http://bcove.me/6pp0o482
[Nimbix Application Submission README]: ../../../../../../../../../../../../../../../../../../../../../utility/nimbix/README.md
[Repository Contribution README]: ../../../../../../../../../../../../../../../../../../../../../CONTRIBUTING.md
[SDaccel GUI README]: ../../../../../../../../../../../../../../../../../../../../../GUIREADME.md
[AWS F1 Application Execution on Xilinx Virtex UltraScale Devices]: ../../../../../../../../../../../../../../../../../../../../../README.md
[Nimbix Application Execution on Xilinx Kintex UltraScale Devices]: ../../../../../../../../../../../../../../../../../../../../../utility/nimbix/README.md
[IBM SuperVessel Research Cloud on Xilinx Virtex Devices]: http://bcove.me/6pp0o482
