/**********
Copyright (c) 2016, Xilinx, Inc.
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

#include <iostream>
#include <cstring>
#include <stdio.h>
#include <math.h>
#include <stdint.h>
#include "row_array_2d.h"
#include "sds_lib.h"

class perf_counter
{
public:
	uint64_t tot, cnt, calls;
	perf_counter() : tot(0), cnt(0), calls(0) {};
	inline void reset() { tot = cnt = calls = 0; }
	inline void start() { cnt = sds_clock_counter(); calls++; };
	inline void stop() { tot += (sds_clock_counter() - cnt); };
	inline uint64_t avg_cpu_cycles() {return (tot / calls); };
};


//Utility to print array
void print_array(DTYPE *mat, const char *name, int size, int dim) {
    int i;
    printf("%s\n", name);
    for (i=0;i<size;i++) {
      printf("%d ",mat[i]);
      if (((i+1) % dim) == 0)
        printf("\n");
    }
}
void row_array_2d_sw(DTYPE *a, DTYPE *sw_c, DTYPE alpha)
{
	for(int i = 0; i < BLOCK_SIZE; i++)
		sw_c[i] = alpha * a[i];
}

int main(int argc, char** argv)
{

    //Allocate Memory in Host Memory
    size_t vector_size_bytes = sizeof(DTYPE) * BLOCK_SIZE;
    DTYPE* a = (DTYPE*)sds_alloc(vector_size_bytes);// original data set given to device
    DTYPE* c = (DTYPE*)sds_alloc(vector_size_bytes);// results returned from device
    DTYPE* sw_c = (DTYPE*)sds_alloc(vector_size_bytes);// results returned from software

    // Create the test data and Software Result
    DTYPE alpha = 3;
    for(int i = 0; i < BLOCK_SIZE; i++) {
      a[i] = i;
      c[i] = 0;
      sw_c[i] = 0; //alpha*a[i];
    }

    perf_counter hw_ctr, sw_ctr;

    printf("kernel launched \n");
    //Launch the Kernel
    hw_ctr.start();
    row_array_2d_accel(a, c, alpha);
    hw_ctr.stop();

    printf("software module launched \n");
    //Launch the software solution
    sw_ctr.start();
    row_array_2d_sw(a, sw_c, alpha);
    sw_ctr.stop();

    uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
    double speedup = (double) sw_cycles / (double) hw_cycles;

    std::cout << "Average number of CPU cycles running mmult in software: "
			 << sw_cycles << std::endl;
    std::cout << "Average number of CPU cycles running mmult in hardware: "
				 << hw_cycles << std::endl;
    std::cout << "Speed up: " << speedup << std::endl;

    // Validate
    unsigned int correct = 0;              // number of correct results returned
    for (int i = 0;i < BLOCK_SIZE; i++) {
      if(c[i] == sw_c[i]) {
        correct++;
      } else {
        printf("\n wrong sw %d hw %d index %d \n", sw_c[i], c[i], i);
      }
    }

    // Print a brief summary detailing the results
    printf("Computed '%d/%d' correct values!\n", correct, BLOCK_SIZE);

    sds_free(a);
    sds_free(c);
    sds_free(sw_c);

    if(correct == BLOCK_SIZE){
        std::cout << "TEST PASSED." << std::endl;
        return EXIT_SUCCESS;
    }
    else{
        std::cout << "TEST FAILED." << std::endl;
        return EXIT_FAILURE;
    }
}
