#ifndef REGISTER_FILE_H
#define REGISTER_FILE_H

#include <systemc.h>
#include <vector>

SC_MODULE(register_file) {
    sc_in<sc_uint<4>> read_reg1, read_reg2;
    sc_out<sc_uint<16>> read_data1, read_data2;

    sc_uint<16> regs[16];

    void read();

    SC_CTOR(register_file){
        // Initialize register values
        regs[0] = 65535;
        regs[1] = 0;
        regs[2] = 4545;
        regs[3] = 1234;
        regs[4] = 5678;
        regs[5] = 9876;
        regs[6] = 1111;
        regs[7] = 2222;
        regs[8] = 3333;
        regs[9] = 4444;
        regs[10] = 5555;
        regs[11] = 6666;
        regs[12] = 7777;
        regs[13] = 8888;
        regs[14] = 9999;
        regs[15] = 10000;

        SC_METHOD(read);
        sensitive << read_reg1 << read_reg2;
        dont_initialize();
    }
};

#endif