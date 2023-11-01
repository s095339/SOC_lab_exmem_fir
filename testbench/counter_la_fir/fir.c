#include "fir.h"

//#include <defs.h>
//#include <stub.c>
void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	//initial your fir
	for(int i=0;i<N;i++){
		inputbuffer[i] = 0;
	}
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
	int data_ram_start_ptr = 0;
	for(int i=0;i<N;i++){
		int ss_data = inputsignal[i]; // receive data from axi-stream
		inputbuffer[data_ram_start_ptr] = ss_data;// store input in data_ram

		//fir-calculation===========
		int psum_buff = 0;
		for(int j=0;j<N;j++){

			int data_ram_addr = data_ram_start_ptr-j;
			if(data_ram_addr<0)data_ram_addr = N - data_ram_addr;

			psum_buff += inputbuffer[data_ram_addr] * taps[j];  
		}
		//============================
		data_ram_start_ptr++;
		if(data_ram_start_ptr>=N)
			data_ram_start_ptr = data_ram_start_ptr-N;
		
		outputsignal[i] = psum_buff;
		//=======================
	}
	return outputsignal;
}
		
