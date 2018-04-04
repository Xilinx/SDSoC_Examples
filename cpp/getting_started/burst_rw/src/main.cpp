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

/*****************************************************************************
    
    This is a simple vector increment example to demonstrate burst access of 
    data from DDR to Programmable Logic

******************************************************************************/

#include <iostream>
#include <cstring>
#include <stdlib.h>
#include "vec_incr.h"
#include "sds_utils.h"

// Golden implementation
void vec_incr_golden(int *in, int *out, int size, int inc_value)
{
    for(int j=0; j < size; j++){
        out[j] = in[j] + inc_value;
    }
}

int main(int argc, char** argv)
{
    int size = DATA_SIZE;
    int inc_value = INCR_VALUE;
   
    // Size of the Input Data
    size_t vector_size_bytes = sizeof(int) * size;
    
    // Allocate buffers using sds_alloc 
    int *source_input       = (int *) sds_alloc(vector_size_bytes);
    int *source_hw_results  = (int *) sds_alloc(vector_size_bytes);

    // Allocate Software Output Buffer
    int *source_sw_results  = (int *) malloc(vector_size_bytes);

    if((source_input == NULL) || (source_hw_results == NULL) || (source_sw_results == NULL)){
        std::cout << "TEST FAILED : Failed to allocate memory" << std::endl;
        return -1;
    }

    // Create the test data
    for(int i = 0 ; i < size ; ++i){
        source_input[i] = i;
        source_sw_results[i] = 0;
        source_hw_results[i] = 0;
    }

    sds_utils::perf_counter hw_ctr, sw_ctr;

    hw_ctr.start();
    //Launch the Hardware Solution
    vec_incr_accel(source_input, source_hw_results, size, inc_value);
    hw_ctr.stop();

    //Launch the Software Solution
    vec_incr_golden(source_input, source_sw_results, size, inc_value);

    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
    std::cout << "Number of CPU cycles running application in hardware: "
              << hw_cycles << std::endl;
    
    // Compare the results of the Hardware to the simulation
    bool match = true;
    for (int i = 0 ; i < size ; i++){
        if (source_hw_results[i] != source_sw_results[i]){
            std::cout << "Error: Result mismatch" << std::endl;
            std::cout << "i = " << i << " CPU result = " << source_sw_results[i]
                << " Hardware result = " << source_hw_results[i] << std::endl;
            match = false;
            break;
        }
    }

    // Release Memory 
    sds_free(source_input);
    sds_free(source_hw_results);
    free(source_sw_results);

    if (!match){
        std::cout << "TEST FAILED." << std::endl;
        return -1;
    }
    std::cout << "All Hardware results match CPU results! " << std::endl;
    std::cout << "TEST PASSED." << std::endl;
    return 0;
}
