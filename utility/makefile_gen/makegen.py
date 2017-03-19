#!/usr/bin/env python
from sys import argv
import json
import os
import subprocess

def create_subdir_mk(target, data):
    target.write("SDSCC := sds++\n")
    target.write("\n")
    target.write("OS := -sds-sys-config ")
    os_config = data.get('os')
    target.write(os_config)
    target.write("\n")
    target.write("\n")
    target.write("PLATFORM := -sds-pf\n")
    target.write("\n")
    elem_count = len(data["src_files"])
    target.write("CPP_SRCS += \\\n")
    for result in data["src_files"]:
        elem_count -= 1
        target.write("../src/")
        target.write(result)
        target.write(".cpp")
        if elem_count != 0:
            target.write(" \\\n")
    target.write("\n\n")
    
    obj_count = len(data["src_files"])
    target.write("OBJS += \\")
    target.write("\n")
    for result in data["src_files"]:
        obj_count -= 1
        target.write("./src/")
        target.write(result)
        target.write(".o")
        if obj_count != 0:
            target.write(" \\\n")
    target.write("\n\n")

    dep_count = len(data["src_files"])
    target.write("CPP_DEPS += \\")
    target.write("\n")
    for result in data["src_files"]:
        dep_count -= 1
        target.write("./src/")
        target.write(result)
        target.write(".d")
        if dep_count != 0:
            target.write(" \\\n")
    target.write("\n\n")
    
    target.write("src/%.o: ../src/%.cpp \n")
    target.write("\t @echo 'Building file: $<' \n")
    target.write("\t @echo 'Invoking: SDS++ Compiler' \n")
    target.write("\t")
    target.write("$(SDSCC) -Wall -O0 -g -I\"../src\" -c -fmessage-length=0 -MT\"$@\" -MMD -MP -MF\"$(@:%.o=%.d)\" -MT\"$(@)\" -o \"$@\" \"$<\" -sds-hw ")
    accel = data.get("hw_function")
    target.write(accel)
    target.write(" ")
    accel_file = data.get("accel_file")
    target.write(accel_file)
    target.write(" -clkid 1 -sds-end $(OS) $(PLATFORM) ")
    device = data.get("device")
    target.write("\"")
    target.write(device)
    target.write("\"")
    target.write("\n")
    target.write("\t @echo 'Finished building: $<' \n")
    target.write("\t @echo ' ' \n")
    return

def create_mk(target, data, emu_switch):

    target.write("# Sources are Converted into Objects\n")
    target.write("-include src/srcobj.mk")
    target.write("\n")
   
    target.write("\n")
    
    target.write("POLL_MODE := -poll-mode 1\n")
    target.write("\n")

    target.write("DMCL_CLK := -dmclkid 1\n")
    target.write("\n")
    
    target.write("EMULATION := -emulation\n")
    target.write("\n")
    emu_mode = data.get('emu_mode')
    target.write("EMULATION_MODE := ")
    target.write(emu_mode)
    target.write("\n")     
    target.write("\n")     

    target.write("# Builds Main Executable\n")
    target.write("all: SDx-build\n")
    target.write("\n")
    target.write("# SDx Build Target\n")
    target.write("SDx-build: ")
    executable = data.get("exe")
    target.write(executable)
    target.write("\n")
    target.write("\n")
    target.write("# SDx Compiler Build Process\n")
    target.write(executable)
    target.write(": $(OBJS) $(USER_OBJS)\n")
    target.write("\t @echo 'Building Target: $@'\n")
    target.write("\t @echo 'Triggering: SDS++ Linker'\n")
    target.write("\t $(SDSCC) $(POLL_MODE) -o ")
    target.write("\"")
    target.write(executable)
    target.write("\" ")
    if emu_switch == "Yes":
        target.write("$(OBJS) $(DMCL_CLK) -mno-bitstream -mno-boot-files $(OS) $(PLATFORM) ")
    else:
        target.write("$(OBJS) $(DMCL_CLK) $(OS) $(PLATFORM) ")
    target.write("\"")
    device = data.get("device")
    target.write(device)
    target.write("\"")
    if emu_switch == "Yes":
        target.write(" $(EMULATION) ")
        target.write("$(EMULATION_MODE)")

    target.write("\n")
    target.write("\t @echo 'SDx Completed Building Target: $@'\n")
    target.write("\t @echo ' '\n")
    target.write("\n")

    target.write("# Removes SDS Build Directories\n") 
    target.write("RM := rm -rf _sds sd_card\n")
    target.write("\n")

    target.write("# Clean Target\n")
    target.write("clean:\n")
    target.write("\t -$(RM) $(OBJS) $(CPP_DEPS) ")
    target.write(executable)
    target.write("\n")
    target.write("\t -@echo ' '\n")
    target.write("\n") 
    if emu_switch == "Yes": 
        target.write("# Builds Executable and Tests Emulation Execution on QEMU\n")
        target.write("check: all\n")
        target.write("\t ../../../utility/emu_run.sh ")
        target.write(executable)
        target.write("\n")
        target.write("\t -@echo ' '\n")
        target.write("\n")
    else:
        # Hardware check option can be included in future
        target.write("\n")

    target.write("\n") 
    target.write(".PHONY: all clean SDx-build\n")
    target.write("\n")

    return


script, desc_file = argv
desc = open(desc_file, 'r')
data = json.load(desc)
desc.close()
flow = data.get('build_flow')
if "emulation" == flow:
    os.makedirs("emulation")
    os.chdir("emulation")
    os.makedirs("src")
    os.chdir("src")
    sub_target = open("srcobj.mk", "w")
    create_subdir_mk(sub_target, data)
    sub_target.close
    os.chdir("../")
    emu_switch = "Yes"
    mk_target = open("makefile", "w")
    create_mk(mk_target, data, emu_switch)
else:
    os.makedirs("hardware") 
    os.chdir("hardware")
    os.makedirs("src")
    os.chdir("src")
    sub_target = open("srcobj.mk", "w")
    create_subdir_mk(sub_target, data)
    sub_target.close
    os.chdir("../")
    mk_target = open("makefile", "w")
    emu_switch = "No"
    create_mk(mk_target, data, emu_switch)
