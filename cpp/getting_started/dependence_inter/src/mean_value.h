#ifndef MEAN_VALUE_H_
#define MEAN_VALUE_H_

#define DATA_SIZE 256
#define INCR_VALUE 10

// DMA based approach
#pragma SDS data access_pattern(in:SEQUENTIAL, out:SEQUENTIAL)
void mean_value_accel(int in[DATA_SIZE], int out[DATA_SIZE], int size);

#endif
