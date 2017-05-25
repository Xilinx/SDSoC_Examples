
#+-------------------------------------------------------------------------------
# The following parameters are assigned with default values. These parameters can
# be overridden through the make command line
#+-------------------------------------------------------------------------------

# Device Platform (Default ~ zcu102_es2)
PLATFORM := zcu102_es2

# Run Target:
#   hw  - Compile for hardware
#   emu - Compile for emulation (Default)
TARGET := emu

# Current Directory
pwd := $(CURDIR)

# Points to Utility Directory
COMMON_REPO = ../../../
ABS_COMMON_REPO = $(shell readlink -f $(COMMON_REPO))

# Include Libraries
include $(ABS_COMMON_REPO)/libs/sds_utils/sds_utils.mk

# Target OS:
#     linux (Default), standalone
TARGET_OS := linux

# Emulation Mode:
#     debug     - Include debug data
#     optimized - Exclude debug data (Default)
EMU_MODE := optimized

# Additional sds++ flags - this should be reserved for sds++ flags defined
# at run-time. Other sds++ options should be defined in the makefile data section below
# section below
ADDL_FLAGS := -Wno-unused-label

# Set to 1 (number one) to enable sds++ verbose output
VERBOSE := 
# Build Executable
EXECUTABLE := run.elf 
# Build Directory
BUILD_DIR := build/$(PLATFORM)_$(TARGET_OS)_$(TARGET)
#+--------------------------------------------------------------------------
# Makefile Data
#+--------------------------------------------------------------------------

# Source Files
SRC_DIR := src
OBJECTS += \
$(pwd)/$(BUILD_DIR)/main.o \
$(pwd)/$(BUILD_DIR)/matmul.o

# SDS Options
HW_FLAGS :=
HW_FLAGS += -sds-hw matmul_partition_accel matmul.cpp -sds-end

EMU_FLAGS := 
ifeq ($(TARGET), emu)
	EMU_FLAGS := -mno-bitstream -mno-boot-files -emulation $(EMU_MODE)
endif

# Compilation and Link Flags
IFLAGS := -I.
CFLAGS = -Wall -O3 -c
CFLAGS += -MT"$@" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" 
CFLAGS += -std=c++0x
CFLAGS += -I$(sds_utils_HDRS)
CFLAGS += $(ADDL_FLAGS)
LFLAGS = "$@" "$<" 
#+---------------------------------------------------------------------

SDSFLAGS := -sds-pf $(PLATFORM) \
	-target-os $(TARGET_OS) 

# SDS Compiler
CC := sds++ $(SDSFLAGS)

.PHONY: all
all: $(BUILD_DIR)/$(EXECUTABLE)

$(BUILD_DIR)/$(EXECUTABLE): $(OBJECTS)
	mkdir -p $(BUILD_DIR)
	@echo 'Building Target: $@'
	@echo 'Trigerring: SDS++ Linker'
	cd $(BUILD_DIR) ; $(CC) -o $(EXECUTABLE) $(OBJECTS) $(EMU_FLAGS)
	@echo 'SDx Completed Building Target: $@'
	@echo ' '

$(pwd)/$(BUILD_DIR)/%.o: $(pwd)/$(SRC_DIR)/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: SDS++ Compiler'
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) ; $(CC) $(CFLAGS) -o $(LFLAGS) $(HW_FLAGS)
	@echo 'Finished building: $<'
	@echo ' '

# Check Rule Builds the Sources and Executes on Specified Target
check: all
ifeq ($(TARGET), emu)

    ifeq ($(TARGET_OS), linux)
	    cp $(ABS_COMMON_REPO)/utility/emu_run.sh $(BUILD_DIR)/
	    cd $(BUILD_DIR) ; ./emu_run.sh $(EXECUTABLE)
    else
	    cd $(BUILD_DIR) ; sdsoc_emulator -timeout 300
    endif

else
	$(info "This Release Doesn't Support Automated Hardware Execution")
endif

.PHONY: cleanall clean ultraclean
clean:
	$(RM) $(BUILD_DIR)/$(EXECUTABLE) $(OBJECTS)

cleanall:clean
	$(RM) -rf ./build .Xil

.PHONY: docs
docs: README.md

README.md: description.json
	$(ABS_COMMON_REPO)/utility/readme_gen/readme_gen.py description.json

ECHO:= @echo

.PHONY: help

help::
	$(ECHO) "Makefile Usage:"
	$(ECHO) "	make all TARGET=<emu/hw> TARGET_OS=<linux/standalone>"
	$(ECHO) "		Command to generate the design for specified Target and OS."
	$(ECHO) ""
	$(ECHO) "	make clean TARGET=<emu/hw> TARGET_OS=<linux/standalone>"
	$(ECHO) "		Command to remove the generated non-hardware files."
	$(ECHO) ""
	$(ECHO) "	make cleanall"
	$(ECHO) "		Command to remove all the generated files."
	$(ECHO) ""
	$(ECHO) "	make check TARGET=<emu/hw> TARGET_OS=<linux/standalone>"
	$(ECHO) "		Command to run application in emulation."
	$(ECHO) ""

