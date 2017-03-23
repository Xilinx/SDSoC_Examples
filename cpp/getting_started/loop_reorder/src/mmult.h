#ifndef MMULT_H_
#define MMULT_H_


//Array Size to access
#define DATA_SIZE 64

//Maximum Array Size
#define MAX_SIZE 64

// DMA based
#pragma SDS data access_pattern(in1:SEQUENTIAL, in2:SEQUENTIAL, out:SEQUENTIAL)
void mmult_accel(
				const int in1[DATA_SIZE * DATA_SIZE],     // Read-Only Matrix 1
				const int in2[DATA_SIZE * DATA_SIZE],     // Read-Only Matrix 2
				int out[DATA_SIZE * DATA_SIZE],           // Output Result
				int size            // Size of one dimension of the matrices
				);

#endif
