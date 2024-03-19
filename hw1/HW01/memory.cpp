// memory with 5 bit address and 16 bit data and 1 write enable
#include <systemc.h>

SC_MODULE(memory) {
    sc_in<sc_uint<5>> address;
    sc_in<sc_int<16>> data_in;
    sc_int<2> write_enable = 1;
    sc_out<sc_int<16>> data_out;

    sc_int<16> mem[32];

    void write() {
        if (write_enable == 1) {
            mem[address.read()] = data_in.read();
        }
    }

    void read() {
        data_out.write(mem[address.read()]);
    }

    SC_CTOR(memory) {
        SC_METHOD(write);
        sensitive  << address << data_in;

        SC_METHOD(read);
        sensitive << address;
    }
};