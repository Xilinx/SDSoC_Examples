#ifndef MMULT_H_
#define MMULT_H_

//Array Size to access
#define DATA_SIZE 12

//Maximum Array Size
#define MAX_SIZE 12

// Zero Copy interface enabled
#pragma SDS data zero_copy(a, b, c)
void mmult_accel(
			    const int *a,   // Read-Only Matrix A
			    const int *b,   // Read-Only Matrix B
			    int *c,         // Output Result
			    int a_row,      // Matrix A Row Size
			    int a_col,      // Matrix A Col Size
			    int b_col       // Matrix B Col Size
		    );

#endif
