#ifndef MAIN_H
#define MAIN_H


#include "systemc.h"

#include <iomanip>

#include "sort.h"
#include "pattern.h"
#include "clockreset.h"

//using namespace std;

int sc_main(int argc, char* argv[]) {
    // Signals
    sc_signal<bool> clk;
    sc_signal<sc_uint<48>> in_Aid_all;
    sc_signal<sc_uint<48>> in_CNT_all;
    sc_signal<sc_uint<48>> out_Aid_all;
    sc_signal<sc_uint<48>> out_CNT_all;

    sc_uint<8> in_Aid[6];
    sc_uint<8> in_CNT[6];
    sc_uint<48> temp;

    // Module instantiation
    Clock m_clock("m_clock", 5, 100000);
    m_clock.clk(clk);

    stable_sort_6_value stable_sort_6_inst("stable_sort_6_value");
    stable_sort_6_inst.in_Aid_all(in_Aid_all);
    stable_sort_6_inst.in_CNT_all(in_CNT_all);
    stable_sort_6_inst.out_Aid_all(out_Aid_all);
    stable_sort_6_inst.out_CNT_all(out_CNT_all);

    pattern pattern("pattern");
    pattern.in_Aid_all(in_Aid_all);
    pattern.in_CNT_all(in_CNT_all);
    pattern.out_Aid_all(out_Aid_all);
    pattern.out_CNT_all(out_CNT_all);
    pattern.clk(clk);

    // Trace
    // sc_trace_file* tf = sc_create_vcd_trace_file("sort_trace");
    // sc_trace(tf, clk, "clk");
    // sc_trace(tf, in_Aid_all, "in_Aid_all");
    // sc_trace(tf, in_CNT_all, "in_CNT_all");
    // sc_trace(tf, out_Aid_all, "out_Aid_all");
    // sc_trace(tf, out_CNT_all, "out_CNT_all");

    // Stimulus process
    sc_start(100000, SC_NS);

    // Close trace file
    // sc_close_vcd_trace_file(tf);

    return 0;
}
#endif