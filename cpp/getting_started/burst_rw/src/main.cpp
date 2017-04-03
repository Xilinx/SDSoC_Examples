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
#include "vadd.h"
#include "sds_lib.h"


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

// Golden implementation
void vadd_golden(int a[DATA_SIZE], int size, int inc_value, int output[DATA_SIZE]){

    int burstbuffer[BURSTBUFFERSIZE];

    //Per iteration of this loop perform BURSTBUFFERSIZE vector addition
    for(int i=0; i < size;  i+=BURSTBUFFERSIZE)
    {
        int chunk_size = BURSTBUFFERSIZE;
        //boundary checks
        if ((i + BURSTBUFFERSIZE) > size)
            chunk_size = size - i;

        //memcpy creates a burst access to memory
        //multiple calls of memcpy cannot be pipelined and will be scheduled sequentially
        //memcpy requires a local buffer to store the results of the memory transaction
        //memcpy(burstbuffer,&a[i],chunk_size * sizeof (int));
        for(int k=0; k < chunk_size; k++){
            burstbuffer[k] = a[i+k];
        }

        //calculate and write results to global memory, the sequential write in a for
        //loop can be inferred to a memory burst access automatically
        calc_write: for(int j=0; j < chunk_size; j++){
            burstbuffer[j] = burstbuffer[j] + inc_value;
            output[i+j] = burstbuffer[j];
        }
    }
}

int main(int argc, char** argv)
{
    int size = DATA_SIZE;
    int inc_value = INCR_VALUE;
    //Allocate Memory in Host Memory
    size_t vector_size_bytes = sizeof(int) * size;
    
    // Allocat PL buffers using sds_alloc 
    int *source_input       = (int *) sds_alloc(vector_size_bytes);
    int *source_hw_results  = (int *) sds_alloc(vector_size_bytes);

    // Allocate Software Output Buffer
    int *source_sw_results  = (int *) malloc(vector_size_bytes);

    // Create the test data and Software Result
    for(int i = 0 ; i < size ; i++){
        source_input[i] = i;
        source_sw_results[i] = 0; //i + inc_value;
        source_hw_results[i] = 0;
    }

    perf_counter hw_ctr, sw_ctr;

    hw_ctr.start();
    //Launch the Hardware Solution
    vadd_accel(source_input, size, inc_value, source_hw_results);
    hw_ctr.stop();

    //Launch the Software Solution
    vadd_golden(source_input, size, inc_value, source_sw_results);

    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
    std::cout << "Average number of CPU cycles running mmult in hardware: "
              << hw_cycles << std::endl;
    
    // Compare the results of the Device to the simulation
    int match = 0;
    for (int i = 0 ; i < size ; i++){
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
    sds_free(source_input);
    sds_free(source_hw_results);
    free(source_sw_results);

    if (match){
        std::cout << "TEST FAILED." << std::endl;
        return -1;
    }
    std::cout << "All Device results match CPU results! " << std::endl;
    std::cout << "TEST PASSED." << std::endl;
    return 0;
}
