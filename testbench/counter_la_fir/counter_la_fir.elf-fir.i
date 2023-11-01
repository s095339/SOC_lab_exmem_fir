# 0 "fir.c"
# 1 "/home/ubuntu/caravel-soc_fpga-lab/SOC_lab_exmem_fir/testbench/counter_la_fir//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "fir.c"
# 1 "fir.h" 1





int taps[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};
int inputbuffer[11];
int inputsignal[11] = {1,2,3,4,5,6,7,8,9,10,11};
int outputsignal[11];
# 2 "fir.c" 2



void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {

 for(int i=0;i<11;i++){
  inputbuffer[i] = 0;
 }
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
 int data_ram_start_ptr = 0;
 for(int i=0;i<11;i++){
  int ss_data = inputsignal[i];
  inputbuffer[data_ram_start_ptr] = ss_data;


  int psum_buff = 0;
  for(int j=0;j<11;j++){

   int data_ram_addr = data_ram_start_ptr-j;
   if(data_ram_addr<0)data_ram_addr = 11 - data_ram_addr;

   psum_buff += inputbuffer[data_ram_addr] * taps[j];
  }

  data_ram_start_ptr++;
  if(data_ram_start_ptr>=11)
   data_ram_start_ptr = data_ram_start_ptr-11;

  outputsignal[i] = psum_buff;

 }
 return outputsignal;
}
