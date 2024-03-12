#include "Neuron.h"

void Neuron::neuron()
{
	// ----- put your code here -----
	output_temp = input1.read() * w1 + input2.read() * w2 + b;
	output.write(output_temp > 0 ? output_temp : 0);
	// ------------------------------
}
