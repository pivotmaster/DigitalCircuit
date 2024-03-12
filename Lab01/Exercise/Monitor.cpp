#include "Monitor.h"

void Monitor:: monitor() {
	if ( counter > 2 ){
		cout<< In1 << "\t" << In2 << "\t" << Y;

		if(((int)In1 ^ (int)In2) == (int)Y)
		{
				pass_count++;
				cout << "\033[1;32m" << "\tPASS" << "\033[0m" << endl;
		} else
			cout << "\033[1;31m" << "\tFAIL" << "\033[0m" << endl;
	}else
		counter++;
}

