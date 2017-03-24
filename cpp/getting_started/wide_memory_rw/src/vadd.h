#ifndef VADD_H_
#define VADD_H_
#include <ap_int.h>

#define BUFFER_SIZE 128
#define DATAWIDTH   512
#define VECTOR_SIZE (DATAWIDTH / 32) // vector size is 16 (512/32 = 16)
typedef ap_uint<DATAWIDTH> uint512_dt;

//DATA_SIZE should be multiple of 16 as Kernel Code is using int16 vector datatype
//to read the operands from Global Memory. So every read/write to global memory
//will read 16 integers value.
#define DATA_SIZE 16384

#pragma SDS data zero_copy(in1, in2, out)
void vadd_accel(
        const uint512_dt in1[DATA_SIZE/16], // Read-Only Vector 1
        const uint512_dt in2[DATA_SIZE/16], // Read-Only Vector 2
        uint512_dt out[DATA_SIZE/16],       // Output Result
        int size               // Size in integer
        );
#endif
