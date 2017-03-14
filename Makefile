APPSOURCES = host.cpp mmult.cpp
EXECUTABLE = host.elf

PLATFORM = zc706
SDSFLAGS = -sds-pf ${PLATFORM} \
	-sds-hw mmult_accel  mmult.cpp -sds-end

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

check: ${EXECUTABLE}
		./run.sh ${EXECUTABLE}

${EXECUTABLE}: ${OBJECTS}
	${CC} ${LFLAGS} -mno-bitstream -emulation optimized ${OBJECTS} -o $@

%.o: %.cpp
	${CC} ${CFLAGS} $< -o $@ 



clean:
	${RM} ${EXECUTABLE} ${OBJECTS} 

ultraclean: clean
	${RM} ${EXECUTABLE}.bit 
	${RM} -rf _sds sd_card *.jou *.log
