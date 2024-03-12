#include "Arithmetic.h"
	
void Adder::run() {
	out.write( in1.read() + in2.read() );
}

void Multiplier::run() {
	out = in1.read() * in2.read();
}
