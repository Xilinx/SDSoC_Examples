# Sources are Converted into Objects

TARGETS:=hw
pwd:=$(CURDIR)

SDSCC := sds++

CPPFLAGS := -Wall -O3

OS := -sds-sys-config linux

PLATFORM := -sds-pf

CPP_SRCS += \
$(pwd)/src/main.cpp \
$(pwd)/src/row_array_2d.cpp

OBJS += \
$(pwd)/$(TARGETS)/main.o \
$(pwd)/$(TARGETS)/row_array_2d.o

CPP_DEPS += \
$(pwd)/$(TARGETS)/main.d \
$(pwd)/$(TARGETS)/row_array_2d.d

POLL_MODE := -poll-mode 1

DMCL_CLK := -dmclkid 1

EMULATION := -emulation

EMULATION_MODE := optimized

EMU_FLAGS := -mno-bitstream -mno-boot-files

# Builds Main Executable
all: SDx-build

# SDx Build Target
SDx-build: $(TARGETS)/row_array_2d.elf

# SDx Compiler Build Process
$(TARGETS)/row_array_2d.elf: $(OBJS) $(USER_OBJS)
	 mkdir -p $(TARGETS)
	 @echo 'Building Target: $@'
	 @echo 'Triggering: SDS++ Linker'
	 cd $(TARGETS) ; $(SDSCC) $(POLL_MODE) -o "row_array_2d.elf" $(OBJS) $(EMU_FLAGS) $(DMCL_CLK) $(OS) $(PLATFORM) "zc706" $(EMULATION) $(EMULATION_MODE)
	 @echo 'SDx Completed Building Target: $@'
	 @echo ' '

$(pwd)/$(TARGETS)/%.o: $(pwd)/src/%.cpp 
	 @echo 'Building file: $<' 
	 @echo 'Invoking: SDS++ Compiler' 
	 mkdir -p $(TARGETS)
	 cd $(TARGETS) ; $(SDSCC) $(CPPFLAGS) -I"../src" -c -MT"$@" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<" -sds-hw row_array_2d_accel row_array_2d.cpp -clkid 1 -sds-end $(OS) $(PLATFORM) "zc706"
	 @echo 'Finished building: $<' 
	 @echo ' ' 


# Removes SDS Build Directories
RM := rm -rf $(TARGETS)/_sds $(TARGETS)/sd_card

# Clean Target
clean:
	 -$(RM) $(OBJS) $(CPP_DEPS) row_array_2d.elf
	 -@echo ' '


.PHONY: all clean SDx-build

