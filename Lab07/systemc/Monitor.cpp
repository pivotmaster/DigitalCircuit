#include "Monitor.h"

void Monitor:: monitor() {
	ALU_out_signed.range(15, 0) = ALU_out.read().range(15, 0);
	golden_ALU_out_signed.range(15, 0) = golden_ALU_out.read().range(15, 0);
	if ( counter > 2 ){
		cout<< ALU_out_signed << "\t" << golden_ALU_out_signed << "\t\t" << immediate << "\t\t" << golden_immediate ;

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

