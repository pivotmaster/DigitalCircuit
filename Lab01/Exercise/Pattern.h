#ifndef PATTERN_H
#define PATTERN_H

#include "systemc.h"
#include "iostream"
#define CYCLE 10

using namespace std;
SC_MODULE( Pattern ) {	
	sc_in_clk clock;
	sc_in < bool > reset;
	sc_out < float > in1, in2;
	sc_uint < 32 > cycle;
	
	void pattern();
	
	SC_CTOR( Pattern )
	{
		SC_METHOD( pattern );
		sensitive << clock.pos();
	}
};

#endif

