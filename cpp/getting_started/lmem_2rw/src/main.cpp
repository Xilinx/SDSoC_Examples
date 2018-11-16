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

    This is a vector addition example to demonstrate utilization of both ports 
    of BRAM memory

*******************************************************************************/
#include <iostream>
#include <cstring>
#include <cstdlib>
#include "vadd.h"
#include "sds_utils.h"

#ifndef NUM_TIMES
#define NUM_TIMES 2  
#endif

// Software Solution
void vadd_sw(int *in1, int *in2, int *out, 
            int size)
{
    for(int i = 0; i < size; i++){
        out[i] = in1[i] + in2[i];
    }
}

int main(int argc, char** argv)
{
    // Size of input data
    size_t vector_size_bytes = sizeof(int) * DATA_SIZE;

    // Allocate buffers using sds_alloc
    int *in1         = (int *) sds_alloc(vector_size_bytes);
    int *in2         = (int *) sds_alloc(vector_size_bytes);
    int *hw_results  = (int *) sds_alloc(vector_size_bytes);

    // Allocate software output buffer
    int *sw_results  = (int *) malloc(vector_size_bytes);

    if((in1 == NULL) || (in2 == NULL) || (hw_results == NULL) 
            || (sw_results == NULL)){
        std::cout << "TEST FAILED : Failed to allocate memory" << std::endl;
        return -1;
    }

    sds_utils::perf_counter hw_ctr, sw_ctr;

    int size = DATA_SIZE;
    bool match = true;

    for (int i = 0; i < NUM_TIMES ; i++)
    {
        // Create the test data 
        for(int i = 0 ; i < DATA_SIZE ; i++){
            in1[i] = i;
            in2[i] = i * i;
            sw_results[i] = 0; 
            hw_results[i] = 0;
        }

        sw_ctr.start();
        //Launch the Software Solution
        vadd_sw(in1,in2,sw_results, size);
        sw_ctr.stop();

        hw_ctr.start();
        //Launch the Hardware Solution
        vadd_accel(in1,in2, hw_results,size);
        hw_ctr.stop();

        // Compare the results between PL and Simulation
        for (int i = 0 ; i < DATA_SIZE ; i++){
            if (hw_results[i] != sw_results[i]){
                std::cout << "Error: Result mismatch" << std::endl;
                std::cout << "i = " << i << " CPU result = " << sw_results[i]
                        << " Hardware result = " << hw_results[i] << std::endl;
                match = false;
                break;
            }
        }
    }

    uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();

    double speedup = (double) sw_cycles / (double) hw_cycles;

    std::cout << "Number of CPU cycles running application in software: "
                << sw_cycles << std::endl;
    std::cout << "Number of CPU cycles running application in hardware: "
                << hw_cycles << std::endl;
    std::cout << "Speedup: " << speedup << std::endl;
    std::cout << "Note: Speed up is meaningful for real hardware execution only, not for emulation." << std::endl;
    
    // Release Memory
    sds_free(in1);
    sds_free(in2);
    sds_free(hw_results);
    free(sw_results);

    if (!match){
        std::cout << "TEST FAILED" << std::endl;
        return 1;
    }
    std::cout << "TEST PASSED" << std::endl;
    return 0;
}
