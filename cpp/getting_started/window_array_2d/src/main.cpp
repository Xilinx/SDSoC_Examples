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
    
   This example is intended to demonstrate data access pattern using AXI-master
   interface. In this example a window of two dimensional array data is accessed 
   in burst mode  

*******************************************************************************/

#include <iostream>
#include <cstring>
#include <stdio.h>
#include "window_array_2d.h"
#include "sds_utils.h"

#ifndef NUM_TIMES
#define NUM_TIMES 2  
#endif

// Utility to print array
void print_array(DTYPE *mat, const char *name, int size, int dim) {
    int i;
    printf("%s\n", name);
    for (i=0;i<size;i++) {
        printf("%d ",mat[i]);
        if (((i+1) % dim) == 0)
            printf("\n");
    }
}

// Software solution
void window_array_2d_sw(DTYPE *a, DTYPE *sw_c, DTYPE alpha)
{
    for(int i = 0; i < BLOCK_SIZE; i++){
        sw_c[i] = alpha * a[i];
    }
}

int main(int argc, char** argv)
{
    // Size of input data
    size_t vector_size_bytes = sizeof(DTYPE) * BLOCK_SIZE;

    // Allocate buffers using sds_alloc
    DTYPE* a = (DTYPE*)sds_alloc(vector_size_bytes);
    DTYPE* c = (DTYPE*)sds_alloc(vector_size_bytes);

    // Allocate software output buffer
    DTYPE* sw_c = (DTYPE*)malloc(vector_size_bytes);

    // Check for failed memory allocation
    if((a == NULL) || (c == NULL) || (sw_c == NULL)){
        std::cout << "TEST FAILED : Failed to allocate memory" << std::endl;
        return -1;
    }

    DTYPE alpha = 3;
    unsigned int correct; 
    sds_utils::perf_counter hw_ctr, sw_ctr;

    for (int i = 0; i < NUM_TIMES ; i++)
    {
       // Create the test data
        for(int i = 0; i < BLOCK_SIZE; i++) {
            a[i] = i;
            c[i] = 0;
            sw_c[i] = 0;
        }

        hw_ctr.start();
        //Launch the Hardware Solution
        window_array_2d_accel(a, c, alpha);
        hw_ctr.stop();
    
        sw_ctr.start();
        //Launch the Software Solution
        window_array_2d_sw(a, sw_c, alpha);
        sw_ctr.stop();

        // Verify correctness of software & hardware results
        correct = 0;             
        for (int i = 0;i < BLOCK_SIZE; i++) {
            if(c[i] == sw_c[i]) {
                correct++;
            } else {
                printf("\n wrong sw %d hw %d index %d \n", sw_c[i], c[i], i);
            }
        }
    }
    
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();

    std::cout << "Number of CPU cycles running application in hardware: "
                << hw_cycles << std::endl;

    // Print a brief summary detailing the results
    printf("Computed '%d/%d' correct values!\n", correct, BLOCK_SIZE);

    sds_free(a);
    sds_free(c);
    free(sw_c);

    if(correct == BLOCK_SIZE){
        std::cout << "TEST PASSED." << std::endl;
        return 0;
    }
    else{
        std::cout << "TEST FAILED." << std::endl;
        return -1;
    }
}
