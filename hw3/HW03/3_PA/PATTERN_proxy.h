#ifndef _HPG_PATTERN_proxy_h_H_
#define _HPG_PATTERN_proxy_h_H_

#include "systemc.h"

SC_HDL_MODULE( PATTERN) {
    sc_out<bool> clk;
    sc_out<bool> reset;
    sc_out<sc_uint<8> > gray_data;
    sc_out<bool> gray_valid;
    sc_in<sc_uint<48> > CNT;
    sc_in<bool> CNT_valid;
    sc_in<sc_uint<48> > HC;
    sc_in<sc_uint<48> > M;
    sc_in<bool> code_valid;

    std::string hpg_log_lib;
    std::string hpg_module_name;
    std::string hpg_hdl_src_path;

    std::string libraryName() { return hpg_log_lib; }

    std::string moduleName() { return hpg_module_name; }

    cwr_hdlLangType hdl_language_type() { return sc_hdl_module::cwr_verilog; }

    void getVerilogSourceFiles(std::vector<std::string>& verilog_files) {
        verilog_files.push_back(hpg_hdl_src_path + std::string("/RAID2/COURSE/DCS/DCS111/HW03/3_PA/huffman.v"));
        verilog_files.push_back(hpg_hdl_src_path + std::string("/RAID2/COURSE/DCS/DCS111/HW03/3_PA/PATTERN.v"));
    }

    PATTERN(sc_module_name name, int CYCLE = 20, int MAX_LATENCY = 100, const char* hdlSrcPath="") : 
        sc_hdl_module(name), hpg_log_lib("CWR_HDL_WORK"), hpg_module_name("PATTERN"), hpg_hdl_src_path()
        , clk("clk"), reset("reset"), gray_data("gray_data"), gray_valid("gray_valid")
        , CNT("CNT"), CNT_valid("CNT_valid"), HC("HC"), M("M"), code_valid("code_valid") {

        if (hdlSrcPath != 0 && strlen(hdlSrcPath) != 0) {
          hpg_hdl_src_path = std::string(hdlSrcPath) + "/";
        }

        ncwr_set_hdl_param("CYCLE", CYCLE);
        ncwr_set_hdl_param("MAX_LATENCY", MAX_LATENCY);

    }
};

#endif
