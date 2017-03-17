COMMON = ../..
SRCS_DIR = src
APPSOURCES = $(wildcard $(SRCS_DIR)/*.cpp)
ACCELERATOR = window_array_2d_accel
TARGETS = emu 
PLATFORM = zc706
EXECUTABLE = sdx_$(ACCELERATOR)_$(PLATFORM).elf
SDSFLAGS = -sds-pf $(PLATFORM) \
	-sds-hw $(ACCELERATOR) window_array_2d.cpp -sds-end

CC = sds++ $(SDSFLAGS)

CFLAGS = -Wall -O3 -c
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"
LFLAGS = -O3

OBJECTS := $(APPSOURCES:.cpp=.o)
DEPS := $(OBJECTS:.o=.d)

.PHONY: all

all: ${EXECUTABLE}

.PHONY: check

EMULATION_MODE = optimized

check: $(EXECUTABLE)
ifeq ($(TARGETS), emu)
	$(COMMON)/utility/$(TARGETS)_run.sh $(EXECUTABLE)
else
	$(info "Execution of program on hardware must be done outside make")
endif

ifeq ($(TARGETS), emu)
LFLAGS += -mno-bitstream -emulation $(EMULATION_MODE)
endif

${EXECUTABLE}: ${OBJECTS}
	${CC} ${LFLAGS} ${OBJECTS} -o $@ >> sdsoc.log

%.o: %.cpp
	${CC} ${CFLAGS} $< -o $@ > sdsoc.log


ECHO:= @echo

.PHONY: help
help::
	$(ECHO) ""
	$(ECHO) "   ======================================================================="
	$(ECHO) "                              Makefile Usage                              "  
	$(ECHO) "   ======================================================================="
	$(ECHO) ""
	$(ECHO) "	make all TARGETS=<emu/hw>"
	$(ECHO) "	 Command to generate the design for specified Target."
	$(ECHO) ""
	$(ECHO) "	make clean"
	$(ECHO) "	 Command to remove the all the build objects and redundant files"
	$(ECHO) ""
	$(ECHO) "	make check TARGETS=<emu>"
	$(ECHO) "	 Command to generate and execute the design for specified Target."
	$(ECHO) ""
	$(ECHO) "   ======================================================================="
	$(ECHO) ""

clean:
	${RM} ${EXECUTABLE} ${OBJECTS} ${EMU_EXE}
	${RM} ${EXECUTABLE}.bit ${EMU_EXE} init.sh 
	${RM} -rf _sds sd_card *.log *.jou *.elf src/*.o src/*.d


