REPORT	:= none
TARGET	:= hw
PLATFORM:= zcu102_es2_ocl
BUILD_DIR:= ./build/$(PLATFORM)_$(TARGET)

CXX 	:= $(XILINX_SDX)/SDK/gnu/aarch64/lin/aarch64-linux/bin/aarch64-linux-gnu-g++
XOCC 	:= $(XILINX_SDX)/bin/xocc

# Points to Utility Directory
COMMON_REPO = ../../../
ABS_COMMON_REPO = $(shell readlink -f $(COMMON_REPO))
include $(ABS_COMMON_REPO)/libs/xcl2/xcl2.mk
include $(ABS_COMMON_REPO)/libs/bitmap/bitmap.mk

# host compiler global settings
CXXFLAGS += -I $(XILINX_SDX)/runtime/include/1_2/ -I/$(XILINX_SDX)/Vivado_HLS/include/ -O2 -g -Wall -fmessage-length=0 -std=c++14
LDFLAGS += -lxilinxopencl -lpthread -lrt -ldl -lcrypt -lstdc++ -L$(XILINX_SDX)/runtime/lib/aarch64 $(xcl2_CXXFLAGS) $(bitmap_CXXFLAGS)

# kernel compiler global settings
CLFLAGS = -t hw --platform $(PLATFORM) --save-temps  --clkid 0

ifneq ($(REPORT),none)
CLFLAGS += --report $(REPORT)
endif

BINARY_CONTAINERS += $(BUILD_DIR)/rgb_to_hsv.xclbin

BINARY_CONTAINER_1_OBJS += $(BUILD_DIR)/rgb_to_hsv.xo
ALL_KERNEL_OBJS += $(BUILD_DIR)/rgb_to_hsv.xo

ALL_MESSAGE_FILES = $(subst .xo,.mdb,$(ALL_KERNEL_OBJS)) $(subst .xclbin,.mdb,$(BINARY_CONTAINERS))

HOST_SRCS = src/host.cpp $(xcl2_SRCS) $(bitmap_SRCS)

HOST_EXE = host

.PHONY: all clean cleanall docs
all: $(BINARY_CONTAINERS) $(BUILD_DIR)/$(HOST_EXE) 

#Building Kernel
$(BUILD_DIR)/rgb_to_hsv.xo: ./src/rgb_to_hsv.cl
	@mkdir -p $(BUILD_DIR)
	-@$(RM) $@
	@echo 'Building Target: $@'
	$(XOCC) $(CLFLAGS) -c -s -k rgb_to_hsv --messageDb $(subst .xo,.mdb,$@) -I"$(<D)" --xp misc:solution_name=_xocc_compile_rgb_to_hsv -o"$@" "$<"
	@echo 'SDx Completed Building Target: $@'

$(BUILD_DIR)/rgb_to_hsv.xclbin: $(BINARY_CONTAINER_1_OBJS)
	$(XOCC) $(CLFLAGS) -l --nk rgb_to_hsv:1 --messageDb $(subst .xclbin,.mdb,$@) --xp misc:solution_name=_xocc_link_rgb_to_hsv -o"$@" $(+) --sys_config ocl

#Building Host 
$(BUILD_DIR)/$(HOST_EXE): $(HOST_SRCS)
	mkdir -p $(BUILD_DIR)
	@echo 'Building Target: $@'
	$(CXX) -o "$@" $(HOST_SRCS) $(CXXFLAGS) $(LDFLAGS)
	@echo 'SDx Completed Building Target: $@'

#Cleaning Stuff
RM = rm -f
RMDIR = rm -rf
clean:
	-$(RM) $(ALL_MESSAGE_FILES) $(HOST_EXE) 
	-$(RMDIR) embedded_root _xocc_* iprepo _sds
	-$(RM) *.xml *.tcl *.bat image.ub
	-$(RM) init.sh *.bit *.hdf $(PLATFORM)_* *.dat
	-$(RM) platform_desc.txt *.xtxt *.ko *.hpfm *.so

cleanall: clean
	-$(RM) $(BINARY_CONTAINERS) $(ALL_KERNEL_OBJS) $(HOST_EXE)
	-$(RMDIR) $(BUILD_DIR) ./build

docs:README.md

README.md: description.json
	$(ABS_COMMON_REPO)/ocl/common/readme_gen/readme_gen.py description.json
