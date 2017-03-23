#ifndef VADD_H_
#define VADD_H_

#define DATA_SIZE 4096

#pragma SDS data zero_copy(in1, in2, out)
void vadd_accel(const unsigned int *in1, const unsigned int *in2, unsigned int *out, int size);

#endif
