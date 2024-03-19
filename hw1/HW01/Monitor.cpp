#include "Monitor.h"

void Monitor:: monitor() {
	if ( counter > 2 ){
		cout<< ALU_out << "\t" << golden_ALU_out << "\t\t" << immediate << "\t\t" << golden_immediate;

		if(ALU_out.read() == golden_ALU_out.read() && immediate.read() == golden_immediate.read() )
		{
				pass_count++;
				cout << "\033[1;32m" << "\t\t\tPASS" << "\033[0m" << endl;
		} 
    else
    
			cout << "\033[1;31m" << "\t\t\tFAIL" << "\033[0m" << endl;
      
	}
  else
		counter++;
}

