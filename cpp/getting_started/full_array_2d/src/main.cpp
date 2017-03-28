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
#include <stdlib.h>
#include <stdint.h>

#include "sds_lib.h"
#include "mmult.h"

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


void mmult_sw(int *a, int *b, int *c, int size)
{
  int bufa[N][N], bufb[N][N], bufc[N][N];
  for (int i = 0 ; i < size ; i++) {
      memcpy(bufa[i], (int *) &a[i*size], size*sizeof(int));
      memcpy(bufb[i], (int *) &b[i*size], size*sizeof(int));
  }

  for (int row = 0; row < size; row++) {
    for (int col = 0; col < size; col++) {
      int result = 0;
      for (int k = 0; k < size; k++) {
        result += bufa[row][k] * bufb[k][col];
      }
      bufc[row][col] = result;
    }
  }
  for (int i = 0 ; i < size ; i++)
      memcpy((int *) &c[i*size], bufc[i], size*sizeof(int));
}

int main(int argc, char** argv)
{
    int size = DATA_SIZE;
    int matrix_size = size * size;
    if (size > N) {
        std::cout << "Size is bigger than internal buffer size, please use a size smaller than 256!" << std::endl;
        return EXIT_FAILURE;
    }

    size_t vector_size_bytes = sizeof(int) * matrix_size;

    // Allocate PL buffers using sds_alloc
    int *source_input_a     = (int *) sds_alloc(vector_size_bytes);
    int *source_input_b     = (int *) sds_alloc(vector_size_bytes);
    int *source_hw_results  = (int *) sds_alloc(vector_size_bytes);

    // Allocate software output buffer
    int *source_sw_results  = (int *) malloc(vector_size_bytes);

    // Create the test data and Software Result
    for(int i = 0 ; i < matrix_size ; i++){
        source_input_a[i] = i;
        source_input_b[i] = i;
        source_hw_results[i] = 0;
    }

    perf_counter hw_ctr, sw_ctr;

    sw_ctr.start();
    // Launch the software solution
    mmult_sw(source_input_a, source_input_b, source_sw_results, size);
    sw_ctr.stop();

    hw_ctr.start();
    // Launch the hardware solution
    mmult_accel(source_input_a, source_input_b, source_hw_results, size);
    hw_ctr.stop();

    uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
    double speedup = (double) sw_cycles / (double) hw_cycles;

    std::cout << "Average number of CPU cycles running mmult in software: "
              << sw_cycles << std::endl;
    std::cout << "Average number of CPU cycles running mmult in hardware: "
                  << hw_cycles << std::endl;
    std::cout << "Speed up: " << speedup << std::endl;

    // Compare the results of the Device to the simulation
    int match = 0;
    std::cout << "Result = " << std::endl;
    for (int i = 0 ; i < matrix_size ; i++){
        if (source_hw_results[i] != source_sw_results[i]){
            std::cout << "Error: Result mismatch" << std::endl;
            std::cout << "i = " << i << " CPU result = " << source_sw_results[i]
                << " Device result = " << source_hw_results[i] << std::endl;
            match = 1;
            break;
        }else{
            std::cout << source_hw_results[i] << " " ;
            if ( ( (i+1) % 16) == 0) std::cout << std::endl;
        }
    }

    // Release Memory from Host Memory
    sds_free(source_input_a);
    sds_free(source_input_b);
    sds_free(source_hw_results);
    free(source_sw_results);

    if (match){
        std::cout << "TEST FAILED." << std::endl;
        return EXIT_FAILURE;
    }
    std::cout << "TEST PASSED." << std::endl;
    return EXIT_SUCCESS;
}
