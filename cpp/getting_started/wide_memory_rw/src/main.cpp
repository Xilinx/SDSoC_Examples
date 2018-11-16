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

    Vector Addition using struct datatype of 128bit wide to utilize full
    memory data width

    Note : This example is to demonstrate Wide Memory access of 128 bit data width  
           using struct datatype. 128bit is the highest width supported by Zynq 
           Ultrascale boards. 

*******************************************************************************/
#include <iostream>
#include <cstring>
#include <stdlib.h>
#include "vadd.h"
#include "sds_utils.h"

#ifndef NUM_TIMES
#define NUM_TIMES 2  
#endif

int main(int argc, char** argv)
{
    // Size of the input data
    int size = DATA_SIZE;
    size_t vector_size_bytes = sizeof(int) * size;

    // Allocate buffers using sds_alloc
    int *in1         = (int *) sds_alloc(vector_size_bytes);
    int *in2         = (int *) sds_alloc(vector_size_bytes);
    int *hw_results  = (int *) sds_alloc(vector_size_bytes);
    int *sw_results  = (int *) sds_alloc(vector_size_bytes);

    //Checking for failed allocation
    if ( (in1 == NULL) || (in2 == NULL) 
            || (hw_results== NULL)  || (sw_results == NULL)){
        std::cout  << "TEST FAILED: Failed to allocate Memory" << std::endl;
        return -1;
    }

    sds_utils::perf_counter hw_ctr;
    bool match = true;

    for (int i = 0; i < NUM_TIMES ; i++)
    {
        // Create the test data
        for(int i = 0 ; i < size; i++){
            in1[i] = rand();
            in2[i] = rand();
            sw_results[i] = in1[i] + in2[i]; 
            hw_results[i] = 0;
        }

        hw_ctr.start();
        //Type-Casting int* datatype to wide_dt * to match Hardware Function 
        //declaration 
        vadd_accel( (wide_dt *)in1, 
                    (wide_dt *)in2, 
                    (wide_dt *)hw_results, 
                    size/NUM_ELEMENTS //changing size to number of wide_dt
                );
        hw_ctr.stop();

        // Compare the results of software and hardware
        for (int i = 0 ; i < size; i++){
            if (hw_results[i] != sw_results[i]){
                std::cout << "Error: Result mismatch" << std::endl;
                std::cout << "i = " << i << " CPU result = " << sw_results[i]
                    << " Hardware result = " << hw_results[i] << std::endl;
                match = false;
                break;
            }
        }
    }
    
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();

    std::cout << "Number of CPU cycles running application in hardware: "
                << hw_cycles << std::endl;

    // Release Memory
    sds_free(in1);
    sds_free(in2);
    sds_free(hw_results);
    sds_free(sw_results);

    std::cout << "TEST " << (match? "PASSED":"FAILED") << std::endl;
    return (match ? 0 : -1);
}
