# 0 "fir.c"
# 1 "/home/ubuntu/m111061549/SOC/lab-exmem_fir/testbench/counter_la_fir//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "fir.c"
# 1 "fir.h" 1






int taps[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};
int inputbuffer[11];
volatile int __attribute__((section(".indata")))inputsignal[11] = {1,2,3,4,5,6,7,8,9,10,918};
int outputsignal[11];
# 2 "fir.c" 2



void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {

 for(int i=0;i<11;i++){
  inputbuffer[i] = 0;
 }
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){

 for(int i=0;i<11;i++){
  outputsignal[i] = inputsignal[i];
 }
 return outputsignal;
}
