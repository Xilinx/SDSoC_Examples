#!/usr/bin/env python
from sys import argv
import json
import glob
import os
import subprocess

def create_params(target):
    target.write("\n") 
    target.write("#+-------------------------------------------------------------------------------\n")
    target.write("# The following parameters are assigned with default values. These parameters can\n")
    target.write("# be overridden through the make command line\n")
    target.write("#+-------------------------------------------------------------------------------\n")
    target.write("\n")
    
    target.write("# FPGA Board Platform (Default ~ zcu102)\n")
    target.write("PLATFORM := ")
    target.write("zcu102")
    target.write("\n")
    target.write("\n")
    
    target.write("# Run Target:\n")
    target.write("#   hw  - Compile for hardware\n")
    target.write("#   emu - Compile for emulation (Default)\n")
    target.write("#   cpu_emu - Quick compile for cpu emulation trating all HW functions as CPU functions\n")
    target.write("TARGET := emu\n")
    target.write("\n")
    
    target.write("# Target OS:\n")
    target.write("#     linux (Default), standalone\n")
    target.write("TARGET_OS := linux\n")
    target.write("\n")

    target.write("# Build Directory\n")
    target.write("BUILD_DIR := build/$(PLATFORM)_$(TARGET_OS)_$(TARGET)")
    target.write("\n")

    target.write("# Emulation Mode:\n")
    target.write("#     debug     - Include debug data\n")
    target.write("#     optimized - Exclude debug data (Default)\n")
    target.write("EMU_MODE := optimized\n")
    target.write("\n")

    target.write("# Current Directory\n")
    target.write("pwd := $(CURDIR)\n")
    target.write("\n")

    target.write("# Points to Utility Directory\n")
    target.write("COMMON_REPO = ../../../\n") 
    target.write("ABS_COMMON_REPO = $(shell readlink -f $(COMMON_REPO))\n")
    target.write("\n")

    return

def add_libs(target):
    target.write("# Include Libraries\n")
    target.write("include $(ABS_COMMON_REPO)/libs/sds_utils/sds_utils.mk\n")
    target.write("\n")

    return

def add_flags(target, data):
    target.write("# Additional sds++ flags - this should be reserved for sds++ flags defined\n")
    target.write("# at run-time. Other sds++ options should be defined in the makefile data section below\n")
    target.write("ADDL_FLAGS := ")
    if 'compiler' in data:
        compiler = data["compiler"]
        if 'options' in compiler:
            target.write(compiler["options"])
    target.write("\n")
    target.write("\n")

    target.write("# Set to 1 (number one) to enable sds++ verbose output\n")
    target.write("VERBOSE := \n\n")

    target.write("# Build Executable\n")
    target.write("EXECUTABLE := run.elf ")
    target.write("\n")

    target.write("#+--------------------------------------------------------------------------\n")
    target.write("# Makefile Data\n")
    target.write("#+--------------------------------------------------------------------------\n")
    target.write("\n")

    return

def add_srcs(target, data):
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

    return extension

def add_kernel_flags(target, data):
    target.write("# SDS Options\n")
    target.write("HW_FLAGS := \n")
    target.write("ifneq ($(TARGET), cpu_emu)\n")
    for acc in data["accelerators"]:
        target.write("\tHW_FLAGS += -sds-hw ")
        target.write(acc["name"])
        target.write(" ")
        target.write(acc["location"])    
        target.write(" -sds-end\n")
    target.write("endif\n")
    target.write("\n")

    target.write("EMU_FLAGS := \n")
    target.write("ifneq ($(TARGET), hw)\n")
    target.write("\tEMU_FLAGS := -mno-bitstream -mno-boot-files -emulation $(EMU_MODE)\n")
    target.write("endif\n")
    target.write("\n")

    target.write("# Compilation and Link Flags\n")
    target.write("IFLAGS := -I.\n")
    target.write("CFLAGS = -Wall -O3 -c\n")
    target.write("CFLAGS += -I$(sds_utils_HDRS)\n")
    target.write("CFLAGS += $(ADDL_FLAGS)\n")
    target.write("LFLAGS = \"$@\" \"$<\" \n")

    target.write("#+---------------------------------------------------------------------\n")
    target.write("\n")

    target.write("SDSFLAGS := -sds-pf $(PLATFORM) \\\n")
    target.write("\t\t-target-os $(TARGET_OS) \n")

    target.write("ifeq ($(VERBOSE), 1)\n")
    target.write("SDSFLAGS += -verbose \n")
    target.write("endif\n")

    target.write("\n")

    target.write("# SDS Compiler\n")
    target.write("CC := sds++ $(SDSFLAGS)\n")
    target.write("\n")
    return

def mk_build_all(target, extension):
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
    target.write("ifeq ($(TARGET), cpu_emu) \n")
    target.write("\t@echo 'Ignore the warning which states that hw function is not a HW accelerator but has pragma applied for cpu_emu mode'\n")
    target.write("\t@echo ' '\n")    
    target.write("endif\n")
    target.write("\n")

    return

def run_emu(target):
    target.write("# Check Rule Builds the Sources and Executes on Specified Target\n")
    target.write("check: all\n")
    target.write("ifneq ($(TARGET), hw)\n\n")
    target.write("    ifeq ($(TARGET_OS), linux)\n")
    target.write("\t    cp $(ABS_COMMON_REPO)/utility/emu_run.sh $(BUILD_DIR)/\n")
    target.write("\t    cd $(BUILD_DIR) ; ./emu_run.sh $(EXECUTABLE)\n")
    target.write("    else\n")
    target.write("\t    cd $(BUILD_DIR) ; sdsoc_emulator -timeout 500\n")
    target.write("    endif\n\n")
    target.write("else\n")
    target.write("\t$(info \"This Release Doesn't Support Automated Hardware Execution\")\n")
    target.write("endif\n")
    target.write("\n")

    return

def mk_cleanall(target):
    target.write(".PHONY: cleanall clean ultraclean\n");
    target.write("clean:\n")
    target.write("\t$(RM) $(BUILD_DIR)/$(EXECUTABLE) $(OBJECTS)\n")

    target.write("\n")

    target.write("cleanall:clean\n")
    target.write("\t$(RM) -rf ./build .Xil\n")
    target.write("\n")

    return

def mk_docs(target):
    target.write(".PHONY: docs\n")
    target.write("docs: README.md\n")
    target.write("\n")

    target.write("README.md: description.json\n")
    target.write("\t$(ABS_COMMON_REPO)/utility/readme_gen/readme_gen.py description.json\n")
    target.write("\n")

    return

def mk_help(target):
    target.write("ECHO:= @echo\n")
    target.write("\n")
    target.write(".PHONY: help\n")
    target.write("\n")
    target.write("help::\n")
    target.write("\t$(ECHO) \"Makefile Usage:\"\n")
    target.write("\t$(ECHO) \"	make all TARGET=<cpu_emu/emu/hw> TARGET_OS=<linux/standalone>\"\n");
    target.write("\t$(ECHO) \"		Command to generate the design for specified Target and OS.\"\n")
    target.write("\t$(ECHO) \"\"\n")
    target.write("\t$(ECHO) \"	make clean TARGET=<cpu_emu/emu/hw> TARGET_OS=<linux/standalone>\"\n");
    target.write("\t$(ECHO) \"		Command to remove the generated non-hardware files.\"\n")
    target.write("\t$(ECHO) \"\"\n")
    target.write("\t$(ECHO) \"	make cleanall\"\n")
    target.write("\t$(ECHO) \"		Command to remove all the generated files.\"\n")
    target.write("\t$(ECHO) \"\"\n")
    target.write("\t$(ECHO) \"	make check TARGET=<cpu_emu/emu/hw> TARGET_OS=<linux/standalone>\"\n");
    target.write("\t$(ECHO) \"		Command to run application in emulation.\"\n")
    target.write("\t$(ECHO) \"\"\n")
    target.write("\n")

    return

script, desc_file = argv
desc = open(desc_file, 'r')
data = json.load(desc)
desc.close()
target = open("Makefile", "w")

create_params(target)
add_libs(target)
add_flags(target, data)
extension = add_srcs(target,data)
add_kernel_flags(target, data)
mk_build_all(target, extension)
run_emu(target)
mk_cleanall(target)
mk_docs(target)
mk_help(target)

target.close
