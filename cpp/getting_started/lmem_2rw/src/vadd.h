#ifndef VADD_H_
#define VADD_H_

#define DATA_SIZE 4096

// DMA based
#pragma SDS data access_pattern(in1:SEQUENTIAL, in2:SEQUENTIAL, out:SEQUENTIAL)
void vadd_accel(const unsigned int in1[DATA_SIZE], const unsigned int in2[DATA_SIZE], unsigned int out[DATA_SIZE], int size);

#endif
