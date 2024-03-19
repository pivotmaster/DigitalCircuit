#include <systemc.h>
#include <vector>
using namespace std;

SC_MODULE(register_file) {
    sc_in<sc_uint<4>> read_reg1, read_reg2;
    sc_out<sc_int<16>> read_data1, read_data2;

    vector<uint> regs;

    void read() {
        read_data1.write(regs[read_reg1.read()]);
        read_data2.write(regs[read_reg2.read()]);
    }

    SC_CTOR(register_file) : regs(16) {
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
    }
};
