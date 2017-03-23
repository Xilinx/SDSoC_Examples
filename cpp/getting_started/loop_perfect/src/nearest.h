#ifndef NEAREST_H_
#define NEAREST_H_

// Current #Dimension and size of point array
#define DATA_DIM 16
#define DATA_SIZE 1024

// Maximum #Dimensions for a point
#define MAX_DIM 16

// Maximum size of point array
#define MAX_SIZE 1024

#pragma SDS data access_pattern(in:SEQUENTIAL, point:SEQUENTIAL, out:SEQUENTIAL)
void nearest_accel(
				const int in[DATA_SIZE*DATA_DIM],      // Input Points Array
				const int point[DATA_DIM],   // Current Point
				int out[DATA_DIM],           // Output Point
				int size,           // Size of the input array
				int dim             // #Dimensions of the points
			);
#endif
