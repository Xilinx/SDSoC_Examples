# Sources are Converted into Objects

TARGETS:=hw
pwd:=$(CURDIR)

-include srcobj.mk

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
	 chdir $(TARGETS) ; $(SDSCC) $(POLL_MODE) -o "row_array_2d.elf" $(OBJS) $(DMCL_CLK) $(OS) $(PLATFORM) "zc706"
	 @echo 'SDx Completed Building Target: $@'
	 @echo ' '

# Removes SDS Build Directories
RM := rm -rf $(TARGETS)/_sds $(TARGETS)/sd_card

# Clean Target
clean:
	 -$(RM) $(OBJS) $(CPP_DEPS) row_array_2d.elf
	 -@echo ' '


.PHONY: all clean SDx-build

