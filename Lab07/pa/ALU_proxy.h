#ifndef _HPG_ALU_proxy_h_H_
#define _HPG_ALU_proxy_h_H_

#include "systemc.h"

SC_HDL_MODULE( ALU) {
    sc_in<sc_uint<3> > opcode;
    sc_in<sc_uint<16> > rs_data;
    sc_in<sc_uint<16> > rt_data;
    sc_in<sc_uint<5> > immediate;
    sc_out<sc_uint<16> > ALU_out;

    std::string hpg_log_lib;
    std::string hpg_module_name;
    std::string hpg_hdl_src_path;

    std::string libraryName() { return hpg_log_lib; }

    std::string moduleName() { return hpg_module_name; }

    cwr_hdlLangType hdl_language_type() { return sc_hdl_module::cwr_verilog; }

    void getVerilogSourceFiles(std::vector<std::string>& verilog_files) {
        verilog_files.push_back(hpg_hdl_src_path + std::string("/RAID2/COURSE/DCS/DCS111/Lab07/pa/ALU.v"));
    }

    ALU(sc_module_name name, const char* hdlSrcPath="") : 
        sc_hdl_module(name), hpg_log_lib("CWR_HDL_WORK"), hpg_module_name("ALU"), hpg_hdl_src_path()
        , opcode("opcode"), rs_data("rs_data"), rt_data("rt_data"), immediate("immediate")
        , ALU_out("ALU_out") {

        if (hdlSrcPath != 0 && strlen(hdlSrcPath) != 0) {
          hpg_hdl_src_path = std::string(hdlSrcPath) + "/";
        }


    }
};

#endif
