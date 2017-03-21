#include <stdio.h>
#include "add.h"

void add_sw(long inA, long inB, long *sum)
{
  *sum = inA + inB;
}

int main(int argc, char* argv[])
{
  long A = 128;
  long B = 32;
  long C_sw, C_hw;

  printf("add example ...\n");

  add_sw(A, B, &C_sw);
  add(A, B, &C_hw);
  
  printf("SW: %ld + %ld = %ld\n", A, B, C_sw);
  printf("HW: %ld + %ld = %ld\n", A, B, C_hw);
  
  printf("add %s\n", (C_sw == C_hw) ? "PASSED" : "FAILED");

  if (C_sw != C_hw) return -1;

  A =  0xFFFFFFFF;
  B =  0x2;

  add_sw(A, B, &C_sw);
  add(A, B, &C_hw);
  
  printf("SW: %ld + %ld = %ld\n", A, B, C_sw);
  printf("HW: %ld + %ld = %ld\n", A, B, C_hw);
  
  printf("add %s\n", (C_sw == C_hw) ? "PASSED" : "FAILED");

  if (C_sw != C_hw) return -1;

  return 0;
}


// XSIP watermark, do not delete 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
