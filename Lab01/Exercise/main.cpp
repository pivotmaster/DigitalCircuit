#include "Neural_Network.h"
#include "clockreset.h"
#include "Pattern.h"
#include "Monitor.h"
#include <iostream>

using namespace std;

int sc_main( int argc,char* argv[] ) {
    sc_signal < bool > clk, reset;
    sc_signal < float > in1, in2, out;
    
    Reset m_reset( "m_reset", 20 );
    Clock m_clock( "m_clock", 5, 20 );
    Pattern m_pattern( "m_pattern" );
    Neural_Network m_NN( "m_NN" );
    Monitor m_monitor( "m_monitor" );

    m_clock( clk );
    m_reset( reset );
    m_pattern( clk, reset, in1, in2 );
    m_NN( in1, in2, out );
    m_monitor( clk, in1, in2, out );

    sc_start( 200, SC_NS );
    return 0;
}