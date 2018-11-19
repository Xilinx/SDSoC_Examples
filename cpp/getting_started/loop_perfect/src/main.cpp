/**********
Copyright (c) 2018, Xilinx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**********/

/*******************************************************************************

    This is a nearest neighbor of a point example which showcases how making 
    a loop-nest perfect or semi-perfect can help in improving performance.

*******************************************************************************/

#include <iostream>
#include <cstring>
#include <stdlib.h>
#include <climits>
#include <stdio.h>
#include "nearest.h"
#include "sds_utils.h"

#ifndef NUM_TIMES
#define NUM_TIMES 2  
#endif

// Maximum possible distance between two points
#define INFINITY ULONG_MAX

#define SQUARE(x) ((x)*(x))

// Software implementation for finding nearest neighbor
void nearest_sw(
                int *in,      // Input Points Array - represented as integer
                int *point,   // Current Point for which the neighbor is found
                int *out,     // Output Point
                int size,     // Size of the input array
                int dim       // #Dimensions of the points
                )
{
    unsigned long curr_dist, min_dist = INFINITY;

    for(int i = 0; i < size; i++) {
        curr_dist = 0;

        // Calculate distance
        // No need to compute square root as the distances are only compared
        for(int j = 0; j < dim; j++) {
            curr_dist += SQUARE(point[j] - in[i*dim + j]);
        }

        // Update minimum distance
        if(curr_dist < min_dist) {

            min_dist = curr_dist;

            for(int k = 0; k < dim; k++) {
                out[k] = in[i*dim + k];
            }
        }
    }
}

int main(int argc, char** argv)
{
    if (DATA_DIM > MAX_DIM) {
        std::cout << DATA_DIM << "greater than " << MAX_DIM << "!"<< " Please use a"; 
        std::cout << "smaller DATA_DIM" << std::endl;
        return EXIT_FAILURE;
    }

    if (DATA_SIZE > MAX_SIZE) {
        std::cout << DATA_SIZE << "greater than " << MAX_SIZE << "!"<< " Please use"; 
        std::cout << "a smaller DATA_SIZE" << std::endl;
        return EXIT_FAILURE;
    }

    // Size of input data
    size_t vector_size_bytes = sizeof(int) * DATA_SIZE * DATA_DIM;

    // Allocate buffers using sds_alloc
    int *source_in  =       (int*) sds_alloc(vector_size_bytes);
    int *source_point =     (int*) sds_alloc(sizeof(int)*DATA_DIM);
    int *source_hw_result = (int*) sds_alloc(sizeof(int)*DATA_DIM);
    
    // Allocate software output buffer
    int *source_sw_result = (int*) malloc(sizeof(int)*DATA_DIM);

    // Check for failed memory allocation
    if((source_in == NULL) || (source_point == NULL) || (source_hw_result == NULL) || (source_sw_result == NULL)){
       std::cout << "TEST FAILED : Failed to allocate memory" << std::endl;
       return -1;
     }
   
    int size = DATA_SIZE;
    int dim = DATA_DIM;
    
    bool match = true;

    sds_utils::perf_counter hw_ctr, sw_ctr;
    
    for (int i = 0; i < NUM_TIMES ; i++)
    {
        // Create the test data
        for(int i = 0 ; i < DATA_SIZE*DATA_DIM; i++){
            source_in[i] = rand()%DATA_SIZE;
        }

        for(int i = 0 ; i < DATA_DIM; i++){
            source_point[i] = rand()%DATA_SIZE;
        }

        hw_ctr.start();
        // Launch Hardware Solution
        nearest_accel(source_in, source_point, source_hw_result, size, dim);
        hw_ctr.stop();

        sw_ctr.start();
        // Launch Software Solution
        nearest_sw(source_in, source_point, source_sw_result, size, dim);
        sw_ctr.stop();

        // Compare the nearest distances between software and hardware
        unsigned long dist_sw = 0, dist_hw = 0;
        for(int i = 0; i < dim; i++) {
            dist_sw += SQUARE(source_sw_result[i] - source_point[i]);
            dist_hw += SQUARE(source_hw_result[i] - source_point[i]);
        }

         if(dist_sw != dist_hw)
        {
            std::cout << "TEST FAILED." << std::endl;
            std::cout << "\tSoftware Min Dist = " << dist_sw << std::endl;
            std::cout << "\tHardware Min Dist = " << dist_hw << std::endl;
            match = false;
            break;
        }
    }

    uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();

    double speedup = (double) sw_cycles / (double) hw_cycles;

    std::cout << "Number of CPU cycles running application in software: "
                << sw_cycles << std::endl;
    std::cout << "Number of CPU cycles running application in hardware: "
                << hw_cycles << std::endl;
    std::cout << "Speed up: " << speedup << std::endl;
    std::cout << "Note: Speed up is meaningful for real hardware execution only, not for emulation." << std::endl;
 
    // Release Memory 
    sds_free(source_in);
    sds_free(source_point);
    sds_free(source_hw_result);
    free(source_sw_result);

   
    std::cout << "TEST "<< ((match) ? "PASSED." : "FAILED.") << std::endl;
    return (match ? 0 : 1);
}
