#!/usr/bin/env python
from sys import argv
import json
import os
import subprocess

VERSION = 'SDx 2017.4'
DEVICES = {
    'zcu102': {
       'name': 'ZCU102 OpenCL',
    },
    'zcu104': {
       'name': 'ZCU104 OpenCL',
    },
    'zcu106': {
       'name': 'ZCU106 OpenCL',
    }
}

def header(target,data):
    target.write(data["example"])
    target.write("\n")
    target.write("======================\n\n")
    target.write("This README file contains the following sections:\n\n")
    target.write("1. OVERVIEW\n")
    target.write("2. HOW TO DOWLOAD THE REPOSITORY\n")
    target.write("3. SOFTWARE TOOLS AND SYSTEM REQUIREMENTS\n")
    target.write("4. DESIGN FILE HIERARCHY\n")
    target.write("5. COMPILATION AND EXECUTION\n")
    target.write("6. SUPPORT\n")
    target.write("7. LICENSE AND CONTRIBUTING TO THE REPOSITORY\n")
    target.write("8. ACKNOWLEDGEMENTS\n\n")
    return

def download(target):
    target.write("## 2. HOW TO DOWNLOAD THE REPOSITORY\n")
    target.write("To get a local copy of the SDSoC example repository, clone this repository to the local system with the following command:\n")
    target.write("```\n")
    target.write("git clone https://github.com/Xilinx/SDSoC_Examples examples\n")
    target.write("```\n")
    target.write("where examples is the name of the directory where the repository will be stored on the local system.")
    target.write("This command needs to be executed only once to retrieve the latest version of all SDSoC examples. The only required software is a local installation of git.\n\n")
    return

def overview(target,data):
    target.write("## 1. OVERVIEW\n")
    target.write(('\n').join(data["overview"]))
    target.write("\n\n")
    if 'perf_fields' in data:
        target.write("### PERFORMANCE\n")
        target.write(data["perf_fields"][0])
        target.write("|")
        target.write(data["perf_fields"][1])
        target.write("|")
        target.write(data["perf_fields"][2])
        target.write("\n")
        target.write("----|-----|-----\n")
        for result in data["performance"]:
            target.write(result["system"])
            target.write("|")
            target.write(result["constraint"])
            target.write("|")
            target.write(result["metric"])
            target.write("\n")
    if 'key_concepts' in data:
        target.write("***KEY CONCEPTS:*** ")
        elem_count = len(data["key_concepts"])
        for result in data["key_concepts"]:
            elem_count -= 1
            target.write(result)
            if elem_count != 0:
                target.write(", ")
        target.write("\n\n")
    if 'keywords' in data:
        target.write("***KEYWORDS:*** ")
        word_count = len(data["keywords"])
        for result in data["keywords"]:
            word_count -= 1
            target.write(result)
            if word_count != 0:
                target.write(", ")
        target.write("\n\n")
    return

def requirements(target,data):
    target.write("## 3. SOFTWARE AND SYSTEM REQUIREMENTS\n")
    target.write("Board | Device Name | Software Version\n")
    target.write("------|-------------|-----------------\n")

    nboard = []
    if 'nboard' in data:
        nboard = data['nboard']

    boards = [word for word in DEVICES if word not in nboard]

    for board in boards:
        target.write(DEVICES[board]['name'])
        target.write("|")
        target.write(board)
        target.write("|")
        for version in VERSION:
            target.write(version)
        target.write("\n")
    target.write("\n\n")
    target.write("*NOTE:* The board/platform used for compilation can be changed by adding the PLATFORM environmental variable to the make command as shown below\n")
    target.write("```\n")
    target.write("make PLATFORM=<board name> or make all PLATFORM=<board name>\n")
    target.write("```\n")
    target.write("where the *PLATFORM* variable accepts one board.\n\n")
    return

def hierarchy(target):
    target.write("## 4. DESIGN FILE HIERARCHY\n")
    target.write("Application code is located in the src directory. ")
    target.write("Accelerator binary files will be compiled to the build directory. ")
    target.write("A listing of all the files ")
    target.write("in this example is shown below\n\n")
    target.write("```\n")
    tree_cmd = ['git', 'ls-files']
    proc = subprocess.Popen(tree_cmd,stdout=subprocess.PIPE)
    output = proc.communicate()[0]
    target.write(output)
    target.write("```\n")
    target.write("\n")
    return

def compilation(target,data):
    target.write("## 5. COMPILATION AND EXECUTION\n")
    target.write("### Compiling for Application Execution on the FPGA Board\n")
    target.write("The command to compile the application for execution on the FPGA acceleration board is\n")
    target.write("```\n")
    target.write("make all\n")
    target.write("```\n")
    target.write("The default target for the makefile is to compile for hardware. Therefore, setting the TARGETS option is not required.\n\n")
    target.write("*NOTE:* Compilation for application execution in hardware generates custom logic to implement the functionality of the kernels in an application.\n")
    target.write("It is typical for hardware compile times to range from 30 minutes to a couple of hours.\n\n")

def support(target):
    target.write("\n## 6. SUPPORT\n")
    target.write("For more information about SDSoC check the [SDSoC user Guides][]\n\n")
    target.write("For questions and to get help on this project or your own projects, visit the [SDSoC Forums][].\n\n")
    return

def license(target):
    target.write("\n## 7. LICENSE AND CONTRIBUTING TO THE REPOSITORY\n")
    target.write("The source for this project is licensed under the [3-Clause BSD License][]\n\n")
    target.write("To contribute to this project, follow the guidelines in the [Repository Contribution README][]\n")

    return

def ack(target,data):
    target.write("\n## 8. ACKNOWLEDGEMENTS\n")
    target.write("This example is written by developers at\n")
    for contributor in data["contributors"]:
        target.write("- [")
        target.write(contributor["group"])
        target.write("](")
        target.write(contributor["url"])
        target.write(")\n")
    target.write("\n\n")    
    return

def dirTraversal(stop_file):
    stop_search = None
    level_count = 1
    s = os.path.join('..', stop_file)
    while level_count < 20:
        s = os.path.join('..', s)
        if os.path.isfile(s):
            break
        level_count += 1
    return level_count

def relativeTree(levels):
    s = '../'
    for i in range(0,levels):
        s += '../'
    return s

def footer(target):
    relativeLevels = dirTraversal("LICENSE.txt")
    root = relativeTree(relativeLevels)
    target.write("[3-Clause BSD License]: " + root + "LICENSE.txt\n")
    target.write("[SDSoC Forums]: https://forums.xilinx.com/t5/SDSoC-Development-Environment/bd-p/sdsoc\n")
    target.write("[SDSoC User Guides]: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2017_2/ug1027-sdsoc-user-guide.pdf\n")
    target.write("[Repository Contribution README]: " + root + "CONTRIBUTING.md\n")
    return

# Get the argument from the description
script, desc_file = argv

# load the description file
print "SDSoC README File Genarator"
print "Opening the description file '%s'" % desc_file
desc = open(desc_file,'r')

# load the json data from the file
print "Parsing the description file"
data = json.load(desc)
desc.close()

assert("OpenCL" in data['runtime'])

print "Generating the README for %s" % data["example"]
target = open("README.md","w")
header(target,data)
overview(target,data)
download(target)
requirements(target,data)
hierarchy(target)
compilation(target,data)
support(target)
license(target)
ack(target,data)
footer(target)
target.close
