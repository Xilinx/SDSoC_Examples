#ifndef VECTOR_ADDITION_H_
#define VECTOR_ADDITION_H_

#pragma SDS data zero_copy(a, b, c)
void vadd_pipelined_accel(int *a,
                          int *b,
                          int *c,
                          const int len);
#endif
