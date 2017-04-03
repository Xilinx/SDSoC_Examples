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

#include <iostream>
#include <cstring>
#include <stdlib.h>
#include <stdint.h>

#include "sds_lib.h"
#include "mmult.h"

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


void mmult_sw(int *a, int *b, int *c, int size)
{
  int bufa[N][N], bufb[N][N], bufc[N][N];
  for (int i = 0 ; i < size ; i++) {
      memcpy(bufa[i], (int *) &a[i*size], size*sizeof(int));
      memcpy(bufb[i], (int *) &b[i*size], size*sizeof(int));
  }

  for (int row = 0; row < size; row++) {
    for (int col = 0; col < size; col++) {
      int result = 0;
      for (int k = 0; k < size; k++) {
        result += bufa[row][k] * bufb[k][col];
      }
      bufc[row][col] = result;
    }
  }
  for (int i = 0 ; i < size ; i++)
      memcpy((int *) &c[i*size], bufc[i], size*sizeof(int));
}

int main(int argc, char** argv)
{
    int size = DATA_SIZE;
    int matrix_size = size * size;
    if (size > N) {
        std::cout << "Size is bigger than internal buffer size, please use a size";  
        std::cout << " smaller than 256!" << std::endl;
        return EXIT_FAILURE;
    }

    size_t vector_size_bytes = sizeof(int) * matrix_size;

    // Allocate PL buffers using sds_alloc
    int *source_input_a     = (int *) sds_alloc(vector_size_bytes);
    int *source_input_b     = (int *) sds_alloc(vector_size_bytes);
    int *source_hw_results  = (int *) sds_alloc(vector_size_bytes);

    // Allocate software output buffer
    int *source_sw_results  = (int *) malloc(vector_size_bytes);

    // Create the test data and Software Result
    for(int i = 0 ; i < matrix_size ; i++){
        source_input_a[i] = i;
        source_input_b[i] = i;
        source_hw_results[i] = 0;
    }

    perf_counter hw_ctr, sw_ctr;

    sw_ctr.start();
    // Launch the software solution
    mmult_sw(source_input_a, source_input_b, source_sw_results, size);
    sw_ctr.stop();

    hw_ctr.start();
    // Launch the hardware solution
    mmult_accel(source_input_a, source_input_b, source_hw_results, size);
    hw_ctr.stop();

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
    std::cout << "best coding practice for memory transfers from DDR to "; 
    std::cout << "Programmable Logic."<< std::endl;
    std::cout << "\tSpeed up comparison between Software Solution cycles does't";
    std::cout << " matter" << std::endl;
    std::cout << "\n"; 
   
    // Compare the results of the Device to the simulation
    int match = 0;
    std::cout << "Result = " << std::endl;
    for (int i = 0 ; i < matrix_size ; i++){
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
    sds_free(source_input_a);
    sds_free(source_input_b);
    sds_free(source_hw_results);
    free(source_sw_results);

    if (match){
        std::cout << "TEST FAILED." << std::endl;
        return 1;
    }
    std::cout << "TEST PASSED." << std::endl;
    return 0;
}
