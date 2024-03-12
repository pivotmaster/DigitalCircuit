#include "systemc.h"

SC_MODULE( MAC )
{
	sc_in < sc_uint<4> > in1, in2;
	sc_in < sc_uint<8> > in3;
	sc_out < sc_uint<9> > out;
	
    Adder *a1;
    Multiplier *m1;
    
    sc_signal < sc_uint<8> > X;

    SC_CTOR( MAC )
    {
        
        a1 = new Adder("a1");
        m1 = new Multiplier("m1");
        
        m1->in1(in1); m1->in2(in2); m1->out(X);
        a1->in1(X); a1->in2(in3); a1->out(out);
        sensitive << in1 << in2 << in3;
        
    }
};


