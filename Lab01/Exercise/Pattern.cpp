#include "Pattern.h"

void Pattern::pattern() {
	in1 = rand() % 2;
	in2 = rand() % 2;
	
	cycle++;
    if ( cycle == CYCLE ) {
		sc_stop();
	}

}

