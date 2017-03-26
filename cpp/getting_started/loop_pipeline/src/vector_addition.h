#pragma SDS data zero_copy(a, b, c)
void vadd_pipelined_accel(int *a,
                          int *b,
                          int *c,
                          const int len);
