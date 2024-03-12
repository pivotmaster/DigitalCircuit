#ifndef NEURON_NETWORK_H
#define NEURON_NETWORK_H

#include "systemc.h"
#include "Neuron.h"

SC_MODULE(Neural_Network)
{

	sc_in<float> input1, input2;
	sc_out<float> output;

	Neuron *N1;
	Neuron *N2;
	Neuron *N3;
	// ----- put your code here -----
	sc_signal<float> N1_out, N2_out;

	// ------------------------------

	SC_CTOR(Neural_Network)
	{

		// ----- put your code here -----
		N1 = new Neuron("N1");
		N2 = new Neuron("N2");
		N3 = new Neuron("N3");

		N1->input1(input1);
		N1->input2(input2);
		N1->output(N1_out);

		N2->input1(input1);
		N2->input2(input2);
		N2->output(N2_out);

		N3->input1(N1_out);
		N3->input2(N2_out);
		N3->output(output);

		sensitive << input1 << input2;

		// ------------------------------
		N1->w1 = 2;
		N1->w2 = -2;
		N1->b = -1;
		N2->w1 = -2;
		N2->w2 = 2;
		N2->b = -1;
		N3->w1 = 2;
		N3->w2 = 2;
		N3->b = -1;
	}
};

#endif
