#ifndef NEURON_H
#define NEURON_H

#include "systemc.h"

SC_MODULE ( Neuron ) {
	
	sc_in < float > input1, input2;
	sc_out < float > output;
	float w1, w2, b;
	float output_temp;
	
	void neuron();
	
    SC_CTOR( Neuron ) {
		SC_METHOD( neuron );
		//SC_THREAD( neuron );
		sensitive << input1 << input2;
    }
};

#endif

