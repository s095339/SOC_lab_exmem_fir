#ifndef __FIR_H__
#define __FIR_H__

#define N 11

//#define RCV_SDRAM_INDATA __attribute__((section(".indata")))
int taps[N] = {0,-10,-9,23,56,63,56,23,-9,-10,0};
int inputbuffer[N];
volatile int __attribute__((section(".indata")))inputsignal[N] = {1,2,3,4,5,6,7,8,9,10,918};
int outputsignal[N];
#endif
