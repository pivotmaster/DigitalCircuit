#ifndef SORT_H
#define SORT_H

#include <systemc.h>

SC_MODULE(stable_sort_6_value) {
    // Input signals
    sc_in<sc_uint<48>> in_Aid_all;
    sc_in<sc_uint<48>> in_CNT_all;

    // Output signals
    sc_out<sc_uint<48>> out_Aid_all;
    sc_out<sc_uint<48>> out_CNT_all;

    // Internal signals

    // Process Declaration
    void process();
    // Constructor
    SC_CTOR(stable_sort_6_value) {
        SC_METHOD(process);
        sensitive << in_Aid_all << in_CNT_all;
    }
};
#endif