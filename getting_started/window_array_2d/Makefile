# (c) Copyright 2013 - 2016 Xilinx, Inc. All rights reserved.
#
# This file contains confidential and proprietary information of Xilinx, Inc. and
# is protected under U.S. and international copyright and other intellectual
# property laws.
# 
# DISCLAIMER 
# This disclaimer is not a license and does not grant any rights to the materials
# distributed herewith. Except as otherwise provided in a valid license issued to
# you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE
# MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY
# DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
# INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR
# FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether
# in contract or tort, including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature related to, arising
# under or in connection with these materials, including for any direct, or any
# indirect, special, incidental, or consequential loss or damage (including loss
# of data, profits, goodwill, or any type of loss or damage suffered as a result
# of any action brought by a third party) even if such damage or loss was
# reasonably foreseeable or Xilinx had been advised of the possibility of the
# same.
#
# CRITICAL APPLICATIONS
# Xilinx products are not designed or intended to be fail-safe, or for use in any
# application requiring fail-safe performance, such as life-support or safety
# devices or systems, Class III medical devices, nuclear facilities, applications
# related to the deployment of airbags, or any other applications that could lead
# to death, personal injury, or severe property or environmental damage
# (individually and collectively, "Critical Applications").Customer assumes the
# sole risk and liability of any use of Xilinx products in Critical Applications,
# subject only to applicable laws and regulations governing limitations on product
# liability.
#
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT
# ALL TIMES.
#
#+-------------------------------------------------------------------------------
# The following Parameters may be overidden through the make command line. If not
# overidden, the defaults defined below will be used. Do not include data you do
# not want overwridden
#+-------------------------------------------------------------------------------

# Device Platform (Default ~ zc706)
PLATFORM := zc706

# Run Target:
#   hw  - Compile for hardware
#   emu - Compile for emulation (Default)
TARGET := emu

# Current Directory
pwd := $(CURDIR)

# Points to Utility Directory
COMMON_REPO = ../..

# Target OS:
#     linux (Default), standalone, rtos
TARGET_OS := linux

# Emulation Mode:
#     debug     - Include debug data
#     optimized - Exclude debug data (Default)
EMU_MODE := optimized

# Additional sds++ flags - this should be reserved for sds++ flags defined
# at run-time. Other sds++ options should be defined in the makefile data section below
# section below
ADDL_FLAGS := 

# Set to 1 (number one) to enable sds++ verbose output
VERBOSE := 
# Build Executable
EXECUTABLE := window_array_2d_accel.elf

#+--------------------------------------------------------------------------
# Makefile Data
#+--------------------------------------------------------------------------

# Source Files
SRC_DIR := src
CPP_SRCS += \
$(pwd)/$(SRC_DIR)/main.cpp \
$(pwd)/$(SRC_DIR)/window_array_2d.cpp

OBJECTS += \
$(pwd)/$(TARGET)/main.o \
$(pwd)/$(TARGET)/window_array_2d.o

CPP_DEPS += \
$(pwd)/$(TARGET)/main.d \
$(pwd)/$(TARGET)/window_array_2d.d

# SDS Options
#
HW_FLAGS := -sds-hw window_array_2d_accel window_array_2d.cpp -sds-end
EMU_FLAGS := 
ifeq ($(TARGET), emu)
	EMU_FLAGS := -mno-bitstream -mno-boot-files -emulation $(EMU_MODE)
endif

# Compilation and Link Flags
IFLAGS := -I.
CFLAGS = -Wall -O3 -c
CFLAGS += -MT"$@" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" 
LFLAGS = "$@" "$<" 
#+---------------------------------------------------------------------

SDSFLAGS := -sds-pf $(PLATFORM) \
	-target-os $(TARGET_OS) \
	$(ADDL_FLAGS)

# SDS Compiler
CC := sds++ $(SDSFLAGS)

.PHONY: all
all: $(TARGET)/$(EXECUTABLE)

$(TARGET)/$(EXECUTABLE): $(OBJECTS)
	mkdir -p $(TARGET)
	@echo 'Building Target: $@'
	@echo 'Trigerring: SDS++ Linker'
	cd $(TARGET) ; $(CC) -o $(EXECUTABLE) $(OBJECTS) $(EMU_FLAGS)
	@echo 'SDx Completed Building Target: $@'
	@echo ' '

$(pwd)/$(TARGET)/%.o: $(pwd)/$(SRC_DIR)/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: SDS++ Compiler'
	mkdir -p $(TARGET)
	cd $(TARGET) ; $(CC) $(CFLAGS) -o $(LFLAGS) $(HW_FLAGS)
	@echo 'Finished building: $<'
	@echo ' '

# Check Rule Builds the Sources and Executes on Specified Target
check: all
ifeq ($(TARGET), emu)
	cp $(COMMON_REPO)/utility/emu_run.sh $(TARGET)/
	cd $(TARGET) ; ./emu_run.sh $(EXECUTABLE)
else
	$(info "This Release Doesn't Support Automated Hardware Execution")
endif

clean:
	$(RM) $(EXECUTABLE) $(OBJECTS) $(CPP_DEPS)

ultraclean:
	$(RM) -rf $(TARGET)

