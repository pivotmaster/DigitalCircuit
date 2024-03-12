#include "systemc.h"

SC_MODULE( Adder ) {
	sc_in < sc_uint<8> > in1,in2;
	sc_out < sc_uint<9> > out;
	
	void run();

	SC_CTOR( Adder ) {
		SC_METHOD( run );
		sensitive << in1 << in2;
	}
};

SC_MODULE( Multiplier ) {
	sc_in < sc_uint<4> > in1,in2;
	sc_out < sc_uint<8> > out;
	
	void run();

	SC_CTOR( Multiplier ) {
		SC_METHOD( run );
		sensitive << in1 << in2;
	}
};



