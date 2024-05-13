//############################################################################
//   2024 Digital Circuit and System Lab
//   HW02        : Huffman Coding
//   Author      : HsuChiChen (chenneil90121@gmail.com)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   Date        : 2024.04.30
//   Version     : v1.0
//   File Name   : TESTBED.v
//   Module Name : TESTBED
//############################################################################

`timescale 1ns/10ps

`include "PATTERN.v"
`ifdef RTL
  `include "huffman.v"
  `include "sort.v"
`endif
`ifdef GATE
  `include "huffman_SYN.v"
//   `include "sort_SYN.v"
  `include "sort.v" // directly use RTL
`endif

module TESTBED;
wire clk;
wire reset;
wire gray_valid;
wire [7:0] gray_data;
wire CNT_valid;
wire [47:0] CNT;
wire code_valid;
wire [47:0] HC;
wire [47:0] M;
wire [47:0] in_Aid_all;
wire [47:0] in_CNT_all;
wire [47:0] out_Aid_all;
wire [47:0] out_CNT_all;

initial begin
	`ifdef RTL
   		$fsdbDumpfile("huffman.fsdb");
	 	$fsdbDumpvars(0,"+mda");
  	 	// $fsdbDumpvars();
	`endif
	`ifdef GATE
    	$sdf_annotate("huffman_SYN.sdf", u_huffman);
    	$fsdbDumpfile("huffman_SYN.fsdb");
    	$fsdbDumpvars(0,"+mda");
  		// $fsdbDumpvars(); 
  `endif
end

huffman u_huffman(
	.clk(clk),
	.reset(reset),
	.gray_valid(gray_valid),
	.gray_data(gray_data),
	.CNT_valid(CNT_valid),
	.CNT(CNT),
	.code_valid(code_valid),
	.HC(HC),
	.M(M),
	.in_Aid_all(in_Aid_all),
	.in_CNT_all(in_CNT_all),
	.out_Aid_all(out_Aid_all),
	.out_CNT_all(out_CNT_all)
);

sort u_sort(
	.in_Aid_all(in_Aid_all),
	.in_CNT_all(in_CNT_all),
	.out_Aid_all(out_Aid_all),
	.out_CNT_all(out_CNT_all)
);


PATTERN u_PATTERN(
	.clk(clk),
	.reset(reset),
	.gray_valid(gray_valid),
	.gray_data(gray_data),
	.CNT_valid(CNT_valid),
	.CNT(CNT),
	.code_valid(code_valid),
	.HC(HC),
	.M(M)
);

endmodule