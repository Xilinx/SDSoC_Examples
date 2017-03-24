#ifndef MMULT_H_
#define MMULT_H_

//Array Size to access
#define DATA_SIZE 12

//Maximum Array Size
#define MAX_SIZE 12

// DMA based
#pragma SDS data access_pattern(a:SEQUENTIAL, b:SEQUENTIAL, c:SEQUENTIAL)
void mmult_accel(
			    const int *a,   // Read-Only Matrix A
			    const int *b,   // Read-Only Matrix B
			    int *c,         // Output Result
			    int a_row,      // Matrix A Row Size
			    int a_col,      // Matrix A Col Size
			    int b_col       // Matrix B Col Size
		    );

#endif
