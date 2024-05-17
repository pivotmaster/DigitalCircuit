#ifndef _HPG_huffman_proxy_h_H_
#define _HPG_huffman_proxy_h_H_

#include "systemc.h"

#define IDLE 0b0
#define READ 0b1
#define WORK 2
#define OUT 3

SC_HDL_MODULE( huffman) {
    sc_in<bool> clk;
    sc_in<bool> reset;
    sc_in<bool> gray_valid;
    sc_in<sc_uint<8> > gray_data;
    sc_out<bool> CNT_valid;
    sc_out<sc_uint<48> > CNT;
    sc_out<bool> code_valid;
    sc_out<sc_uint<48> > HC;
    sc_out<sc_uint<48> > M;
    sc_out<sc_uint<48> > in_Aid_all;
    sc_out<sc_uint<48> > in_CNT_all;
    sc_in<sc_uint<48> > out_Aid_all;
    sc_in<sc_uint<48> > out_CNT_all;

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

    huffman(sc_module_name name, const char* hdlSrcPath="") : 
        sc_hdl_module(name), hpg_log_lib("CWR_HDL_WORK"), hpg_module_name("huffman"), hpg_hdl_src_path()
        , clk("clk"), reset("reset"), gray_valid("gray_valid"), gray_data("gray_data")
        , CNT_valid("CNT_valid"), CNT("CNT"), code_valid("code_valid"), HC("HC")
        , M("M"), in_Aid_all("in_Aid_all"), in_CNT_all("in_CNT_all"), out_Aid_all("out_Aid_all")
        , out_CNT_all("out_CNT_all") {

        if (hdlSrcPath != 0 && strlen(hdlSrcPath) != 0) {
          hpg_hdl_src_path = std::string(hdlSrcPath) + "/";
        }


    }
};

#endif
