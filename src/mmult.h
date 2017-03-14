#ifndef MMULT_H_
#define MMULT_H_


//define array size to access
#define DATA_SIZE 8
//define max local buffer size
#define N 256

// DMA based
#pragma SDS data access_pattern(a:SEQUENTIAL, b:SEQUENTIAL, c:SEQUENTIAL)
void mmult_accel(int a[DATA_SIZE * DATA_SIZE], int b[DATA_SIZE * DATA_SIZE], int c[DATA_SIZE * DATA_SIZE], int size);

#endif
