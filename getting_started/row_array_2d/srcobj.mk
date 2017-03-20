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

$(pwd)/$(TARGETS)/%.o: $(pwd)/src/%.cpp 
	 @echo 'Building file: $<' 
	 @echo 'Invoking: SDS++ Compiler' 
	 mkdir -p $(TARGETS)
	 chdir $(TARGETS) ; $(SDSCC) $(CPPFLAGS) -I"../src" -c -MT"$@" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<" -sds-hw row_array_2d_accel row_array_2d.cpp -clkid 1 -sds-end $(OS) $(PLATFORM) "zc706"
	 @echo 'Finished building: $<' 
	 @echo ' ' 
