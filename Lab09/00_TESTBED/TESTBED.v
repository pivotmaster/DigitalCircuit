`timescale 1ns/10ps

`include "PATTERN.v"
`ifdef RTL
	`include "P_MUL.v"
`elsif GATE
	`include "P_MUL_SYN.v"
`endif

module TESTBED();

wire [46:0] in_1, in_2;
wire [47:0] in_3;
wire in_valid, rst_n, clk;

wire [95:0] out;
wire out_valid;

initial begin
	`ifdef RTL
		$fsdbDumpfile("P_MUL.fsdb");
		$fsdbDumpvars(0,"+mda");
	`elsif GATE
		$fsdbDumpfile("P_MUL_SYN.fsdb");
		$sdf_annotate("P_MUL_SYN.sdf", I_P_MUL);
		$fsdbDumpvars(0,"+mda");
	`endif
end

P_MUL I_P_MUL
(
	.in_1(in_1),
	.in_2(in_2),
	.in_3(in_3),
	.in_valid(in_valid),
	.rst_n(rst_n),
	.clk(clk),
	.out_valid(out_valid),
	.out(out)
);

PATTERN I_PATTERN
(
	.in_1(in_1),
	.in_2(in_2),
	.in_3(in_3),
	.in_valid(in_valid),
	.rst_n(rst_n),
	.clk(clk),
	.out_valid(out_valid),
	.out(out)
);
endmodule
