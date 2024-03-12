#ifndef MONITOR_H
#define MONITOR_H

#include "systemc.h"
#include <iostream>

using namespace std;

SC_MODULE( Monitor ) {	
	sc_in_clk clock;
	sc_in < float > In1, In2, Y;
	void monitor();
	int counter;
	int pass_count;	
	
	SC_CTOR( Monitor )
	{	
		cout << "\033[1;33m" << "In1\tIn2\tY\tResult" << "\033[0m" << endl;
		counter = 0;
		pass_count = 0;
		
		SC_METHOD( monitor );
		sensitive << clock.pos();
	}
	
	~Monitor() {
		cout << "\033[1;33m" << "Number of pass cases: " << pass_count << "\033[0m" << endl;
		if(pass_count == 7)
			cout << "\033[1;32m" << "Congratulation! Your design is correct!" << "\033[0m" << endl;
		else
			cout << "\033[1;31m" << "Sorry! Your design is incorrect!" <<  "\033[0m" << endl;
	}
};

#endif

