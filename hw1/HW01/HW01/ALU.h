#ifndef ALU_H
#define ALU_H

#include "systemc.h"
#include <bitset>

SC_MODULE(ALU){
    sc_in < sc_uint<3> > opcode;//opcode from decoder, to decide which operation ALU unit do calculate
    sc_in < sc_int<16> > rs_data;//rs_data from register, data from register[rs] to calculate in ALU unit
    sc_in < sc_int<16> > rt_data;//rt_data from register, data from register[rt] to calculate in ALU unit
    sc_in < sc_uint<5> > immediate;//immediate from decoder, data from instruction to calculate in ALU unit
    sc_out < sc_int<16> > ALU_out;//after your calculation, put your result in this port
    
    
    void process();

    SC_CTOR(ALU) {
        SC_METHOD(process);
        sensitive << opcode << rs_data << rt_data << immediate;
    }
};

#endif
