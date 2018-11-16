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
#include <iostream>
#include <cstring>
#include <cstdlib>
#include "vconv.h"
#include "sds_utils.h"

#ifndef NUM_TIMES
#define NUM_TIMES 2  
#endif

void vconv_sw(int *in, int *out, int height, int width)
{
    int linebuf[K - 1][MAX_COLS];
    int outIdx = 0;
    for(int col = 0; col < height; ++col) {
        for(int row = 0; row < width ; ++row) {
            int in_val = in[col * width + row];
            int out_val = 0;
            for(int i = 0; i < K; i++) {
                int vwin_val = i < K - 1 ? linebuf[i][row] : in_val;
                out_val += vwin_val * vcoeff[i];
                if (i > 0)
                    linebuf[i - 1][row] = vwin_val;
            }
            if (col >= K - 1)
                out[outIdx++]  =  out_val;
        }
    }
}

int main(int argc, char** argv)
{
    int testWidth    = TEST_WIDTH;
    int testHeight   = TEST_HEIGHT;
    int testSize = testHeight * testWidth; 
    //Allocate Memory in Host Memory
    size_t test_size_bytes = sizeof(int) * testSize;

    // Allocate Input and Output Buffers
    // sds_alloc must be used to allocate memory for PL buffers
    int *input       = (int *) sds_alloc(test_size_bytes);
    int *hw_results  = (int *) sds_alloc(test_size_bytes);
    
    // Allocate memory for PS buffer
    int *sw_results  = (int *) malloc(test_size_bytes);

    // Check for failed memory allocation
    if((input == NULL) || (hw_results == NULL) || (sw_results== NULL) ){
        std::cout << "TEST FAILED : Failed to allocate memory" << std::endl;
        return -1;
    }

    sds_utils::perf_counter hw_ctr, sw_ctr;
    bool match = true;

    for (int i = 0; i < NUM_TIMES; i++)
    {
        // Create the test data and Software Result
        for(int i = 0 ; i < testSize; i++){
            input[i] = rand() % testSize;
            sw_results[i] = 0;
            hw_results[i] = 0;
        }
        
        sw_ctr.start();
        //Running software vconv
        vconv_sw(input,sw_results, testHeight, testWidth);
        sw_ctr.stop();
    
        hw_ctr.start();
        // Launch the Accelerator
        vconv_hw(input, hw_results, testHeight, testWidth);
        hw_ctr.stop();

        // Compare the results of the Device to the simulation
        for (int i = 0 ; i < testSize ; i++){
            if (hw_results[i] != sw_results[i]){
                std::cout << "Error: Result mismatch" << std::endl;
                std::cout << "i = " << i << " CPU result = " << sw_results[i]
                          << " Device result = " << hw_results[i] << std::endl;
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
    std::cout << "Speedup : " << speedup << std::endl;
    std::cout << "Note: Speed up is meaningful for real hardware execution only, not for emulation." << std::endl;

    /* Release Memory from Host Memory*/
    sds_free(input);
    sds_free(hw_results);
    free(sw_results);

    std::cout << " TEST " << (match? "PASSED": "FAILED") << std::endl;
    return(match? 0: -1);
}
