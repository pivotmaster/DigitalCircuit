`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
  `include "lcd_ctrl.v"
`endif
`ifdef GATE
  `include "lcd_ctrl_SYN.v"
`endif


module TESTBED;

wire          clk;
wire          reset;
wire   [7:0]  datain;
wire   [2:0]  cmd;
wire          cmd_valid;
wire  [7:0]   dataout;
wire          output_valid;
wire          busy;


`ifdef GATE
   `define SDFFILE  "./lcd_ctrl_SYN.sdf"	    // Modify your sdf file name
   initial $sdf_annotate(`SDFFILE, top);
`endif

          
   
initial begin
// $dumpfile("LCD_CTRL.vcd");
// $dumpvars;
$fsdbDumpfile("LCD_CTRL.fsdb");
$fsdbDumpvars(0,"+mda");
$fsdbDumpvars;
end

   LCD_CTRL top(
   .clk(clk), 
   .reset(reset), 
   .datain(datain), 
   .cmd(cmd), 
   .cmd_valid(cmd_valid), 
   .dataout(dataout), 
   .output_valid(output_valid), 
   .busy(busy));

   PATTERN My_PATTERN(
   .clk(clk), 
   .reset(reset), 
   .datain(datain), 
   .cmd(cmd), 
   .cmd_valid(cmd_valid), 
   .dataout(dataout), 
   .output_valid(output_valid), 
   .busy(busy));
   
endmodule