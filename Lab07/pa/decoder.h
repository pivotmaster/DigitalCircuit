#ifndef DECODER_H
#define DECODER_H

#include "systemc.h"

SC_MODULE(decoder){
    sc_in < sc_uint<16> > instruction;
    sc_out < sc_uint<3> > opcode;
    sc_out < sc_uint<4> > rs;
    sc_out < sc_uint<4> > rt;
    sc_out < sc_uint<5> > immediate;

    void decode();

    SC_CTOR(decoder){
        SC_METHOD(decode);
        sensitive << instruction;
    };
};
#endif