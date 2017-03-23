#ifndef VADD_H_
#define VADD_H_

#define DATA_SIZE 256
#define INCR_VALUE 10
//define internal buffer max size
#define BURSTBUFFERSIZE 2048

// DMA Based
#pragma SDS data access_pattern(a:SEQUENTIAL, out:SEQUENTIAL)
void vadd_accel(int a[DATA_SIZE], int size, int inc_value, int out[DATA_SIZE]);

#endif
