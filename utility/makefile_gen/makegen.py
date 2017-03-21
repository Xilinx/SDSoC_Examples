#!/usr/bin/env python
from sys import argv
import json
import glob
import os
import subprocess

def create_mk(target, data):
    
    target.write("pwd := $(CURDIR)\n")
    target.write("\n")

    target.write("TARGETS := hw\n")
    target.write("\n")
    
    target.write("SDSCC := sds++\n")
    target.write("\n")

    target.write("CPPFLAGS := -Wall -O3\n")
    target.write("\n")

    target.write("OS := ")
    os = data.get("os")
    target.write(os) 
    target.write("\n")
    target.write("\n")
    
    target.write("PLATFORM := ")
    pf = data.get("device")
    target.write(pf)
    target.write("\n")    
    target.write("\n")
    return


script, desc_file = argv
desc = open(desc_file, 'r')
data = json.load(desc)
desc.close()
target = open("Makefile", "w")
create_mk(target, data)
os.chdir("src")
count = 0
for file in glob.glob("*.cpp"):
    count = count + 1
temp = count
target.write("CPP_SRCS += \\")
target.write("\n")
for result in glob.glob("*.cpp"):
    temp -= 1
    target.write("$(pwd)/src/")
    target.write(result)
    if temp != 0:
        target.write(" \\\n")
target.write("\n\n")

temp = count
target.write("OBJS += \\")
target.write("\n")
for result in glob.glob("*.cpp"):
    temp -= 1
    target.write("$(pwd)/$(TARGETS)/")
    obj = result.replace(".cpp", ".o")
    target.write(obj)
    if temp != 0:
        target.write(" \\\n")
target.write("\n\n")

temp = count
target.write("CPP_DEPS += \\")
target.write("\n")
for result in glob.glob("*.cpp"):
    temp -= 1
    target.write("$(pwd)/$(TARGETS)/")
    obj = result.replace(".cpp", ".d")
    target.write(obj)
    if temp != 0:
        target.write(" \\\n")
target.write("\n\n")

target.write("SDS_POLL := -poll-mode\n")
target.write("SDS_POLL_MODE := 1\n")
target.write("SDS_DMCL_CLK := -dmclkid\n")
target.write("SDS_DMCL_CLK_ID := 1\n")
target.write("\n")

target.write("EMULATION := -emulation\n")
target.write("EMULATION_MODE := optimized\n")
target.write("EMULATION_FLAGS := -mno-bitstream -mno-boot-files\n")
target.write("\n")
target.write("CFLAGS += -MMD -MP -MF\"$(@:%.o=%.d)\"")
target.write("\n")
target.write("# Builds Main Executable\n")
target.write("all: SDx-build\n")
target.write("\n")

target.write("# SDx Build Target\n")
target.write("SDx-build: $(TARGETS)/")
exe = data.get("exe")
target.write(exe)
target.write("\n")
target.write("\n")

target.write("# SDx Compiler Build Process\n")
target.write("$(TARGETS)/")
target.write(exe)
target.write(": $(OBJS)\n")

target.write("\t mkdir -p $(TARGETS)\n")
target.write("\t @echo 'Building Target: $@'\n")
target.write("\t @echo 'Triggering: SDS++ Linker'\n")
target.write("\t cd $(TARGETS) ; $(SDSCC) $(SDS_POLL) $(SDS_POLL_MODE) -o ")
target.write("\"")
target.write(exe)
target.write("\" ")
target.write("$(OBJS) $(EMULATION_FLAGS) $(SDS_DMCL_CLK) $(SDS_DMCL_CLK_ID) -target-os $(OS) $(PLATFORM) ")
target.write("\"")
device = data.get("device")
target.write(device)
target.write("\" ")
target.write("$(EMULATION) $(EMULATION_MODE)\n")
target.write("\t @echo 'SDx Completed Building Target: $@'\n")
target.write("\t @echo ' '\n")


target.write("\n")

target.write("$(pwd)/$(TARGETS)/%.o: $(pwd)/src/%.cpp\n")
target.write("\t @echo 'Building file: $<'\n")
target.write("\t @echo 'Invoking: SDS++ Compiler'\n")
target.write("\t mkdir -p $(TARGETS)\n")
target.write("\t cd $(TARGETS) ;")
target.write(" $(SDSCC) $(CPPFLAGS) ")
target.write("-c -MT $@ $(CFLAGS) -MT $@ -o $@ $< -sds hw ")
hf = data.get("hw_function")
target.write(hf)
target.write(" ")
hf_file = data.get("accel_file")
target.write(" -clkid 1 -sds-end -target-os $(OS) $(PLATFORM)")
target.write("\"")
target.write(device)
target.write("\"\n")

target.write("\t @echo 'Finished Building: $<'\n")
target.write("\t @echo ' '\n")

target.write("# Removes SDS Build Directories\n")
target.write("RM := rm -rf $(TARGETS)/_sds $(TARGETS)/sd_card \n")

target.write("\n")

target.write("# Clean Target\n")
target.write("clean:\n")
target.write("\t -$(RM) $(OBJS) $(CPP_DEPS)")
target.write(exe)
target.write("\n")
target.write("\t -@echo ' '\n")

target.write(".PHONEY: all clean SDx-build\n")
























target.close
