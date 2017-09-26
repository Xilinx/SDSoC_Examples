#!/usr/bin/env python
from sys import argv
import json
import glob
import os
import subprocess

def create_params(target):
    target.write("REPORT := none\n")
    target.write("TARGET := hw\n")
    target.write("PLATFORM := zcu102\n")
    target.write("BUILD_DIR := ./build/$(PLATFORM)_$(TARGET)")
    target.write("\n")
    target.write("\n")
    
    target.write("CXX := ")
    target.write("aarch64-linux-gnu-g++\n")
    target.write("XOCC := ")
    target.write("xocc\n")
    target.write("\n")

    target.write("# Points to Utility Directory\n")
    target.write("COMMON_REPO = ../../../\n") 
    target.write("ABS_COMMON_REPO = $(shell readlink -f $(COMMON_REPO))\n")
    target.write("\n")

    return
   
def add_libs(target, data):
    target.write("# Include Libraries\n")
    for lib in data["libs"]:
        target.write("include $(ABS_COMMON_REPO)/libs/")
        target.write(lib)
        target.write("/")
        target.write(lib)    
        target.write(".mk\n")
    target.write("\n")

    return

def add_host_flags(target, data):
    target.write("# Host compiler global settings\n")
    target.write("CXXFLAGS += ")
    target.write("-I $(XILINX_SDX)/runtime/include/1_2/ -I/$(XILINX_SDX)/Vivado_HLS/include/ ")
    target.write("-O2 -g -Wall -fmessage-length=0 -std=c++14\n")
    target.write("LDFLAGS += ")
    target.write("-lxilinxopencl -lpthread -lrt -ldl -lcrypt -lstdc++ ")
    target.write("-L$(XILINX_SDX)/runtime/lib/aarch64")
    for lib in data["libs"]:
        target.write(" $(")
        target.write(lib)
        target.write("_CXXFLAGS)")
    target.write("\n\n")

    return

def add_kernel_flags(target):
    target.write("# Kernel compiler global settings\n")
    target.write("CLFLAGS = ")
    target.write("-t hw --platform $(PLATFORM) --save-temps  --clkid 0\n")
    target.write("\n")

    target.write("ifneq ($(REPORT), none)\n")
    target.write("CLFLAGS += --report $(REPORT)\n")
    target.write("endif\n")
    target.write("\n")

    return

def add_containers(target, data):
    for con in data["containers"]:
        target.write("BINARY_CONTAINERS += $(BUILD_DIR)/")
        target.write(con["name"])
        target.write(".xclbin\n")
        for acc in con["accelerators"]:
            target.write("BINARY_CONTAINER_1_OBJS += $(BUILD_DIR)/")
            target.write(acc["name"])
            target.write(".xo\n")
            target.write("ALL_KERNEL_OBJS += $(BUILD_DIR)/")
            target.write(acc["name"])
            target.write(".xo\n")
            target.write("\n")
    target.write("\n")

    target.write("ALL_MESSAGE_FILES = ")
    target.write("$(subst .xo,.mdb,$(ALL_KERNEL_OBJS)) ")
    target.write("$(subst .xclbin,.mdb,$(BINARY_CONTAINERS))\n")
    target.write("\n")

    return

def building_kernel(target, data):
    target.write("# Building kernel\n")
    for con in data["containers"]:
        for acc in con["accelerators"]:
            target.write("$(BUILD_DIR)/")
            target.write(acc["name"])
            target.write(".xo: ./")
            target.write(acc["location"])
            target.write("\n")
            target.write("\tmkdir -p $(BUILD_DIR)\n")
            target.write("\t-@$(RM) $@\n")
            target.write("\t@echo 'Building Target: $@'\n")
            target.write("\t$(XOCC) $(CLFLAGS) -c -k ")
            target.write(acc["name"])
            target.write(" --messageDb $(subst .xo,.mdb,$@) -I'$(<D)' --xp misc:solution_name=_xocc_compile_")
            target.write(acc["name"])
            target.write(" -o'$@' '$<'\n")
            target.write("\t@echo 'SDx Completed Building Target: $@'\n")
    target.write("\n")

    target.write("$(BUILD_DIR)/")
    target.write(data["containers"][0]["name"])
    target.write(".xclbin: $(BINARY_CONTAINER_1_OBJS)\n")
    target.write("\t$(XOCC) $(CLFLAGS) -l")
    for con in data["containers"]:
        for acc in con["accelerators"]:
            target.write(" --nk ")
            target.write(acc["name"])
            target.write(":1")
    target.write(" --messageDb $(subst .xclbin,.mdb,$@) --xp misc:solution_name=_xocc_link_")
    target.write(data["containers"][0]["name"])
    target.write(" -o'$@' $(+) --sys_config ocl\n")
    target.write("\n")

    return

def building_host(target):
    target.write("# Building Host\n")
    target.write("$(BUILD_DIR)/$(EXECUTABLE): $(HOST_SRCS)\n")
    target.write("\tmkdir -p $(BUILD_DIR)\n")
    target.write("\t@echo 'Building Target: $@'\n")
    target.write("\t$(CXX) -o '$@' $(HOST_SRCS) $(CXXFLAGS) $(LDFLAGS)\n")
    target.write("\t@echo 'SDx Completed Building Target: $@'\n")
    target.write("\n")

    return

def mk_clean(target):
    target.write("# Cleaning stuff\n")
    target.write("RM = rm -f\n")
    target.write("RMDIR = rm -rf\n")
    target.write("clean:\n")
    target.write("\t-$(RM) $(ALL_MESSAGE_FILES) $(EXECUTABLE)\n")
    target.write("\t-$(RMDIR) embedded_root _xocc_* iprepo _sds\n")
    target.write("\t-$(RM) *.xml *.tcl *.bat image.ub\n")
    target.write("\t-$(RM) init.sh *.bit *.hdf $(PLATFORM)_* *.dat\n")
    target.write("\t-$(RM) platform_desc.txt *.xtxt *.ko *.hpfm *.so\n")
    target.write("\t-$(RMDIR) .Xil\n")
    target.write("\n")

    target.write("cleanall: clean\n")
    target.write("\t-$(RM) $(BINARY_CONTAINERS) $(ALL_KERNEL_OBJS) $(EXECUTABLE)\n")
    target.write("\t-$(RMDIR) $(BUILD_DIR) ./build\n")
    target.write("\n")

    return
def mk_build_all(target, data):
    target.write("HOST_SRCS = ")
    target.write("src/host.cpp")
    for lib in data["libs"]:
        target.write(" $(")
        target.write(lib)
        target.write("_SRCS)")
    target.write("\n\n")

    target.write("EXECUTABLE = ")
    target.write(data["containers"][0]["name"])
    target.write("\n\n")

    target.write("CP = cp -rf\n")

    args = []
    if "cmd_args" in data:
        args = data["cmd_args"].split(" ")
        if any("/data" in string for string in args):
            target.write("DATA = ./data\n")

    target.write("\n")

    target.write(".PHONY: all clean cleanall docs\n")
    target.write("all: $(BUILD_DIR)/$(EXECUTABLE) $(BINARY_CONTAINERS)\n")
    target.write("\t- $(CP) $(BUILD_DIR)/$(EXECUTABLE) $(BUILD_DIR)/sd_card/\n")
    if any("/data" in string for string in args):
        target.write("\t- if test -d $(DATA); then $(CP) $(DATA) $(BUILD_DIR)/sd_card/; fi\n")
    target.write("\n")

    building_kernel(target, data)
    building_host(target)

    return

def create_mk(target, data):
    create_params(target)
    add_libs(target, data)
    add_host_flags(target, data)
    add_kernel_flags(target)
    add_containers(target, data)
    mk_build_all(target, data)
    mk_clean(target)

    return

script, desc_file = argv
desc = open(desc_file, 'r')
data = json.load(desc)
desc.close()
target = open("Makefile", "w")

create_mk(target, data)

target.write("docs: README.md\n")
target.write("\n")

target.write("README.md: description.json\n")
target.write("\t$(ABS_COMMON_REPO)/ocl/common/readme_gen/readme_gen.py description.json\n")
target.write("\n")

target.close
