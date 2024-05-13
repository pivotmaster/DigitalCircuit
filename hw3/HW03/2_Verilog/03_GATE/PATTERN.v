//############################################################################
//   2024 Digital Circuit and System Lab
//   HW03        : Huffman Coding
//   Author      : HsuChiChen (chenneil90121@gmail.com)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   Date        : 2024.04.30
//   Version     : v1.0 (string version)
//   File Name   : PATTERN.v
//   Module Name : PATTERN
//############################################################################

//==============================================//
//      Macro of testbench selection            //
//==============================================//
// // testbench 1
// `define PAT1 "../00_TESTBED/pattern1.dat"
// `define EXP1 "../00_TESTBED/golden1.dat"

// // testbench 2
// `define PAT2 "../00_TESTBED/pattern2.dat"
// `define EXP2 "../00_TESTBED/golden2.dat"

// // testbench 3
// `define PAT3 "../00_TESTBED/pattern3.dat"
// `define EXP3 "../00_TESTBED/golden3.dat"

// cycle time = 20ns
`define CYCLE_TIME 20

module PATTERN(
	// Output Ports
	clk, reset, gray_data, gray_valid,
	// Input Ports
	CNT, CNT_valid, HC, M, code_valid);

//==============================================//
//          Input & Output Declaration          //
//==============================================//
// Output Ports
output reg clk;
output reg reset;
output reg [7:0] gray_data;
output reg gray_valid;

// Input Ports
input CNT_valid;
input [47:0] CNT;
input code_valid;
input [47:0] HC;
input [47:0] M;

//==============================================//
//               Parameter & Integer            //
//==============================================//
// parameter PAT1 = `PAT1;
// parameter PAT2 = `PAT2;
// parameter PAT3 = `PAT3;
// parameter EXP1 = `EXP1;
// parameter EXP2 = `EXP2;
// parameter EXP3 = `EXP3;
string PAT [0:2];
string EXP [0:2];

initial begin
    PAT[0] = "../00_TESTBED/pattern1.dat";
    PAT[1] = "../00_TESTBED/pattern2.dat";
    PAT[2] = "../00_TESTBED/pattern3.dat";
    
    EXP[0] = "../00_TESTBED/golden1.dat";
    EXP[1] = "../00_TESTBED/golden2.dat";
    EXP[2] = "../00_TESTBED/golden3.dat";
end

parameter CYCLE = `CYCLE_TIME;
parameter MAX_LATENCY = 1000;

integer i;
integer i_pat;
integer latency;
integer total_latency;
//==============================================//
//                 Signal Declaration           //
//==============================================//
reg [7:0] pat_mem [0:99];
reg [7:0] exp_mem [0:17];

wire [47:0] CNT_EXP;
wire [47:0] HC_EXP;
wire [47:0] M_EXP;

assign CNT_EXP = {exp_mem[0], exp_mem[1], exp_mem[2], exp_mem[3], exp_mem[4], exp_mem[5]};
assign HC_EXP = {exp_mem[6], exp_mem[7], exp_mem[8], exp_mem[9], exp_mem[10], exp_mem[11]};
assign M_EXP = {exp_mem[12], exp_mem[13], exp_mem[14], exp_mem[15], exp_mem[16], exp_mem[17]};


//==============================================//
//                 String control               //
//==============================================//
// Should use %0s
string reset_color          = "\033[1;0m";
string txt_black_prefix     = "\033[1;30m";
string txt_red_prefix       = "\033[1;31m";
string txt_green_prefix     = "\033[1;32m";
string txt_yellow_prefix    = "\033[1;33m";
string txt_blue_prefix      = "\033[1;34m";
string txt_magenta_prefix   = "\033[1;35m";
string txt_cyan_prefix      = "\033[1;36m";

string bkg_black_prefix     = "\033[40;1m";
string bkg_red_prefix       = "\033[41;1m";
string bkg_green_prefix     = "\033[42;1m";
string bkg_yellow_prefix    = "\033[43;1m";
string bkg_blue_prefix      = "\033[44;1m";
string bkg_white_prefix     = "\033[47;1m";

//==============================================//
//                main function                 //
//==============================================//
initial begin
	reset_task;
	total_latency = 0;
	// start to test
	for(i_pat = 0; i_pat < 3; i_pat = i_pat + 1) begin
		// Read pattern and golden file
		$readmemh(PAT[i_pat], pat_mem);
		$readmemh(EXP[i_pat], exp_mem);
		$display("%0s PATTERN %1d simulation start (%26s and %s were used) %0s", txt_magenta_prefix, i_pat, PAT[i_pat], EXP[i_pat], reset_color);
		input_task;  // input by cycle
		wait_CNT_valid_task; // wait out_valid pull high
		check_CNT_task; // check CNTanswer
		wait_code_valid_task; // wait code_valid pull high
		check_code_task; // check code answer

		$display("%0s Pattern %1d Pass %0s Latency = %2d Cycles %0s", txt_green_prefix, i_pat, txt_yellow_prefix, latency, reset_color);
		total_latency = total_latency + latency;
	end
	pass_task;
end

//==============================================//
//            Clock and Reset Function          //
//==============================================//
// clock
always begin 
	#(CYCLE/2.0);
	clk = ~clk;
end

// reset
task reset_task; begin
	// initiaize signal
	clk = 0;
	reset = 0;
	gray_data = 0;
	gray_valid = 0;

	// force clock to be 0, do not flip in half cycle
	force clk = 0;

	#(CYCLE*3);
	
	// reset
	reset = 1;  #(CYCLE*4); // wait 4 cycles to check output signal
	// check reset
	if(CNT_valid !== 0 || code_valid !== 0) begin
		$display("%0s=========================================================", txt_red_prefix);
		$display("                        FAIL 						");
		$display("    Output signal should be 0 after reset at %-8d ps  ", $time*1000);
		$display("=========================================================%0s", reset_color);
		repeat(3) #(CYCLE);
		$finish;
	end

	// release reset
	reset = 0; #(CYCLE*3);
	
	// release clock
	release clk; repeat(5) @ (negedge clk);
end endtask

//==============================================//
//                  Input Function              //
//==============================================//
// input for 100 cycles
task input_task; begin
	@(negedge clk);

	for(i = 0; i < 100; i = i + 1) begin
		gray_data = pat_mem[i];
		gray_valid = 1;
		@(negedge clk);
	end
	gray_valid = 0;
	gray_data = 'dx;
end endtask

//==============================================//
//        wait and check count number           //
//==============================================//
// wait CNT_valid pull high
task wait_CNT_valid_task; begin
	latency = 0;
	// wait CNT_valid pull high
	while(CNT_valid !== 1) begin
		@ (negedge clk);
		latency = latency + 1;
		// check latency is over MAX_LATENCY
		if(latency > MAX_LATENCY) begin
			$display("%0s================================================================", txt_red_prefix);
			$display("                             FAIL"                           );
			$display("    the execution latency is over %4d cycles at %-8d ps  ", MAX_LATENCY, $time*1000);
			$display("================================================================%0s", reset_color);
			$finish;
		end
	end
end endtask

// check CNT answer
task check_CNT_task; begin
	// check CNT answer
	if(CNT !== CNT_EXP) begin
		$display("%0s=========================================================", txt_red_prefix);
		$display("                        FAIL 						");
		$display("    CNT answer is wrong at %-8d ps  ", $time*1000);
		$display("=========================================================%0s", reset_color);
		
		// debug message
		$display("%0sYour CN1 is %4d, golden CN1 is %4d", txt_blue_prefix, CNT[47:40], CNT_EXP[47:40]);
		$display("Your CN2 is %4d, golden CN2 is %4d", CNT[39:32], CNT_EXP[39:32]);
		$display("Your CN3 is %4d, golden CN3 is %4d", CNT[31:24], CNT_EXP[31:24]);
		$display("Your CN4 is %4d, golden CN4 is %4d", CNT[23:16], CNT_EXP[23:16]);
		$display("Your CN5 is %4d, golden CN5 is %4d", CNT[15:8], CNT_EXP[15:8]);
		$display("Your CN6 is %4d, golden CN6 is %4d %0s", CNT[7:0], CNT_EXP[7:0], reset_color);
		
		repeat(5) #(CYCLE);
		$finish;
	end
end endtask

//==============================================//
//        wait and check code and mask          //
//==============================================//
// wait code_valid pull high
task wait_code_valid_task; begin
	// wait code_valid pull high
	while(code_valid !== 1) begin
		@ (negedge clk);
		latency = latency + 1;
		// check latency is over MAX_LATENCY
		if(latency > MAX_LATENCY) begin
			$display("%0s================================================================", txt_red_prefix);
			$display("                             FAIL"                           );
			$display("    the execution latency is over %4d cycles at %-8d ps  ", MAX_LATENCY, $time*1000);
			$display("================================================================%0s", reset_color);
			$finish;
		end
	end
end endtask

// check code answer
task check_code_task; begin
	// check code answer
	if(HC !== HC_EXP || M !== M_EXP) begin
		$display("%0s=========================================================", txt_red_prefix);
		$display("                        FAIL 						");
		$display("    code answer is wrong at %-8d ps  ", $time*1000);
		$display("=========================================================%0s", reset_color);
		
		// debug message
		$display("%0sYour HC1 is %b, golden HC1 is %b", txt_blue_prefix, HC[47:40], HC_EXP[47:40]);
		$display("Your HC2 is %b, golden HC2 is %b", HC[39:32], HC_EXP[39:32]);
		$display("Your HC3 is %b, golden HC3 is %b", HC[31:24], HC_EXP[31:24]);
		$display("Your HC4 is %b, golden HC4 is %b", HC[23:16], HC_EXP[23:16]);
		$display("Your HC5 is %b, golden HC5 is %b", HC[15:8], HC_EXP[15:8]);
		$display("Your HC6 is %b, golden HC6 is %b %0s\n", HC[7:0], HC_EXP[7:0], reset_color);

		$display("%0sYour M1 is %b, golden M1 is %b", txt_blue_prefix, M[47:40], M_EXP[47:40]);
		$display("Your M2 is %b, golden M2 is %b", M[39:32], M_EXP[39:32]);
		$display("Your M3 is %b, golden M3 is %b", M[31:24], M_EXP[31:24]);
		$display("Your M4 is %b, golden M4 is %b", M[23:16], M_EXP[23:16]);
		$display("Your M5 is %b, golden M5 is %b", M[15:8], M_EXP[15:8]);
		$display("Your M6 is %b, golden M6 is %b %0s", M[7:0], M_EXP[7:0], reset_color);

		repeat(5) #(CYCLE);
		$finish;
	end
end endtask

//==============================================//
//            Pass and Finish Function          //
//==============================================//
// pass task
task pass_task; begin
	$display("%0s========================================================", txt_magenta_prefix);
	$display("                      Congratulations!!");
    $display("                     All Pattern Test Pass");
	$display("                       Cycle time = %.1f ns", CYCLE);
	$display("          Your execution cycles = %-3d cycles", total_latency);
	$display("======================================================== %0s", reset_color);
	$finish;
end	endtask

endmodule