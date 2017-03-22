#!/usr/bin/env python
from sys import argv
import json
import os
import subprocess

DSA = 'zc706'
VERSION = 'SDx 2016.4'
DEVICES = {
    'AWS VU9P': ['TBD'],
    'zynq7000 702':['zc702','nx2'],
    'zynq7000 706':['zc706','nx1'],
    'UltraScale+ 102':['zcu102','nx3']
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
    target.write("8. ACKNOWLEDGEMENTS\n")
    target.write("9. REVISION HISTORY\n\n\n")
    return

def download(target):
    target.write("## 2. HOW TO DOWNLOAD THE REPOSITORY\n")
    target.write("To get a local copy of the SDSoC example repository, clone this repository to the local system with the following command:\n")
    target.write("```\n")
    target.write("git clone https://github.com/Xilinx/SDSoC_Examples examples\n")
    target.write("```\n")
    target.write("where examples is the name of the directory where the repository will be stored on the local system.")
    target.write("This command needs to be executed only once to retrieve the latest version of all SDAccel examples. The only required software is a local installation of git.\n\n")
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
    for board in data["board"]:
        target.write(board)
        target.write("|")
        target.write(DEVICES[board][0])
        target.write("|")
        for version in VERSION:
            target.write(version)
#        target.write("|")
#        target.write(DEVICES[board][1])
        target.write("\n")
    target.write("\n\n")
    target.write("Board targeted by default = ***%s***\n\n" %DSA)
    target.write("*NOTE:* The board/device used for compilation can be changed by adding the DEVICES variable to the make command as shown below\n")
    target.write("```\n")
    target.write("make PLATFORM=<device name>\n")
    target.write("```\n")
    target.write("where the *DEVICES* variable accepts one device.\n\n")
    try:
      if data['opencv']:
                target.write("***OpenCV for Example Applications***\n\n")
                target.write("This application requires OpenCV runtime libraries. If the host does not have OpenCV installed use the Xilinx included libraries with the following command:\n\n")
                target.write("```\n")
                target.write("export LD_LIBRARY_PATH=$XILINX_SDX/Vivado_HLS/lnx64/tools/opencv/:$LD_LIBRARY_PATH\n")
                target.write("```\n")
    except:
      pass
    return

def hierarchy(target):
    target.write("## 4. DESIGN FILE HIERARCHY\n")
    target.write("Application code is located in the src directory. ")
    target.write("Application executable and hardware function binary files are placed in a folder which is flow specific. For emulation directory name is \"emu\" in case of hardware flow \"hw\" \n")
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
    target.write("### Compiling for Application Emulation\n")
    target.write("As part of capabilities available to an application developer, SDSoC includes emulation environment to check the functional and design compatibility with selected hardware platform.\n")
    target.write("SDSoC emulation mode is named as \"emu\" , this mode allows developer to profile and evaluate the performance of a design before compiling for board deployment. It is highly recommended that all the applications are executed in emulation flow.\n")
    target.write("```\n")
    target.write("make all TARGET=emu\n")
    target.write("```\n")
    target.write("where\n")
    target.write("```\n")
    target.write("\tmake all TARGET=emu   -> Sources are built for emulation flow\n")
    target.write("```\n")
    target.write("### Executing Emulated Application \n")
    target.write("***Recommended Execution Flow for Example Applications in Emulation*** \n\n")
    target.write("The makefile for the application can directly execute with the following command:\n")
    target.write("```\n")
    target.write("make check TARGETS=emu\n\n")
    target.write("```\n")
    target.write("If the application has not been previously compiled, the check makefile rule will compile and execute the application in the emulation mode selected by the user.\n\n")
    target.write("### Compiling for Application Execution in the FPGA Accelerator Card\n")
    target.write("The command to deploy hardware function on programmable logic (PL)\n")
    target.write("```\n")
    target.write("make all TARGET=hw\n")
    target.write("```\n")
    target.write("The default target for the makefile is to compile for emulation. Therefore, setting the TARGET option is required.\n")
    target.write("\n*NOTE:* Compilation for hardware target results in generating custom logic for the specified hardware function in source code. \n")
    target.write("It is typical for hardware compile times to range from 30 minutes to a couple of hours.\n\n")



def support(target):
    target.write("\n## 7. SUPPORT\n")
    target.write("For more information about SDAccel check the [SDAccel User Guides][]\n\n")
    target.write("For questions and to get help on this project or your own projects, visit the [SDAccel Forums][].\n\n")
    target.write("To execute this example using the SDAccel GUI, follow the setup instructions in [SDAccel GUI README][]\n\n")
    return

def license(target):
    target.write("\n## 8. LICENSE AND CONTRIBUTING TO THE REPOSITORY\n")
    target.write("The source for this project is licensed under the [3-Clause BSD License][]\n\n")
    target.write("To contribute to this project, follow the guidelines in the [Repository Contribution README][]\n")

    return

def ack(target,data):
    target.write("\n## 9. ACKNOWLEDGEMENTS\n")
    target.write("This example is written by developers at\n")
    for contributor in data["contributors"]:
        target.write("- [")
        target.write(contributor["group"])
        target.write("](")
        target.write(contributor["url"])
        target.write(")\n")
    return

def revision(target,data):
    target.write("\n## 10. REVISION HISTORY\n")
    target.write("Date | README Version | Description\n")
    target.write("-----|----------------|------------\n")
    for rev in data["revision"]:
        target.write(rev["date"])
        target.write("|")
        target.write(rev["version"])
        target.write("|")
        target.write(rev["description"])
        target.write("\n")
    target.write("\n")
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
    target.write("[SDAccel Forums]: https://forums.xilinx.com/t5/SDAccel/bd-p/SDx\n")
    target.write("[SDAccel User Guides]: http://www.xilinx.com/support/documentation-navigation/development-tools/software-development/sdaccel.html?resultsTablePreSelect=documenttype:SeeAll#documentation\n")
    target.write("[Nimbix Getting Started Guide]: http://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_2/ug1240-sdaccel-nimbix-getting-started.pdf\n")
    target.write("[Walkthrough Video]: http://bcove.me/6pp0o482\n")
    target.write("[Nimbix Application Submission README]: " + root + "utility/nimbix/README.md\n")
    target.write("[Repository Contribution README]: " + root + "CONTRIBUTING.md\n")
    target.write("[SDaccel GUI README]: " + root + "GUIREADME.md\n")
    target.write("[AWS F1 Application Execution on Xilinx Virtex UltraScale Devices]: " + root + "README.md\n")
    target.write("[Nimbix Application Execution on Xilinx Kintex UltraScale Devices]: " + root + "utility/nimbix/README.md\n")
    target.write("[IBM SuperVessel Research Cloud on Xilinx Virtex Devices]: http://bcove.me/6pp0o482\n")
    return

# Get the argument from the description
script, desc_file = argv

# load the description file
print "SDAccel README File Genarator"
print "Opening the description file '%s'" % desc_file
desc = open(desc_file,'r')

# load the json data from the file
print "Parsing the description file"
data = json.load(desc)
desc.close()

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
revision(target,data)
footer(target)
target.close
