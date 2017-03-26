
#pragma SDS data zero_copy(in1, in2, out)
void matmul_partition_accel(int *in1,  // Read-Only Matrix 1
           int *in2,  // Read-Only Matrix 2
           int *out,        // Output Result
           int size);               // Local memory to store input and output matrices
