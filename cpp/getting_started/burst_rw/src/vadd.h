#ifndef VADD_H_
#define VADD_H_

#define DATA_SIZE 256
#define INCR_VALUE 10
//define internal buffer max size
#define BURSTBUFFERSIZE 2048

#pragma SDS data zero_copy(a,out)
void vadd_accel(int *a, int size, int inc_value, int *out);

#endif
