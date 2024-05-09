#ifndef PATTERN_H
#define PATTERN_H

#include <systemc.h>
#include <iomanip>

SC_MODULE(pattern) {
    // Input signals
    sc_out<sc_uint<48>> in_Aid_all;
    sc_out<sc_uint<48>> in_CNT_all;

    // Output signals
    sc_in<sc_uint<48>> out_Aid_all;
    sc_in<sc_uint<48>> out_CNT_all;

    sc_in <bool> clk;

    sc_uint<8> in_Aid[6];
    sc_uint<8> in_CNT[6];
    sc_uint<48> temp_A;
    sc_uint<48> temp_C;

    sc_uint<8> out_Aid[6];
    sc_uint<8> out_CNT[6];

    sc_uint<48> golden_out_Aid_all;
    sc_uint<48> golden_out_CNT_all;

    sc_uint<8> golden_out_Aid[6];
    sc_uint<8> golden_out_CNT[6];

    uint pattern_count = 0;

    void input_pattern();
    void output_pattern();

    // Constructor
    SC_CTOR(pattern) {
        SC_METHOD(input_pattern);
        sensitive << clk.pos();
        dont_initialize();

        SC_METHOD(output_pattern);
        sensitive << clk.neg();
        dont_initialize();
    }

};

#endif