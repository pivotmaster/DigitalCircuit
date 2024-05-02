#ifndef MAIN_H
#define MAIN_H

#include "CPU.cpp"
#include <systemc.h>
using namespace std;

int sc_main( int argc,char* argv[] ) {
    CPU cpu("cpu");
    sc_start( 200, SC_SEC);
    return 0;
}


#endif