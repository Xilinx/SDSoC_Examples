#ifndef NEAREST_H_
#define NEAREST_H_

// Current #Dimension and size of point array
#define DATA_DIM 16
#define DATA_SIZE 1024

// Maximum #Dimensions for a point
#define MAX_DIM 16

// Maximum size of point array
#define MAX_SIZE 1024

#pragma SDS data zero_copy(in,point,out) 
void nearest_accel(
				const int *in,      // Input Points Array
				const int *point,   // Current Point
				int *out,           // Output Point
				int size,           // Size of the input array
				int dim             // #Dimensions of the points
			);
#endif
