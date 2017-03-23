#ifndef MMULT_H_
#define MMULT_H_


//Array Size to access
#define DATA_SIZE 64

//Maximum Array Size
#define MAX_SIZE 64

// DMA based
#pragma SDS data zero_copy(in1, in2, out)
void mmult_accel(
				const int *in1,     // Read-Only Matrix 1
				const int *in2,     // Read-Only Matrix 2
				int *out,           // Output Result
				int size            // Size of one dimension of the matrices
				);

#endif
