#!/usr/bin/env python
from sys import argv
import json
import os
import subprocess

def create_subdir_mk(target, data):
    print "subdir i m in"
    return

def create_srcs_mk(target, data):
    print "srcs i m in"
    return
def create_obj_mk(target, data):
    print "obj i m in"
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
    create_obj_mk(src_target, data)
    obj_target.close
    mk_target = open("makefile", "w")
    create_mk(mk_target, data)
else:
    print "For now only emulation flow"
 
