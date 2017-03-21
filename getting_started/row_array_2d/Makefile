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
# (individually and collectively, "Critical Applications"). Customer assumes the
# sole risk and liability of any use of Xilinx products in Critical Applications,
# subject only to applicable laws and regulations governing limitations on product
# liability.
# 
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT
# ALL TIMES. 
#+---------------------------------------------------------------------------
# The following Parameters may be overidden through the make command line. If
# not overidden, the defaults defined below will be used. Do not include data
# you do not want overwridden
#+---------------------------------------------------------------------------
PLATFORM = zcu102_es2

# Run Target:
#   hw  - compile for hardware
#   emu - compile for emulation
RUN_TARGET = hw

# Target OS:
#    linux, standalone, rtos
SDS_TARGET_OS = linux

# Emulation Mode:
#   debug     - Include debug data
#   optimized - Exclude debug data
SDS_EMU_MODE = optimized

# Additional sds++ flags - this should be reserved for sds++ flags defined
# at run-time.  Other sds++ options should be defined in the make file data
# section below
SDS_ADDL_FLAGS = 

# Set to 1 (number one) to enable sds++ verbose output
SDS_VERBOSE =

EXECUTABLE = add.elf

#+---------------------------------------------------------------------------
# Makefile Data
#+---------------------------------------------------------------------------
# Source Files
C_SOURCES =
CPP_SOURCES = add.cpp main.cpp

# SDS Options
#
SDS_HW_FLAGS = -sds-hw add add.cpp -sds-end

SDS_EMU_FLAGS =
ifeq ($(RUN_TARGET),emu)
   SDS_EMU_FLAGS = -mno-bitstream -emulation ${SDS_EMU_MODE}
endif

# Comnpilation and Link Flags
IFLAGS = -I.
CFLAGS = -Wall -g -c
LFLAGS = -g

#+---------------------------------------------------------------------------

SDSFLAGS = -sds-pf ${PLATFORM} \
	${SDS_HW_FLAGS} -target-os ${SDS_TARGET_OS} \
	${SDS_ADDL_FLAGS} ${SDS_EMU_FLAGS}

CC = sds++ ${SDSFLAGS}

OBJECTS := $(C_SOURCES:.c=.o) $(CPP_SOURCES:.cpp=.o)
DEPS := $(OBJECTS:.o=.d)

.PHONY: all

all: ${EXECUTABLE}

${EXECUTABLE}: ${OBJECTS}
	${CC} ${LFLAGS} ${OBJECTS} -o $@ 

-include ${DEPS}

%.o: %.cpp
	${CC} ${CFLAGS} ${IFLAGS} $< -o $@

%.o: %.c
	${CC} ${CFLAGS} ${IFLAGS} $< -o $@

clean:
	${RM} ${EXECUTABLE} ${OBJECTS} ${DEPS}

ultraclean: clean
	${RM} ${EXECUTABLE}.bit 
	${RM} -rf _sds sd_card

