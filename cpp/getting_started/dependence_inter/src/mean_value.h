#ifndef MEAN_VALUE_H_
#define MEAN_VALUE_H_

#define DATA_SIZE 256
#define INCR_VALUE 10

// Zero copy interface enabled between PS & PL
#pragma SDS data zero_copy(in, out)
void mean_value_accel(int *in, int *out, int size);

#endif
