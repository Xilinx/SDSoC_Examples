#!/usr/bin/env python
from sys import argv
import json
import glob
import os
import subprocess

def create_xlx_copyright(target):
    target.write("# (c) Copyright 2013 - 2016 Xilinx, Inc. All rights reserved.\n")
    target.write("#\n")
    target.write("# This file contains confidential and proprietary information of Xilinx, Inc. and\n")
    target.write("# is protected under U.S. and international copyright and other intellectual\n")
    target.write("# property laws.\n")
    target.write("# \n")
    target.write("# DISCLAIMER \n")
    target.write("# This disclaimer is not a license and does not grant any rights to the materials\n")
    target.write("# distributed herewith. Except as otherwise provided in a valid license issued to\n")
    target.write("# you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE\n")
    target.write("# MATERIALS ARE MADE AVAILABLE \"AS IS\" AND WITH ALL FAULTS, AND XILINX HEREBY\n")
    target.write("# DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,\n")
    target.write("# INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR\n")
    target.write("# FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether\n")
    target.write("# in contract or tort, including negligence, or under any other theory of\n")
    target.write("# liability) for any loss or damage of any kind or nature related to, arising\n")
    target.write("# under or in connection with these materials, including for any direct, or any\n")
    target.write("# indirect, special, incidental, or consequential loss or damage (including loss\n")
    target.write("# of data, profits, goodwill, or any type of loss or damage suffered as a result\n")
    target.write("# of any action brought by a third party) even if such damage or loss was\n")
    target.write("# reasonably foreseeable or Xilinx had been advised of the possibility of the\n")
    target.write("# same.\n")

    target.write("#\n")
    target.write("# CRITICAL APPLICATIONS\n")
    target.write("# Xilinx products are not designed or intended to be fail-safe, or for use in any\n")
    target.write("# application requiring fail-safe performance, such as life-support or safety\n")
    target.write("# devices or systems, Class III medical devices, nuclear facilities, applications\n")
    target.write("# related to the deployment of airbags, or any other applications that could lead\n")
    target.write("# to death, personal injury, or severe property or environmental damage\n")
    target.write("# (individually and collectively, \"Critical Applications\").Customer assumes the\n")
    target.write("# sole risk and liability of any use of Xilinx products in Critical Applications,\n")
    target.write("# subject only to applicable laws and regulations governing limitations on product\n")
    target.write("# liability.\n")
    target.write("#\n")
    target.write("# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT\n")
    target.write("# ALL TIMES.\n")
    return


def create_mk(target, data):
    target.write("\n") 
    target.write("#+-------------------------------------------------------------------------------\n")
    target.write("# The following parameters are assigned with default values. These parameters can\n")
    target.write("# be overridden through the make command line\n")
    target.write("#+-------------------------------------------------------------------------------\n")
    target.write("\n")
    
    target.write("# Device Platform (Default ~ zc706)\n")
    target.write("PLATFORM := ")
    target.write("zc706")
    target.write("\n")
    target.write("\n")
    
    target.write("# Run Target:\n")
    target.write("#   hw  - Compile for hardware\n")
    target.write("#   emu - Compile for emulation (Default)\n")
    target.write("TARGET := emu\n")
    target.write("\n")
    
    target.write("# Current Directory\n")
    target.write("pwd := $(CURDIR)\n")
    target.write("\n")

    target.write("# Points to Utility Directory\n")
    target.write("COMMON_REPO = ../../../\n") 
    target.write("ABS_COMMON_REPO = $(shell readlink -f $(COMMON_REPO))\n")
    target.write("\n")
  
    target.write("# Include Libraries\n")
    target.write("include $(ABS_COMMON_REPO)/libs/sds_utils/sds_utils.mk\n")
    target.write("\n")
 
    target.write("# Target OS:\n")
    target.write("#     linux (Default), standalone\n")
    
    target.write("TARGET_OS := linux\n")
    target.write("\n")

    target.write("# Emulation Mode:\n")
    target.write("#     debug     - Include debug data\n")
    target.write("#     optimized - Exclude debug data (Default)\n")
    target.write("EMU_MODE := optimized\n")
    target.write("\n")

    target.write("# Additional sds++ flags - this should be reserved for sds++ flags defined\n")
    target.write("# at run-time. Other sds++ options should be defined in the makefile data section below\n")
    target.write("# section below\n")
    target.write("ADDL_FLAGS := ")
    if 'compiler' in data:
        compiler = data["compiler"]
        if 'options' in compiler:
            target.write(compiler["options"])
    target.write("\n")
    target.write("\n")
    target.write("# Set to 1 (number one) to enable sds++ verbose output\n")
    target.write("VERBOSE := \n")
    
    target.write("# Build Executable\n")
    target.write("EXECUTABLE := ")
#    hf = data.get("hw_function")
#    target.write(hf)
    for acc in data["accelerators"]:
        target.write(acc["name"])
        target.write(".elf\n")
        target.write("\n")

    target.write("# Build Directory\n")
    target.write("BUILD_DIR := build/$(PLATFORM)_$(TARGET_OS)_$(TARGET)")
    target.write("\n")

    target.write("#+--------------------------------------------------------------------------\n")
    target.write("# Makefile Data\n")
    target.write("#+--------------------------------------------------------------------------\n")
    target.write("\n")
    return

script, desc_file = argv
desc = open(desc_file, 'r')
data = json.load(desc)
desc.close()
target = open("Makefile", "w")
#create_xlx_copyright(target)
create_mk(target, data)
src_dir = data.get("source_dir")
extension = " "
length = len(src_dir)
final_dir = ""
target.write("# Source Files\n")
target.write("SRC_DIR := ")
for i in range(0, len(src_dir)):
    if src_dir[i] == '*':
        if length > i + 3:
            extension = "*.cpp"
            break
        else:
            extension = "*.c"
            break
    else:
        if src_dir[i + 1] != "*":
            final_dir += src_dir[i]
            target.write(src_dir[i])
        else:
            continue
target.write("\n")
        
os.chdir(final_dir)
count = 0
for file in glob.glob(extension):
    count = count + 1
#temp = count
#if extension == "*.cpp":
#    target.write("CPP_SRCS += \\")
#else:
#    target.write("C_SRCS += \\")
    
#target.write("\n")
#for result in glob.glob(extension):
#   temp -= 1
#    target.write("$(pwd)/$(SRC_DIR)/")
#    target.write(result)
#    if temp != 0:
#        target.write(" \\\n")
#target.write("\n\n")

temp = count
target.write("OBJECTS += \\")
target.write("\n")
for result in glob.glob(extension):
    temp -= 1
    target.write("$(pwd)/$(BUILD_DIR)/")
    if extension == "*.cpp":
        obj = result.replace(".cpp", ".o")
    else:
        obj = result.replace(".c", ".o")
    target.write(obj)
    if temp != 0:
        target.write(" \\\n")
target.write("\n\n")

#temp = count
#if extension == "*.cpp":
#    target.write("CPP_DEPS += \\")
#    target.write("\n")
#else:
#    target.write("C_DEPS += \\")
#    target.write("\n")

#for result in glob.glob(extension):
#    temp -= 1
#    target.write("$(pwd)/$(BUILD_DIR)/")
#    if extension == "*.cpp":
#        obj = result.replace(".cpp", ".d")
#    else:
#        obj = result.replace(".c", ".d")
#    target.write(obj)
#    if temp != 0:
#        target.write(" \\\n")
#target.write("\n\n")

target.write("# SDS Options\n")
#target.write("#\n")
target.write("HW_FLAGS := -sds-hw ")

for acc in data["accelerators"]:
    target.write(acc["name"])
    target.write(" ")
    target.write(acc["location"])    

#hw_function = data.get("hw_function")
#target.write(hw_function)
#target.write(" ")
#hf_file = data.get("accel_file")
#target.write(hf_file)
target.write(" -sds-end\n")

target.write("EMU_FLAGS := \n")
target.write("ifeq ($(TARGET), emu)\n")
target.write("\tEMU_FLAGS := -mno-bitstream -mno-boot-files -emulation $(EMU_MODE)\n")
target.write("endif\n")
target.write("\n")

target.write("# Compilation and Link Flags\n")
target.write("IFLAGS := -I.\n")
target.write("CFLAGS = -Wall -O3 -c\n")
target.write("CFLAGS += -MT\"$@\" -MMD -MP -MF\"$(@:%.o=%.d)\" -MT\"$(@)\" \n")
target.write("CFLAGS += -std=c++0x\n")
target.write("CFLAGS += -I$(sds_utils_HDRS)\n")
target.write("CFLAGS += $(ADDL_FLAGS)\n")
target.write("LFLAGS = \"$@\" \"$<\" \n")

target.write("#+---------------------------------------------------------------------\n")
target.write("\n")

target.write("SDSFLAGS := -sds-pf $(PLATFORM) \\\n")
target.write("\t-target-os $(TARGET_OS) \n")
target.write("\n")

target.write("# SDS Compiler\n")
target.write("CC := sds++ $(SDSFLAGS)\n")
target.write("\n")

target.write(".PHONY: all\n")
target.write("all: $(BUILD_DIR)/$(EXECUTABLE)\n")
target.write("\n")

target.write("$(BUILD_DIR)/$(EXECUTABLE): $(OBJECTS)\n")
target.write("\tmkdir -p $(BUILD_DIR)\n")
target.write("\t@echo 'Building Target: $@'\n")
target.write("\t@echo 'Trigerring: SDS++ Linker'\n")
target.write("\tcd $(BUILD_DIR) ; $(CC) -o $(EXECUTABLE) $(OBJECTS) $(EMU_FLAGS)\n")
target.write("\t@echo 'SDx Completed Building Target: $@'\n")
target.write("\t@echo ' '\n")

target.write("\n")

if extension == "*.cpp":
    target.write("$(pwd)/$(BUILD_DIR)/%.o: $(pwd)/$(SRC_DIR)/%.cpp\n")
else:
    target.write("$(pwd)/$(BUILD_DIR)/%.o: $(pwd)/$(SRC_DIR)/%.c\n")

target.write("\t@echo 'Building file: $<'\n")
target.write("\t@echo 'Invoking: SDS++ Compiler'\n")
target.write("\tmkdir -p $(BUILD_DIR)\n")
target.write("\tcd $(BUILD_DIR) ; $(CC) $(CFLAGS) -o $(LFLAGS) $(HW_FLAGS)\n")
target.write("\t@echo 'Finished building: $<'\n")
target.write("\t@echo ' '\n")

target.write("\n")
target.write("# Check Rule Builds the Sources and Executes on Specified Target\n")
target.write("check: all\n")
target.write("ifeq ($(TARGET), emu)\n\n")
target.write("    ifeq ($(TARGET_OS), linux)\n")
target.write("\t    cp $(ABS_COMMON_REPO)/utility/emu_run.sh $(BUILD_DIR)/\n")
target.write("\t    cd $(BUILD_DIR) ; ./emu_run.sh $(EXECUTABLE)\n")
target.write("    else\n")
target.write("\t    cd $(BUILD_DIR) ; sdsoc_emulator -timeout 120\n")
target.write("    endif\n\n")
target.write("else\n")
target.write("\t$(info \"This Release Doesn't Support Automated Hardware Execution\")\n")
target.write("endif\n")
target.write("\n")

target.write(".PHONY: cleanall clean ultraclean\n");
target.write("clean:\n")
target.write("\t$(RM) $(BUILD_DIR)/$(EXECUTABLE) $(OBJECTS)\n")

target.write("\n")

target.write("cleanall:clean\n")
target.write("\t$(RM) -rf ./build .Xil\n")

target.write("\n")

target.write(".PHONY: docs\n")
target.write("docs: README.md\n")
target.write("\n")

target.write("README.md: description.json\n")
target.write("\t$(ABS_COMMON_REPO)/utility/readme_gen/readme_gen.py description.json\n")
target.write("\n")

target.write("ECHO:= @echo\n")
target.write("\n")
target.write(".PHONY: help\n")
target.write("\n")
target.write("help::\n")
target.write("\t$(ECHO) \"Makefile Usage:\"\n")
target.write("\t$(ECHO) \"	make all TARGET=<emu/hw> TARGET_OS=<linux/standalone>\"\n");
target.write("\t$(ECHO) \"		Command to generate the design for specified Target and OS.\"\n")
target.write("\t$(ECHO) \"\"\n")
target.write("\t$(ECHO) \"	make clean TARGET=<emu/hw> TARGET_OS=<linux/standalone>\"\n");
target.write("\t$(ECHO) \"		Command to remove the generated non-hardware files.\"\n")
target.write("\t$(ECHO) \"\"\n")
target.write("\t$(ECHO) \"	make cleanall\"\n")
target.write("\t$(ECHO) \"		Command to remove all the generated files.\"\n")
target.write("\t$(ECHO) \"\"\n")
target.write("\t$(ECHO) \"	make check TARGET=<emu/hw> TARGET_OS=<linux/standalone>\"\n");
target.write("\t$(ECHO) \"		Command to run application in emulation.\"\n")
target.write("\t$(ECHO) \"\"\n")
target.write("\n")

target.close
