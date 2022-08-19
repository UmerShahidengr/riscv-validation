#include <stdio.h>
#include "common.h"

#define ASIZE 2048
#define STEP   128
#define ITERS 1000000

__attribute__ ((noinline))
int loop(int zero) {
  int t1 = 1 +zero;

  int i;
  for(i=zero; i < ITERS; i+=1) {
    t1*=t1;
  }
  return t1;
}

int main(int argc, char* argv[]) {
   argc&=10000;
   ROI_BEGIN(); 
   int t=loop(argc); 
   ROI_END();
   volatile int a = t;
}
