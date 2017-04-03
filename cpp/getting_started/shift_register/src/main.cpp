/*
# (c) Copyright 2013 - 2016 Xilinx, Inc. All rights reserved.
#
# This file contains confidential and proprietary information of Xilinx, Inc. and
# is protected under U.S. and international copyright and other intellectual
# property laws.
# 
# DISCLAIMER 
# This disclaimer is not a license and does not grant any rights to the materials
# distributed herewith. Except as otherwise provided in a valid license issued to
# you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE
# MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY
# DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
# INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR
# FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether
# in contract or tort, including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature related to, arising
# under or in connection with these materials, including for any direct, or any
# indirect, special, incidental, or consequential loss or damage (including loss
# of data, profits, goodwill, or any type of loss or damage suffered as a result
# of any action brought by a third party) even if such damage or loss was
# reasonably foreseeable or Xilinx had been advised of the possibility of the
# same.
#
# CRITICAL APPLICATIONS
# Xilinx products are not designed or intended to be fail-safe, or for use in any
# application requiring fail-safe performance, such as life-support or safety
# devices or systems, Class III medical devices, nuclear facilities, applications
# related to the deployment of airbags, or any other applications that could lead
# to death, personal injury, or severe property or environmental damage
# (individually and collectively, "Critical Applications").Customer assumes the
# sole risk and liability of any use of Xilinx products in Critical Applications,
# subject only to applicable laws and regulations governing limitations on product
# liability.
#
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT
# ALL TIMES.
*/

 /*
   Shift Register

   This example demonstrates how to perform a shift register operation to
   implement a Finite Impulse Response(FIR) filter.

   NOTE: See the fir.cl file for additional information.
  */

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include "fir.h"
#include "sds_lib.h"

#define min(x,y) ((x) < (y) ? (x) : (y))

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
int verify(int *gold, const int *out, const int signal_size) {
   
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
        return 1;
    }
    return 0;
}

int main(int argc, char **argv) {
    
    int test_passed = 0;
    int *signal = (int *) sds_alloc(sizeof(int) * SIGNAL_SIZE);
    int *coeff  = (int *) sds_alloc(sizeof(int) * N_COEFF);
    int *hw_out = (int *) sds_alloc(sizeof(int) * SIGNAL_SIZE);

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

    int *gold = (int *) malloc(sizeof(int) * SIGNAL_SIZE);
    
    perf_counter hw_ctr, sw_ctr;

    
    sw_ctr.start();
    //Launch the Software Solution
    fir(gold, signal, coeff, SIGNAL_SIZE);
    sw_ctr.stop();

    hw_ctr.start();
    //Launch the Hardware Solution
    fir_shift_register_accel(signal, coeff, hw_out, SIGNAL_SIZE); 
    hw_ctr.stop();
    
    test_passed = verify(gold, hw_out, SIGNAL_SIZE);

    uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
    double speedup = (double) sw_cycles / (double) hw_cycles;
    
    std::cout << "Average number of CPU cycles running mmult in software: "
			 << sw_cycles << std::endl;
    std::cout << "Average number of CPU cycles running mmult in hardware: "
				 << hw_cycles << std::endl;
    std::cout << "Speed up: " << speedup << std::endl;

    std::cout << "\n";
    std::cout << "Note : This example is intended to introduce developers to ";
    std::cout << "best coding practice of accelerator optimization technique to "; 
    std::cout << "achieve better performance."<< std::endl;
    std::cout << "\n"; 
   
    sds_free(signal);
    sds_free(coeff);
    sds_free(hw_out);
    free(gold);
    
    std::cout << "TEST " << (test_passed ? "FAILED" : "PASSED") << std::endl;

    return (test_passed ? -1 : 0);
}
