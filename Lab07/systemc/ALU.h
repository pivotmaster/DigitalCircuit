#ifndef ALU_H
#define ALU_H

#include "systemc.h"
#include <bitset>

SC_MODULE(ALU){
    sc_in < sc_uint<3> > opcode;
    sc_in < sc_uint<16> > rs_data;
    sc_in < sc_uint<16> > rt_data;
    sc_in < sc_uint<5> > immediate;
    sc_out < sc_uint<16> > ALU_out;
    
    sc_int<16> immediate_extened;
    
    sc_int<16> rs_data_signed;
    sc_int<16> rt_data_signed;
    sc_int<16> ALU_out_signed;

    void alu();

    SC_CTOR(ALU){
        SC_METHOD(alu);
        sensitive << opcode << rs_data << rt_data << immediate;
        dont_initialize();
    }
};

#endif
