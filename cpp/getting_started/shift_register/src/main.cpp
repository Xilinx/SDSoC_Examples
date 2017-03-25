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

 /*
   Shift Register

   This example demonstrates how to perform a shift register operation to
   implement a Finite Impulse Response(FIR) filter.

   NOTE: See the fir.cl file for additional information.
  */

#include <algorithm>
#include <random>
#include <string>
#include <vector>
#include <iostream>
#include <stdio.h>
using std::default_random_engine;
using std::inner_product;
using std::string;
using std::uniform_int_distribution;
using std::vector;

#define N_COEFF 11
#define min(x,y) ((x) < (y) ? (x) : (y))
// Finite Impulse Response Filter
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


void print_signal(int *device_output, int signal_size) {
    for (int i = 0; i < signal_size; i++ ) {
        printf("%d ", device_output[i]);
    }
    printf("\n");
}

// Verifies the gold and the out data are equal
void verify(int *gold, const int *out, const int signal_size) {
   
    int match = 1;
    for(int i = 0; i < signal_size; i++){
        if (gold[i] == out[i]){
            continue;
        }
        else {
            match = 0;
            break;
        }
    } 
    if (!match) {
        printf("TEST FAILED\n");
        exit(EXIT_FAILURE);
    }
}
void fir_shift_register_accel(int *output,
                        int *signal,
                        int *coeff,
                        int signal_length); 

int main(int argc, char **argv) {
    size_t signal_size = 32;
    int signal[signal_size];
    int coeff[11] = {53, 0, -91, 0, 313, 500, 313, 0, -91, 0, 53};
    int gold[signal_size];
    int pf_out[signal_size];

    fir(gold, signal, coeff, signal_size);

    size_t size_in_bytes = signal_size * sizeof(int);
    size_t coeff_size_in_bytes = 11 * sizeof(int);

    fir_shift_register_accel(pf_out, signal, coeff, signal_size); 
    
    verify(gold, pf_out, signal_size);
    
    std::cout << "TEST PASSED\n";
    return EXIT_SUCCESS;
}
