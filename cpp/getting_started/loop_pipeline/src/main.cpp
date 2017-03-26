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


#include <algorithm>
#include <cstdio>
#include <random>
#include <vector>
#include "vector_addition.h"
using std::default_random_engine;
using std::generate;
using std::uniform_int_distribution;
using std::vector;

const int DATA_SIZE = 1<<10;

int gen_random() {
  static default_random_engine e;
  static uniform_int_distribution<int> dist(0, 100);

  return dist(e);
}

void verify(const int *gold, const int *out) {
    for(int i = 0; i < DATA_SIZE; i++){
        if(gold[i] != out[i]){
            printf("TEST FAILED\n");
            exit(EXIT_FAILURE);
        }
  }
}

void vadd(int *a, int *b, int *c, int len){

    vadd_loop:
    for (int x=0; x<len; ++x) {
        c[x] = a[x] + b[x];
    }
}

int main(int argc, char** argv)
{
    // compute the size of array in bytes
    int size_in_bytes = DATA_SIZE * sizeof(int);

    // Creates a vector of DATA_SIZE elements with an initial value of 10 and 32
    int *source_a = (int *)malloc(sizeof(int) * DATA_SIZE);
    int *source_b = (int *)malloc(sizeof(int) * DATA_SIZE);
    int *source_results = (int *)malloc(sizeof(int) * DATA_SIZE);

    int *gold = (int *)malloc(sizeof(int) * DATA_SIZE);

    vadd(source_a, source_b, gold, DATA_SIZE);

    vadd_pipelined_accel(source_a, source_b, source_results, DATA_SIZE);
    
    verify(gold, source_results);


    printf("TEST PASSED.\n");
    return EXIT_SUCCESS;
}
