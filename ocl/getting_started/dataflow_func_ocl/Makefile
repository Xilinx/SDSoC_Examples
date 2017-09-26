REPORT := none
TARGET := hw
PLATFORM := zcu102
BUILD_DIR := ./build/$(PLATFORM)_$(TARGET)

CXX := aarch64-linux-gnu-g++
XOCC := xocc

# Points to Utility Directory
COMMON_REPO = ../../../
ABS_COMMON_REPO = $(shell readlink -f $(COMMON_REPO))

# Include Libraries
include $(ABS_COMMON_REPO)/libs/xcl2/xcl2.mk

# Host compiler global settings
CXXFLAGS += -I $(XILINX_SDX)/runtime/include/1_2/ -I/$(XILINX_SDX)/Vivado_HLS/include/ -O2 -g -Wall -fmessage-length=0 -std=c++14
LDFLAGS += -lxilinxopencl -lpthread -lrt -ldl -lcrypt -lstdc++ -L$(XILINX_SDX)/runtime/lib/aarch64 $(xcl2_CXXFLAGS)

# Kernel compiler global settings
CLFLAGS = -t hw --platform $(PLATFORM) --save-temps  --clkid 0

ifneq ($(REPORT), none)
CLFLAGS += --report $(REPORT)
endif

BINARY_CONTAINERS += $(BUILD_DIR)/adder.xclbin
BINARY_CONTAINER_1_OBJS += $(BUILD_DIR)/adder.xo
ALL_KERNEL_OBJS += $(BUILD_DIR)/adder.xo


ALL_MESSAGE_FILES = $(subst .xo,.mdb,$(ALL_KERNEL_OBJS)) $(subst .xclbin,.mdb,$(BINARY_CONTAINERS))

HOST_SRCS = src/host.cpp $(xcl2_SRCS)

EXECUTABLE = adder

CP = cp -rf

.PHONY: all clean cleanall docs
all: $(BUILD_DIR)/$(EXECUTABLE) $(BINARY_CONTAINERS)
	- $(CP) $(BUILD_DIR)/$(EXECUTABLE) $(BUILD_DIR)/sd_card/

# Building kernel
$(BUILD_DIR)/adder.xo: ./src/adder.cl
	mkdir -p $(BUILD_DIR)
	-@$(RM) $@
	@echo 'Building Target: $@'
	$(XOCC) $(CLFLAGS) -c -k adder --messageDb $(subst .xo,.mdb,$@) -I'$(<D)' --xp misc:solution_name=_xocc_compile_adder -o'$@' '$<'
	@echo 'SDx Completed Building Target: $@'

$(BUILD_DIR)/adder.xclbin: $(BINARY_CONTAINER_1_OBJS)
	$(XOCC) $(CLFLAGS) -l --nk adder:1 --messageDb $(subst .xclbin,.mdb,$@) --xp misc:solution_name=_xocc_link_adder -o'$@' $(+) --sys_config ocl

# Building Host
$(BUILD_DIR)/$(EXECUTABLE): $(HOST_SRCS)
	mkdir -p $(BUILD_DIR)
	@echo 'Building Target: $@'
	$(CXX) -o '$@' $(HOST_SRCS) $(CXXFLAGS) $(LDFLAGS)
	@echo 'SDx Completed Building Target: $@'

# Cleaning stuff
RM = rm -f
RMDIR = rm -rf
clean:
	-$(RM) $(ALL_MESSAGE_FILES) $(EXECUTABLE)
	-$(RMDIR) embedded_root _xocc_* iprepo _sds
	-$(RM) *.xml *.tcl *.bat image.ub
	-$(RM) init.sh *.bit *.hdf $(PLATFORM)_* *.dat
	-$(RM) platform_desc.txt *.xtxt *.ko *.hpfm *.so
	-$(RMDIR) .Xil

cleanall: clean
	-$(RM) $(BINARY_CONTAINERS) $(ALL_KERNEL_OBJS) $(EXECUTABLE)
	-$(RMDIR) $(BUILD_DIR) ./build

docs: README.md

README.md: description.json
	$(ABS_COMMON_REPO)/ocl/common/readme_gen/readme_gen.py description.json

