//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2018 Fall
//   Lab02 Practice		: Complex Number Calculater
//   Author     		: Ping-Yuan Tsai (bubblegame@si2lab.org)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESETBED.v
//   Module Name : TESETBED
//   Release version : V1.0 (Release Date: 2018-09)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`timescale 1ns/10ps

`include "PATTERN.v"
`ifdef RTL
  `include "CNN.v"
`endif
`ifdef GATE
  `include "CNN_SYN.v"
`endif

	  		  	
module TESTBED;

wire          clk, rst_n, in_valid;
wire  [15:0]  in_data;
wire          opt;
wire          out_valid;
wire  [15:0]  out_data;


initial begin
  `ifdef RTL
   $fsdbDumpfile("CNN.fsdb");
	$fsdbDumpvars(0,"+mda");
  //  $fsdbDumpvars();
  `endif
  `ifdef GATE3
    $sdf_annotate("CNN_SYN.sdf", u_CNN);
  //  $fsdbDumpfile("CNN_SYN.fsdb");
  //  $fsdbDumpvars();    
  `endif
end

`ifdef RTL
CNN u_CNN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .in_data(in_data),
    .opt(opt),
    .out_valid(out_valid),
    .out_data(out_data)
    );
`endif

`ifdef GATE
CNN u_CNN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .in_data(in_data),
    .opt(opt),
    .out_valid(out_valid),
    .out_data(out_data)
    );
`endif

PATTERN u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .in_data(in_data),
    .opt(opt),
    .out_valid(out_valid),
    .out_data(out_data)
    );
  
 
endmodule
