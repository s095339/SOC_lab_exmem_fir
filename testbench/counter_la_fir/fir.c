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
	//initfir();
	for(int i=0;i<N;i++){
		outputsignal[i] = inputsignal[i];
	}
	return outputsignal;
}
		
