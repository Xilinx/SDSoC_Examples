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
#include "vadd.h"
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

// Golden implementation
void vadd_golden(int a[DATA_SIZE], int size, int inc_value, int output[DATA_SIZE]){

    int burstbuffer[BURSTBUFFERSIZE];

    //Per iteration of this loop perform BURSTBUFFERSIZE vector addition
    for(int i=0; i < size;  i+=BURSTBUFFERSIZE)
    {
        int chunk_size = BURSTBUFFERSIZE;
        //boundary checks
        if ((i + BURSTBUFFERSIZE) > size)
            chunk_size = size - i;

        //memcpy creates a burst access to memory
        //multiple calls of memcpy cannot be pipelined and will be scheduled sequentially
        //memcpy requires a local buffer to store the results of the memory transaction
        //memcpy(burstbuffer,&a[i],chunk_size * sizeof (int));
        for(int k=0; k < chunk_size; k++){
            burstbuffer[k] = a[i+k];
        }

        //calculate and write results to global memory, the sequential write in a for loop can be inferred to a memory burst access automatically
        calc_write: for(int j=0; j < chunk_size; j++){
            burstbuffer[j] = burstbuffer[j] + inc_value;
            output[i+j] = burstbuffer[j];
        }
    }
}

int main(int argc, char** argv)
{
    int size = DATA_SIZE;
    int inc_value = INCR_VALUE;
    //Allocate Memory in Host Memory
    size_t vector_size_bytes = sizeof(int) * size;
    
    // Allocat PL buffers using sds_alloc 
    int *source_input       = (int *) sds_alloc(vector_size_bytes);
    int *source_hw_results  = (int *) sds_alloc(vector_size_bytes);

    // Allocate Software Output Buffer
    int *source_sw_results  = (int *) malloc(vector_size_bytes);

    // Create the test data and Software Result
    for(int i = 0 ; i < size ; i++){
        source_input[i] = i;
        source_sw_results[i] = 0; //i + inc_value;
        source_hw_results[i] = 0;
    }

    perf_counter hw_ctr, sw_ctr;

    hw_ctr.start();
    //Launch the Hardware Solution
    vadd_accel(source_input, size, inc_value, source_hw_results);
    hw_ctr.stop();

    sw_ctr.start();
    //Launch the Software Solution
    vadd_golden(source_input, size, inc_value, source_sw_results);
    sw_ctr.stop();

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
    for (int i = 0 ; i < size ; i++){
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
    sds_free(source_input);
    sds_free(source_hw_results);
    free(source_sw_results);

    if (match){
        std::cout << "TEST FAILED." << std::endl;
        return -1;
    }
    std::cout << "All Device results match CPU results! " << std::endl;
    std::cout << "TEST PASSED." << std::endl;
    return 0;
}
