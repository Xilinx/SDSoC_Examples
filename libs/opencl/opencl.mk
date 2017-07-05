# Definition of include file locations
OPENCL12_INCLUDE:= $(XILINX_SDACCEL)/runtime/include/1_2

# Library directories
SDA_LIB:=$(XILINX_SDACCEL)/lib/lnx64.o

opencl_CXXFLAGS=-I$(OPENCL12_INCLUDE)

OPENCL_LIB:=$(XILINX_SDACCEL)/runtime/lib/aarch64
opencl_LDFLAGS=-L$(OPENCL_LIB) -L$(SDA_LIB) -lxilinxopencl -lpthread
