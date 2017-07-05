COMMON_REPO := ../../../
#Common Includes
include ${COMMON_REPO}/ocl/common/boards.mk
include ${COMMON_REPO}/libs/xcl2/xcl2.mk
include ${COMMON_REPO}/libs/opencl/opencl.mk

# Host Application
host_SRCS=./src/vadd.cpp $(xcl2_SRCS)
host_HDRS=$(xcl2_HDRS)
host_CXXFLAGS=$(xcl2_CXXFLAGS) $(opencl_CXXFLAGS) -std=c++0x
host_LDFLAGS=$(opencl_LDFLAGS)


EXES=host

# kernel
vadd_SRCS=./src/krnl_vadd.cl

XOS=vadd

# vadd xclbin
vadd_XOS=vadd

XCLBINS=vadd


# check
vadd_LDCLFLAGS=--sys_config ocl

check_EXE=host
check_XCLBINS=vadd

# Pattern to allow cmdline to determine xclbin name
define mk_args
check_$(1)_$(call sanitize_dsa,$(2))_ARGS = ./xclbin/vadd.$(1).$(call sanitize_dsa,$(2)).xclbin
endef

$(foreach target,$(TARGETS),$(foreach device,$(DEVICES),$(eval $(call mk_args,$(target),$(device)))))


CHECKS=check

#Reporting warning if targeting for emulation
ifneq (,$(findstring sw_emu,$(TARGETS)))
$(warning WARNING:This example do not support sw_emu TARGETS. Please use hw for running.)
endif
ifneq (,$(findstring hw_emu,$(TARGETS)))
$(warning WARNING:This example do not support hw_emu TARGETS. Please use hw for running.)
endif

include ${COMMON_REPO}/ocl/common/rules.mk

