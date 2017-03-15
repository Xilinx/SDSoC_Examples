APPSOURCES = host.cpp window_array_2d.cpp
EXECUTABLE = host.elf
EMU_EXE = host_emu.elf
PLATFORM = zc706
SDSFLAGS = -sds-pf ${PLATFORM} \
	-sds-hw window_array_2d_accel  window_array_2d.cpp -sds-end

CC = sds++ ${SDSFLAGS}

CFLAGS = -Wall -O3 -c

LFLAGS = -O3

OBJECTS := $(APPSOURCES:.cpp=.o)

.PHONY: all

all: ${EXECUTABLE}

${EXECUTABLE}: ${OBJECTS}
	${CC} ${LFLAGS} ${OBJECTS} -o $@ 

%.o: %.cpp
	${CC} ${CFLAGS} $< -o $@

.PHONY: check


check: ${EMU_EXE}
	./run.sh ${EMU_EXE}

${EMU_EXE}: ${OBJECTS}
	${CC} ${LFLAGS} -mno-bitstream -emulation optimized ${OBJECTS} -o $@

%.o: %.cpp
	${CC} ${CFLAGS} $< -o $@ 



clean:
	${RM} ${EXECUTABLE} ${OBJECTS} ${EMU_EXE}
	${RM} ${EXECUTABLE}.bit ${EMU_EXE} init.sh 
	${RM} -rf _sds sd_card *.jou *.log

