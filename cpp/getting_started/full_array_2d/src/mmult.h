#ifndef MMULT_H_
#define MMULT_H_

//define array size to access
#define DATA_SIZE 8
//define max local buffer size
#define N 256

// Zero copy interface enabled
#pragma SDS data zero_copy(a[0:64], b[0:64], c[0:64])
void mmult_accel(int *a, int *b, int *c, int size);

#endif
