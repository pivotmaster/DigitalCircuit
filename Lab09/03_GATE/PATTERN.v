`define CYCLE_TIME 5

module PATTERN(
	// output signals
	in_1,
	in_2,
	in_3,
	in_valid,
	rst_n,
	clk,
	
    // input signals
    out_valid,
	out
);

//---------------------------------------------------------------------
//   PORT DECLARATION
//---------------------------------------------------------------------
output reg [46:0] in_1, in_2;
output reg [47:0] in_3;
output reg in_valid, rst_n, clk;

input [95:0] out;
input out_valid;

//================================================================
// clock
//================================================================
real	CYCLE = `CYCLE_TIME;
always	#(CYCLE/2.0) clk = ~clk;

//================================================================
// parameters & integer
//================================================================
integer cycle_time = CYCLE;
integer total_latency;
integer latency;

integer PATNUM = 1000;
integer seed = 87;
integer MAX_LATENCY = 100;

integer i_pat;
integer patcount;
integer gap;


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

//================================================================
// reg
//================================================================
reg [95:0]golden_out[0:999];

//================================================================
// initial
//================================================================
initial begin
	rst_n = 1'b1;
    in_valid = 1'b0;
	in_1 = 'b0;
	in_2 = 'b0;
	in_3 = 'b0;

	total_latency = 0;

	i_pat = 0;
	force clk = 0;
	reset_task;
	
	delay_task;	
	input_cal_task;

end

//================================================================
// total latency
//================================================================
always @(negedge clk) begin
	total_latency = total_latency + 1;
end

always @(negedge clk) begin
	wait_out_valid_task;
end
//================================================================
// Output check
//================================================================
always @(negedge clk) begin
	if (out_valid===1'b1) begin
		check_ans;
	end
end

//================================================================
// task
//================================================================
task delay_task; begin
	gap = $urandom_range(1,4);
	repeat(gap) @(negedge clk);
end endtask



task reset_task ; begin
	#(0.5); rst_n = 0;

	#(CYCLE*3);
	if(out_valid !== 0 || out!==95'b0) begin
		$display ("-------------------------------------------------------------------------------");
		$display ("                                 RESET  FAIL!                                  ");
		$display ( "                      all output signals should be reset to 0                 ");
		$display ( "------------------------------------------------------------------------------");
		#(100);
	    $finish ;
	end
	
	#(1.0); rst_n = 1 ;
	#(3.0); release clk;
end endtask



task input_cal_task; begin

	in_valid = 1;

	for(patcount=0; patcount<PATNUM; patcount=patcount+1)
	begin	
		in_1[31:0] = $random;
		in_1[46:32] = $random;
		in_2[31:0] = $random;
		in_2[46:32] = $random;
		in_3[31:0] = $random;
		in_3[47:32] = $random;
		golden_out[patcount] = (in_1+in_2) * in_3;
		@(negedge clk);
	end

	in_valid = 0;
	in_1 = 'b0;
	in_2 = 'b0;
	in_3 = 'b0;
end endtask

task check_ans; begin

	if(golden_out[i_pat] !== out) begin
		$display("%0s========================================================", txt_red_prefix);
		$display("                   PATTERN %3d FAIL						", i_pat);
		$display("              Your answer: %120b 	               			",out);
		$display("           Correct answer: %120b                			",golden_out[i_pat]);
		$display("========================================================\033[m");		#(10)
		$finish;
	end
	else begin
		$display("%0sPATTERN %3d PASS						\033[m", txt_green_prefix, i_pat);
	end
	i_pat = i_pat + 1;
	if(i_pat==PATNUM) begin
		YOU_PASS_task;
		$finish;
	end
end endtask

// wait out valid task
task wait_out_valid_task; begin
	latency = 0;
	// wait out valid
	while(out_valid === 0) begin
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


task YOU_PASS_task; begin
	$display("%0s========================================================", txt_magenta_prefix);
	$display("                      Congratulations!!");
    $display("                     All Pattern Test Pass");
	$display("                     Cycle time = %-2d ns", cycle_time);
	$display("                     Total latency = %-2d cycles", total_latency);
	$display("======================================================== %0s", reset_color);
	$finish;
end	endtask



endmodule

