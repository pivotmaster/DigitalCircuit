#ifndef MEMORY_H
#define MEMORY_H

// memory with 5 bit address and 16 bit data and 1 write enable
#include <systemc.h>

SC_MODULE(memory) {
    sc_in<sc_uint<5>> address;
    sc_in<sc_uint<16>> data_in;
    sc_int<2> write_enable = 1;
    sc_out<sc_int<16>> data_out;

    sc_int<16> mem[32];

    void write();

    void read();

    SC_CTOR(memory) {
        SC_METHOD(write);
        sensitive  << address << data_in;
        dont_initialize();

        SC_METHOD(read);
        sensitive << address;
        dont_initialize();
    }
};

#endif