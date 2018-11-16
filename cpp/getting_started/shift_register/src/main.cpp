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

   This example demonstrates how to perform a shift register operation to
   implement a Finite Impulse Response(FIR) filter.

*******************************************************************************/

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include "fir.h"
#include "sds_utils.h"
#define min(x,y) ((x) < (y) ? (x) : (y))

#ifndef NUM_TIMES
#define NUM_TIMES 2  
#endif

// Software Finite Impulse Response Filter
void fir(int *output, const int *signal, const int *coeff, const int signal_length) {

    int coeff_reg[N_COEFF];
    read_coef: for (int i = 0 ; i < N_COEFF ; i++) coeff_reg[i] = coeff[i];

    outer_loop:
    for (int j = 0; j < signal_length; j++) {
        int acc = 0;
        shift_loop:
        for (int i = min(j,N_COEFF-1); i >= 0; i--) {
            acc += signal[j-i] * coeff_reg[i];
        }
        output[j] = acc;
    }
    
}

// Print signals
void print_signal(int *hardware_output, int signal_size) {
    for (int i = 0; i < signal_size; i++ ) {
        printf("%d ", hardware_output[i]);
    }
    printf("\n");
}

// Verifies the software and hardware results
bool verify(int *gold, const int *out, const int signal_size) {
   
    bool match = true;
    for(int i = 0; i < signal_size; i++){
        if (gold[i] == out[i]){
            continue;
        }
        else {
            match = false;
            break;
        }
    } 
    if (!match) {
        return false;
    }
    return true;
}

int main(int argc, char **argv) {
    
    bool test_passed;
    int signal_size = SIGNAL_SIZE;

    // Allocate buffers using sds_alloc
    int *signal = (int *) sds_alloc(sizeof(int) * signal_size);
    int *coeff  = (int *) sds_alloc(sizeof(int) * N_COEFF);
    int *hw_out = (int *) sds_alloc(sizeof(int) * signal_size);

    // Allocate software output buffer
    int *gold = (int *) malloc(sizeof(int) * signal_size);

    // Check for failed memory allocation
    if((signal == NULL) || (coeff == NULL) || (hw_out == NULL) || (gold == NULL)){
        std::cout << "TEST FAILED : Failed to allocate memory" << std::endl;
        return -1;
    }

    coeff[0] = 53;
    coeff[1] =  0;
    coeff[2] = -91;
    coeff[3] =  0;
    coeff[4] = 313;
    coeff[5] = 500;
    coeff[6] = 313;
    coeff[7] =   0;
    coeff[8] = -91;
    coeff[9] =   0;
    coeff[10]=  53;

    sds_utils::perf_counter hw_ctr, sw_ctr;

    for (int i = 0; i < NUM_TIMES ; i++)
    {
        //Creating Test Data 
        for (int i = 0 ; i < signal_size; i++){
            signal[i] = rand();
            hw_out[i] = 0 ;     
        }
    
        sw_ctr.start();
        //Launch the Software Solution
        fir(gold, signal, coeff, signal_size);
        sw_ctr.stop();

        hw_ctr.start();
        //Launch the Hardware Solution
        fir_shift_register_accel(signal, coeff, hw_out, signal_size); 
        hw_ctr.stop();

        // Verify software and hardware results
        test_passed = verify(gold, hw_out, signal_size);
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

    sds_free(signal);
    sds_free(coeff);
    sds_free(hw_out);
    free(gold);
    
    std::cout << "TEST " << (test_passed ? "PASSED" : "FAILED") << std::endl;

    return (test_passed ? 0 : -1);
}
