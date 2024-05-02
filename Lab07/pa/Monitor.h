#ifndef MONITOR_H
#define MONITOR_H

#include "systemc.h"
#include <iostream>
#include "systemc.h"

using namespace std;

SC_MODULE( Monitor ) {	
	sc_in_clk clock;
	sc_in < sc_uint<16> > ALU_out, 	golden_ALU_out ;
	sc_in < sc_uint<5>  > immediate, golden_immediate;
  
	sc_int<16> ALU_out_signed;
	sc_int<16> golden_ALU_out_signed;
	
  	int counter;
	int pass_count;	

	void monitor();
	
	SC_CTOR( Monitor )
	{	
		cout << "\033[1;33m" << "ALU_out\tgolden_ALU_out\timmediate\tgolden_immediate\tResult" << "\033[0m" << endl;
		counter = 0;
		pass_count = 0;
		
		SC_METHOD( monitor );
		sensitive << clock.pos();
	}
	
	~Monitor() {
		cout << "\033[1;33m" << "Number of pass cases: " << pass_count << "\033[0m" << endl;
		if(pass_count == 53)
			cout << "\033[1;32m" << "Congratulation! Your design is correct!" << "\033[0m" << endl;
		else
			cout << "\033[1;31m" << "Sorry! Your design is incorrect!" <<  "\033[0m" << endl;
	}
};

#endif

