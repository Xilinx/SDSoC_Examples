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

/******************************************************************************

    This is a simple vector addition based example to showcase how simple 
    DMA can be enabled for Data Transfer to/from hardware accelerator.

******************************************************************************/
#include <iostream>
#include <cstdio>
#include <stdlib.h>
#include "vadd.h"
#include "sds_utils.h"

const int TEST_DATA_SIZE = 1<<10;

// Compare software and hardware solutions
bool verify(int *gold, int *out, int size) {
    for(int i = 0; i < size; i++){
        if(gold[i] != out[i]){
            std::cout<< "Result Mismatch at index=" << i
                << " Expected=" << gold[i] 
                << " Actual=" << out[i] << "\n";
            return false;
        }
  }
  return true;
}

int main(int argc, char** argv)
{

    bool test_passed;
    int test_size = TEST_DATA_SIZE;

    // Allocating memory using sds_alloc. sds_alloc is recommended way
    // for memory allocation when data needs to be transfered to hardware
    // accelerator. sds_alloc() will allocate memory with continuous
    // physical memory. So using simple DMA such memory can be transferred
    // to accelerator.
    int *a = (int *) sds_alloc(sizeof(int) * test_size);
    int *b = (int *) sds_alloc(sizeof(int) * test_size);
    int *hw_results = (int *) sds_alloc(sizeof(int) * test_size);

    // Software output buffer
    int *gold = (int *)malloc(sizeof(int) * test_size);

    // Check for failed memory allocation
    if( (a == NULL) || (b == NULL) || (hw_results == NULL) || (gold == NULL)){
       std::cout << "TEST FAILED: Failed to allocate memory" << std::endl;
       return -1;
    }     

    //Creating Test Data and golden data
    for (int i = 0 ; i < test_size ; i++){
        a[i] = rand();
        b[i] = rand();
        gold[i] = a[i] + b[i]; // Calculating Golden value
        hw_results[i] = 0 ;     
    }
    
    sds_utils::perf_counter vadd_hw_ctr;

    vadd_hw_ctr.start();
    //Launch the Hardware Solution
    vadd_hw(a, b, hw_results, test_size);
    vadd_hw_ctr.stop();
    
    uint64_t vadd_hw_cycles = vadd_hw_ctr.avg_cpu_cycles();

    std::cout << "Number of CPU cycles running application in hardware: "
                << vadd_hw_cycles << std::endl;
   
    test_passed = verify(gold, hw_results, test_size);

    sds_free(a);
    sds_free(b);
    sds_free(hw_results);
    free(gold);

    std::cout << "TEST " << (test_passed ? "PASSED" : "FAILED") << std::endl;

    return (test_passed ? 0 : -1);
}
