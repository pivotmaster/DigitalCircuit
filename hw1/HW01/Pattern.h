#ifndef PATTERN_H
#define PATTERN_H

#include "systemc.h"
#include "iostream"
//#include "register_file.cpp"
#define CYCLE 56

using namespace std;
SC_MODULE( Pattern ) {	
	sc_in_clk clock;
	sc_in < bool > reset;
	sc_out < sc_uint<16> > instruction;

	sc_out < sc_int<16> > golden_ALU_out;
	sc_out < sc_uint<5>  > golden_immediate;

	sc_uint < 32 > cycle;
 
  vector<uint> regs_p;
	
	void pattern();
	void calculate();
	
	SC_CTOR( Pattern ) : regs_p(16)
	{
 
    // Initialize register values
        regs_p[0] = 65535;
        regs_p[1] = 0;
        regs_p[2] = 4545;
        regs_p[3] = 1234;
        regs_p[4] = 5678;
        regs_p[5] = 9876;
        regs_p[6] = 1111;
        regs_p[7] = 2222;
        regs_p[8] = 3333;
        regs_p[9] = 4444;
        regs_p[10] = 5555;
        regs_p[11] = 6666;
        regs_p[12] = 7777;
        regs_p[13] = 8888;
        regs_p[14] = 9999;
        regs_p[15] = 10000;
     
		SC_METHOD( pattern );
		sensitive << clock.pos();
    SC_METHOD( calculate );
    sensitive << clock.neg();
	}
};

#endif

