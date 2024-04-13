//############################################################################
//   2024 Digital Circuit and System Lab
//   HW02        : Convolutional Neural Network (CNN) 
//   Author      : HsuChiChen (chenneil90121@gmail.com)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   Date        : 2024.04.02
//   Version     : v1.0
//   File Name   : PATTERN.v
//   Module Name : PATTERN
//############################################################################
// specification
// input feature map [6, 6], kernel [3, 3] and 1-bit option
// input feature map do convolution (kernel [3,3]), result will be [4, 4]
// do max pooling, result will be [2, 2]
// opt == 0, do ReLU, opt == 1, do not ReLU, result will be [2, 2]
// consecutively output data in 4 cycles

// cycle time = 100 ns
`define CYCLE_TIME 100.0

module PATTERN(
    //Output Port
    clk,
    rst_n,
    in_valid,
    in_data,
    opt,
    //Input Port
	out_valid,
    out_data
);
//==============================================//
//          Input & Output Declaration          //
//==============================================//
output reg clk, rst_n, in_valid;
output reg signed [15:0] in_data;
output reg opt;
input out_valid;
input signed [15:0] out_data;

//==============================================//
//               Parameter & Integer            //
//==============================================//
// User modification
parameter PATTERN_NUM = 1000;
integer   SEED = 587;
integer   MAX_LATENCY = 10000;

// PATTERN operation
parameter CYCLE = `CYCLE_TIME;

// PATTERN CONTROL
integer cycle_time = CYCLE;
integer total_latency;
integer latency;
integer i_pat;
integer i, j, k, l;
integer out_valid_count;

//==============================================//
//                 Signal Declaration           //
//==============================================//
// 6*6 image
reg signed [15:0] image[0:5][0:5];
// 3*3 kernel
reg signed [15:0] kernel[0:2][0:2];
// 1-bit option
reg opt_reg;

// 4*4 convolution result
reg signed [15:0] conv_result[0:3][0:3];

// 4*4 ReLU result
reg signed [15:0] relu_result[0:3][0:3];

// 2*2 pooling result
reg signed [15:0] pooling_result[0:1][0:1];

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

	// initial variable
	total_latency = 0;
	
	// start to test
	for(i_pat = 0; i_pat < PATTERN_NUM; i_pat = i_pat + 1) begin
		gen_pattern; // generate image, kernel and opt
		input_task;  // input by cycle
		cal_task;    // calculate convolution, ReLU and pooling
		wait_out_valid_task; // wait out_valid pull high
		check_ans_task; // check answer
		$display("%0s Pattern %3d Pass %0s Latency = %3d Cycles %0s", txt_green_prefix, i_pat, txt_yellow_prefix, latency, reset_color);
		total_latency = total_latency + latency;
	end
	pass_task;
end

//==============================================//
//    out_valid cannot overlap with in_valid    //
//==============================================//
// The out_valid cannot overlap with in_valid at any time
always @(posedge clk) begin
	if(in_valid === 1 && out_valid === 1) begin
		$display("%0s=========================================================", txt_red_prefix);
		$display("                        FAIL 						");
		$display("    out_valid and in_valid cannot overlap at %-8d ps  ", $time*1000);
		$display("=========================================================%0s", reset_color);
		repeat(3) #(CYCLE);
		$finish;
	end
end

//==============================================//
//            Clock and Reset Function          //
//==============================================//
// clock
always begin
	#(CYCLE/2);
	clk = ~clk;
end

// reset task
task reset_task; begin	
	// initiaize signal
	clk = 0;
	rst_n = 1;
	in_valid = 0;
	in_data = 'dx;
	opt = 'dx;
	// force clock to be 0, do not flip in half cycle
	force clk = 0;

	#(CYCLE*3);
	
	// reset
	rst_n = 0;  #(CYCLE*4); // wait 4 cycles to check output signal
	// check reset
	if(out_data !== 0 || out_valid !== 0) begin
		$display("%0s=========================================================", txt_red_prefix);
		$display("                        FAIL 						");
        $display("    Output signal should be 0 after reset at %-8d ps  ", $time*1000);
        $display("=========================================================%0s", reset_color);
        repeat(3) #(CYCLE);
        $finish;
	end

	// release reset
	rst_n = 1; #(CYCLE*3);
	
	// release clock
	release clk; repeat(5) @ (negedge clk);
end endtask

//==============================================//
//      Generate Pattern and Input Function     //
//==============================================//
// generate pattern
task gen_pattern; begin
	// generate image from -9 to 9
	for(i = 0; i < 6; i = i + 1) begin
		for(j = 0; j < 6; j = j + 1) begin
			image[i][j] = {$random(SEED)} % 19 - 9;
		end
	end

	// generate kernel from -9 to 9
	for(i = 0; i < 3; i = i + 1) begin
		for(j = 0; j < 3; j = j + 1) begin
			kernel[i][j] = {$random(SEED)} % 19 - 9;
		end
	end

	// generate opt from 0 to 1
	opt_reg = {$random(SEED)} % 2;
end endtask

// input task
task input_task; begin
	// input image
	in_valid = 1;
	// ouput opt in first cycle
	opt = opt_reg;
	for(i = 0; i < 6; i = i + 1) begin
		for(j = 0; j < 6; j = j + 1) begin
			in_data = image[i][j];
			@ (negedge clk);
			opt = 'bx;
		end
	end

	// input kernel
	for(i = 0; i < 3; i = i + 1) begin
		for(j = 0; j < 3; j = j + 1) begin
			in_data = kernel[i][j];
			@ (negedge clk);
		end
	end
	
	// release input
	in_valid = 0;
	in_data = 'dx;
end endtask

//==============================================//
//          Calculate and Check Function        //
//==============================================//
// calculate task
task cal_task; begin
	// calculate convolution
	for(i = 0; i < 4; i = i + 1) begin
		for(j = 0; j < 4; j = j + 1) begin
			conv_result[i][j] = 0;
			for(k = 0; k < 3; k = k + 1) begin
				for(l = 0; l < 3; l = l + 1) begin
					conv_result[i][j] = conv_result[i][j] + image[i+k][j+l] * kernel[k][l];
				end
			end
		end
	end

	// calculate ReLU
	for(i = 0; i < 4; i = i + 1) begin
		for(j = 0; j < 4; j = j + 1) begin
			if(opt_reg == 0 && conv_result[i][j] < 0) begin
				relu_result[i][j] = 0;
			end else begin
				relu_result[i][j] = conv_result[i][j];
			end
		end
	end

	// calculate pooling
	for (i = 0; i < 2; i = i + 1) begin
		for (j = 0; j < 2; j = j + 1) begin
			// initialize pooling result to be the first element
			pooling_result[i][j] = relu_result[i*2][j*2]; 
			for (k = 0; k < 2; k = k + 1) begin
				for (l = 0; l < 2; l = l + 1) begin
					// update pooling result to be the maximum value
					if(pooling_result[i][j] < relu_result[i*2+k][j*2+l]) begin
						pooling_result[i][j] = relu_result[i*2+k][j*2+l];
					end
				end
			end
		end
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

// check answer task in 4 cycle
task check_ans_task ; begin
	out_valid_count = 0;
	// check answer
	while(out_valid === 1) begin
		if(out_valid_count === 0) begin
			if(pooling_result[0][0] !== out_data) begin
				out_data_error();
			end
		end else if(out_valid_count === 1) begin
			if(pooling_result[0][1] !== out_data) begin
				out_data_error();
			end
		end else if(out_valid_count === 2) begin
			if(pooling_result[1][0] !== out_data) begin
				out_data_error();
			end
		end else if(out_valid_count === 3) begin
			if(pooling_result[1][1] !== out_data) begin
				out_data_error();
			end
		end
		
		out_valid_count = out_valid_count + 1;
		if(out_valid_count > 4) begin
			$display("%0s====================================================================", txt_red_prefix);
			$display("                         FAIL"                           );
			$display("    out_valid consecutively pull high over 4 cycles at %-8d ps  ", $time*1000);
			$display("====================================================================%0s", reset_color);
			// wait for 5 cycles to terminate the program
			repeat(5) @ (negedge clk);
			$finish;
		end
		@ (negedge clk);
	end

	if(out_valid_count != 4) begin
		$display("%0s=========================================================================", txt_red_prefix);
		$display("                         FAIL"                           );
		$display("    out_valid should consecutively pull high in 4 cycles at %-8d ps  ", $time*1000);
		$display("=========================================================================%0s", reset_color);
		// wait for 5 cycles to terminate the program
		repeat(5) @ (negedge clk);
		$finish;
	end

	// next input wait random 3~5 cycles
	repeat({$random(SEED)} % 3 + 2) @ (negedge clk);
end endtask

//================================================================//
//   Print Calculation Value for Debugging when Output Error     //
//================================================================//
task out_data_error; begin
	$display("%0s========================================================", txt_red_prefix);
	$display("                   PATTERN %3d FAIL", i_pat);
	$display("                out_data in Cycle No. %1d", out_valid_count);
	$display("          Your answer = %3d, Correct answer = %3d", out_data, pooling_result[out_valid_count/2][out_valid_count%2]);
	$display("========================================================\033[m");	

	// print image
	$display("%0s[=================]", txt_blue_prefix);
	$display("[Input Feature Map]");
	$display("[=================] %0s", reset_color);
	
	$write("   ");
	for(i = 0; i < 6; i = i + 1) begin
		$write("%4d ", i); // print index
	end
	$write("\n");
	$display("_________________________________");
	for(i = 0; i < 6; i = i + 1) begin
    	$write("%1d |", i); 
		for(j = 0; j < 6; j = j + 1) begin
        	$write("%4d ", image[i][j]);
    	end
    	$write("\n"); // new line for next row
	end
	$write("\n");

	// print kernel
	$display("%0s[======]", txt_blue_prefix);
	$display("[Kernel]");
	$display("[======] %0s", reset_color);
	
	$write("   ");
	for(i = 0; i < 3; i = i + 1) begin
		$write("%4d ", i); // print index
	end
	$write("\n");
	$display("_________________");
	for(i = 0; i < 3; i = i + 1) begin
    	$write("%1d |", i); 
		for(j = 0; j < 3; j = j + 1) begin
        	$write("%4d ", kernel[i][j]);
    	end
    	$write("\n"); // new line for next row
	end
	$write("\n");

	// print opt
	$display("%0s[======]", txt_blue_prefix);
	$display("[Option]");
	$display("[======] %0s", reset_color);

	if(opt_reg == 0) begin
		$display("0 {Do ReLU}");
	end else begin
		$display("1 {Do Not ReLU}");
	end
	$write("\n");

	// print convolution result
	$display("%0s[==================]", txt_blue_prefix);
	$display("[Convolution Result]");
	$display("[==================] %0s", reset_color);
	
	$write("   ");
	for(i = 0; i < 4; i = i + 1) begin
		$write("%4d ", i); // print index
	end
	$write("\n");
	$display("_______________________");
	for(i = 0; i < 4; i = i + 1) begin
    	$write("%1d |", i); 
		for(j = 0; j < 4; j = j + 1) begin
        	$write("%4d ", conv_result[i][j]);
    	end
    	$write("\n"); // new line for next row
	end
	$write("\n");

	// print ReLU result
	$display("%0s[===========]", txt_blue_prefix);
	$display("[ReLU Result]");
	$display("[===========] %0s", reset_color);

	$write("   ");
	for(i = 0; i < 4; i = i + 1) begin
		$write("%4d ", i); // print index
	end
	$write("\n");
	$display("_______________________");
	for(i = 0; i < 4; i = i + 1) begin
    	$write("%1d |", i); 
		for(j = 0; j < 4; j = j + 1) begin
        	$write("%4d ", relu_result[i][j]);
    	end
    	$write("\n"); // new line for next row
	end
	$write("\n");

	// print pooling result
	$display("%0s[==============]", txt_blue_prefix);
	$display("[Pooling Result]");
	$display("[==============] %0s", reset_color);

	$write("   ");
	for(i = 0; i < 2; i = i + 1) begin
		$write("%4d ", i); // print index
	end
	$write("\n");
	$display("_____________");
	for(i = 0; i < 2; i = i + 1) begin
    	$write("%1d |", i); 
		for(j = 0; j < 2; j = j + 1) begin
        	$write("%4d ", pooling_result[i][j]);
    	end
    	$write("\n"); // new line for next row
	end
	$write("\n");

	// print pooling result
	$display("%0s[===============]", txt_blue_prefix);
	$display("[Expected Output]");
	$display("[===============] %0s", reset_color);
	$display("%0sIn Cycle 1, golden output_data = %4d", txt_cyan_prefix, pooling_result[0][0]);
	$display("In Cycle 2, golden output_data = %4d", pooling_result[0][1]);
	$display("In Cycle 3, golden output_data = %4d", pooling_result[1][0]);
	$display("In Cycle 4, golden output_data = %4d %0s", pooling_result[1][1],reset_color);

	// wait for 5 cycles to terminate the program
	repeat(5) @ (negedge clk);
	$finish;
end endtask

//==============================================//
//            Pass and Finish Function          //
//==============================================//
// pass task
task pass_task; begin
	$display("%0s========================================================", txt_magenta_prefix);
	$display("                      Congratulations!!");
    $display("                     All Pattern Test Pass");
	$display("                       Cycle time = %-2d ns", cycle_time);
	$display("          Your execution cycles = %-4d cycles", total_latency);
	$display("======================================================== %0s", reset_color);
	$finish;
end	endtask

endmodule