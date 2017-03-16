SRCS_DIR = src
APPSOURCES = $(wildcard $(SRCS_DIR)/*.cpp)
ACCELERATOR = window_array_2d_accel
TARGETS = emu
PLATFORM = zc706
EXECUTABLE = sdx_$(ACCELERATOR)_$(TARGETS)_$(PLATFORM).elf
SDSFLAGS = -sds-pf ${PLATFORM} \
	-sds-hw $(ACCELERATOR) window_array_2d.cpp -sds-end

CC = sds++ ${SDSFLAGS}

CFLAGS = -Wall -O3 -c

LFLAGS = -O3

OBJECTS := $(APPSOURCES:.cpp=.o)
.PHONY: all

all: ${EXECUTABLE}

%.o: %.cpp
	${CC} ${CFLAGS} $< -o $@

.PHONY: check

check: 
ifeq ($(TARGETS), emu)
LFLAGS += -mno-bitstream -emulation optimized
check: $(EXECUTABLE)
	./run.sh $(EXECUTABLE)

${EXECUTABLE}: ${OBJECTS}
	${CC} ${LFLAGS} ${OBJECTS} -o $@

%.o: $(DIR)/%.cpp
	${CC} ${CFLAGS} $< -o $@ 
else
	$(error "Incorrect Target specified !! Supported Targets are <emu>")
endif

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
	${RM} -rf _sds sd_card *.log

