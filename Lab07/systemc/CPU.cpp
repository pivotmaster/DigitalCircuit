#ifndef CPU_H
#define CPU_H

#include "ALU.h"
#include "register_file.h"
#include "memory.h"
#include "clockreset.h"
#include "decoder.h"
#include "Pattern.h"
#include "Monitor.h"
#include <systemc.h>
#include <iostream>
using namespace std;

// CPU with ALU, register file, memory, clock, and reset
SC_MODULE(CPU) {
    sc_signal<sc_uint<16>> instruction;
    //sc_out<sc_bv<16>> result;
    sc_signal<bool> clk, reset;

    ALU m_ALU;
    register_file m_register_file;
    memory m_memory;
    Clock m_clock;
    Reset m_reset;
    decoder m_decoder;
    Pattern m_pattern;
    Monitor m_monitor;

    sc_signal<sc_uint<16>> read_data1, read_data2;
    sc_signal<sc_uint<3>> opcode;
    sc_signal<sc_uint<4>> rs, rt;
    sc_signal<sc_uint<5>> immediate;
    sc_signal<sc_uint<16>> ALU_out;
    sc_signal<sc_uint<5>> golden_immediate;
    sc_signal<sc_uint<16>> golden_ALU_out;
    sc_signal<sc_int<16>> data_out;
    //sc_signal<sc_int<2>> write_enable = 1;
    

    SC_CTOR(CPU) : m_ALU("m_ALU"), m_register_file("m_register_file"), m_memory("m_memory"), m_clock("m_clock", 5, 500), m_reset("m_reset", 20), m_decoder("m_decoder"),m_pattern( "m_pattern" ),m_monitor( "m_monitor" ) {
        //m_reset.clk(clk);
        m_reset.rst(reset);
        m_clock.clk(clk);

        // pattern input
        m_pattern.clock(clk);
        // pattern output
        m_pattern.reset(reset);
        m_pattern.instruction(instruction);
        m_pattern.golden_ALU_out(golden_ALU_out);
        m_pattern.golden_immediate(golden_immediate);

        // pattern input
        m_monitor.clock(clk);
        //m_monitor.instruction(instruction);
        m_monitor.golden_ALU_out(golden_ALU_out);
        m_monitor.golden_immediate(golden_immediate);
        m_monitor.immediate(immediate);
        m_monitor.ALU_out(ALU_out);

        /*for (int i = 0; i < 31; ++i) {
        m_memory.mem[i].bind(m_monitor.mem[i]);
    }*/

        // decoder input
        m_decoder.instruction(instruction);
        // decoder output
        m_decoder.opcode(opcode);
        m_decoder.rs(rs);
        m_decoder.rt(rt);
        m_decoder.immediate(immediate);

        // register file input
        m_register_file.read_reg1(rs);
        m_register_file.read_reg2(rt);
        // register file output
        m_register_file.read_data1(read_data1);
        m_register_file.read_data2(read_data2);

        // memory input
        m_memory.address(immediate);
        m_memory.data_in(ALU_out);
        //m_memory.write_enable(1);
        // memory output
        m_memory.data_out(data_out);

        // ALU input
        m_ALU.opcode(opcode);
        m_ALU.rs_data(read_data1);
        m_ALU.rt_data(read_data2);
        m_ALU.immediate(immediate);
        // ALU output
        m_ALU.ALU_out(ALU_out);
        //m_ALU.result(result);
    }
};

#endif