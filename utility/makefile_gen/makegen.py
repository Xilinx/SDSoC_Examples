#!/usr/bin/env python
from sys import argv
import json
import os
import subprocess

def create_subdir_mk(target, data):
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
    target.write("sds++ -Wall -O0 -g -I\"../src\" -c -fmessage-length=0 -MT\"$@\" -MMD -MP -MF\"$(@:%.o=%.d)\" -MT\"$(@)\" -o \"$@\" \"$<\" -sds-hw ")
    accel = data.get("hw_function")
    target.write(accel)
    target.write(" ")
    accel_file = data.get("accel_file")
    target.write(accel_file)
    target.write(" -clkid 1 -sds-end -sds-sys-config linux -sds-proc a9_0 -sds-pf ")
    device = data.get("device")
    target.write("\"")
    target.write(device)
    target.write("\"")
    target.write("\n")
    target.write("\t @echo 'Finished building: $<' \n")
    target.write("\t @echo ' ' \n")
    return

def create_srcs_mk(target, data):
    target.write("LD_SRCS := \n")
    target.write("C_UPPER_SRCS := \n")
    target.write("CXX_SRCS := \n")
    target.write("OBJ_SRCS := \n")
    target.write("CC_SRCS := \n")
    target.write("C_SRCS := \n")
    target.write("CPP_SRCS := \n")
    target.write("O_SRCS := \n")
    target.write("CC_DEPS := \n")
    target.write("EXECUTABLES := \n")
    target.write("C_UPPER_DEPS := \n")
    target.write("OBJS := \n")
    target.write("CXX_DEPS := \n")
    target.write("C_DEPS := \n")
    target.write("CPP_DEPS := \n")
    target.write("\n")
    target.write("SUBDIRS := \\\n")
    target.write("src \\\n")
    target.write("\n")
    return

def create_obj_mk(target, data):
    target.write("USER_OBJS := \n")
    target.write("\n")
    target.write("LIBS := \n")
    return

def create_mk(target, data):
    print "make i m in"
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
    sub_target = open("subdir.mk", "w")
    create_subdir_mk(sub_target, data)
    sub_target.close
    os.chdir("../")
    src_target = open("sources.mk", "w")
    create_srcs_mk(src_target, data)
    src_target.close
    obj_target = open("objects.mk", "w")
    create_obj_mk(obj_target, data)
    obj_target.close
    mk_target = open("makefile", "w")
    create_mk(mk_target, data)
else:
    print "For now only emulation flow"
 
