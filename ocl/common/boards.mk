# By Default report is sefor estimate report generation
# 'system' for system report generation
REPORT:=none

# Default C++ Compiler Flags and xocc compiler flags
CXXFLAGS:=-Wall -O0 -g 
CLFLAGS:= --xp "param:compiler.preserveHlsOutput=1" --xp "param:compiler.generateExtraRunData=true" -s

ifneq ($(REPORT),none)
CLFLAGS += --report $(REPORT)
endif 

LDCLFLAGS:=$(CLFLAGS)

ifdef XILINX_SDX
XILINX_SDACCEL=${XILINX_SDX}
endif

ifndef XILINX_SDACCEL
$(error XILINX_SDX or XILINX_SDACCEL is not set. Please source the SDx settings64.{csh,sh} script before attempting to run examples)
endif

VIVADO=$(XILINX_SDX)/Vivado/bin/vivado


# Use the Xilinx OpenCL compiler
CLC:=$(XILINX_SDACCEL)/bin/xocc
LDCLC:=$(CLC)
EMCONFIGUTIL := $(XILINX_SDACCEL)/bin/emconfigutil --od

# By default build for ARM
ARCH:=ARM

DEVICES:= zcu102_es2_ocl
CXX:=$(XILINX_SDACCEL)/SDK/gnu/aarch64/lin/aarch64-linux/bin/aarch64-linux-gnu-g++

#if COMMON_REPO is not defined use the default value support existing Designs
COMMON_REPO ?= ../../

# By default build for hardware can be set to
#   hw_emu for hardware emulation
#   sw_emu for software emulation
#   or a collection of all or none of these
TARGETS:=hw

# By default only have one device in the system
NUM_DEVICES:=1

# sanitize_dsa - create a filesystem friendly name from dsa name
#   $(1) - name of dsa
COLON=:
PERIOD=.
UNDERSCORE=_
sanitize_dsa = $(strip $(subst $(PERIOD),$(UNDERSCORE),$(subst $(COLON),$(UNDERSCORE),$(1))))

device2dsa = $(if $(filter $(suffix $(1)),.xpfm),$(shell ${COMMON_REPO}/ocl/common/parsexpmf.py $(1) dsa 2>/dev/null),$(1))
device2sandsa = $(call sanitize_dsa,$(call device2dsa,$(1)))
device2dep = $(if $(filter $(suffix $(1)),.xpfm),$(dir $(1))/$(shell ${COMMON_REPO}/ocl/parsexpmf.py $(1) hw 2>/dev/null) $(1),)


