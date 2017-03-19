CPP_SRCS += \
../src/main.cpp \
../src/row_array_2d.cpp

OBJS += \
./src/main.o \
./src/row_array_2d.o

CPP_DEPS += \
./src/main.d \
./src/row_array_2d.d

src/%.o: ../src/%.cpp 
	 @echo 'Building file: $<' 
	 @echo 'Invoking: SDS++ Compiler' 
	sds++ -Wall -O0 -g -I"../src" -c -fmessage-length=0 -MT"$@" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<" -sds-hw row_array_2d_accel row_array_2d.cpp -clkid 1 -sds-end -sds-sys-config linux -sds-proc a9_0 -sds-pf "zc706"
	 @echo 'Finished building: $<' 
	 @echo ' ' 
