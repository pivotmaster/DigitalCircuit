`timescale 1ns/10ps
module pattern(
  // output signals
	clk,
	rst_n,
    in_number,
    mode,
    in_valid,
  // input signals
	out_valid,
	out_result
);

output logic  clk,rst_n,in_valid;
output logic signed [3:0] in_number ;
output logic [1:0] mode;
logic signed [3:0] in1,in2,in3,in4,tmp;
logic signed [3:0] innumber [3:0] ;
input out_valid;
input signed [5:0] out_result;
logic signed [5:0] golden;


//================================================================
// parameters & integer
//================================================================
integer PATNUM = 100;
integer CYCLE = 10;
integer total_latency;

integer patcount;
//================================================================
// initial
//================================================================

always	#(CYCLE/2.0) clk = ~clk;
initial	clk = 0;


initial begin
	in_valid = 0;
	rst_n = 1;
	force clk = 0;
	reset_task;
	release clk;
	total_latency = 0; 
    @(negedge clk);

	for (patcount=0;patcount<PATNUM;patcount=patcount+1)begin
		input_task;
		wait_outvalid;
		check_ans;
		outvalid_rst;
		@(negedge clk);
	end

	YOU_PASS_task;  
    $finish;
end

//================================================================
// task
//================================================================

// let rst_n = 0 for 3 cycles & check SPEC1(All output signals should be reset after the reset signal is asserted)
task reset_task ; begin
    //finish the task here vvv
	mode = 1'dx;
	in_number = 1'dx;
	#(30);
	rst_n = 1'd0;  
	#(30);
    if (out_valid !== 0 || out_result !== 0) begin
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$display ("                                                                    SPEC 1 FAIL                                                              ");
		$display ("                                                                       Reset                                                                ");
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		// repeat(3) #(10);
		$finish;
	end
	rst_n = 1'd1;
	// release clock
	release clk; repeat(5) @ (negedge clk);
	//finish the task here vvv
end endtask

//generate random inputs & assign to in_number in the specific cycle & calculate the golden value
task input_task ; begin
    //finish the task here vvv
	in_valid = 1'd1;
    mode = $urandom_range(3, 0);
    for(integer i=0; i<4; i=i+1) begin
		innumber[i] = $urandom_range(15, 0);
	end
	for(integer i=0; i<4; i=i+1)begin
		in_number = innumber[i];
		@(negedge clk);	
	end
	//release input
	in_valid = 1'd0;
	in_number = 1'd0;
	//calculate golden value
	//use in1 in2 in3 in4 sort the input from small to large
	for(integer i=0; i<4; i=i+1)
		for(integer j=i+1; j<4; j=j+1)
			if(innumber[i] > innumber[j]) begin
				tmp = innumber[j];
				innumber[j] = innumber[i];
				innumber[i] = tmp;
			end
	if(mode==2'd0) begin
		golden = innumber[0] + innumber[1];
	end else if (mode==2'd1) begin
		golden = innumber[1] - innumber[0];
	end else if (mode==2'd2) begin
		golden = innumber[3] - innumber[2];
	end else begin
		golden = innumber[0] - innumber[3];
	end
	//finish the task here vvv
end endtask

// check SPEC2 (The out_result should be correct when out_valid is high)
task outvalid_rst;begin
    //finish the task here vvv
    if(out_valid !== 0) begin
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$display ("                                                                    SPEC 2 FAIL                                                              ");
		$display ("                                                         Output should be zero after check                                                  ");
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$finish;
	end
	//finish the task here vvv
end endtask

// check SPEC3 (Outvalid cannot overlap with in_valid)
always @(posedge clk) begin
	if(in_valid === 1 && out_valid === 1) begin
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$display ("                                                                    SPEC 3 FAIL                                                               ");
		$display ("                                                Outvalid should be zero before give data finish                                            ");
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$finish;
	end
end

//check SPEC4 (The execution latency should not over 100 cycles)
task wait_outvalid ; begin
    //finish the task here vvv
    total_latency = 0;
	while(1) begin
		if(out_valid !== 0)
			break;
		@ (negedge clk);
		total_latency++;
		if(total_latency > 100) begin
			$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
			$display ("                                                                    SPEC 4 FAIL                                                               ");
			$display ("                                                  The execution latency are over 100  cycles                                            ");
			$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
			$finish;
		end
	end
	//finish the task here vvv
end endtask

// check SPEC5 (The output should be correct when out_valid is high)
task check_ans ; begin
    if(out_valid === 1) begin
        if (golden!== out_result)begin
            $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
            $display ("                                                                    SPEC 5 FAIL                                                             ");
            $display ("                                                                    YOUR:  %d                                                 ",out_result);
            $display ("                                                                    GOLDEN: %d                                                    ",golden);
            $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
	    $finish ;
        end
		@ (negedge clk);
    end
end endtask



/*
$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
$display ("                                                                    SPEC 1 FAIL                                                              ");
$display ("                                                                       Reset                                                                ");
$display ("--------------------------------------------------------------------------------------------------------------------------------------------");

$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
$display ("                                                                    SPEC 2 FAIL                                                              ");
$display ("                                                         Output should be zero after check                                                  ");
$display ("--------------------------------------------------------------------------------------------------------------------------------------------");

$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
$display ("                                                                    SPEC 3 FAIL                                                               ");
$display ("                                                Outvalid should be zero before give data finish                                            ");
$display ("--------------------------------------------------------------------------------------------------------------------------------------------");

$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
$display ("                                                                    SPEC 4 FAIL                                                               ");
$display ("                                                  The execution latency are over 100  cycles                                            ");
$display ("--------------------------------------------------------------------------------------------------------------------------------------------");

$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
$display ("                                                                    SPEC 5 FAIL                                                             ");
$display ("                                                                    YOUR:  %d                                                 ",out_result);
$display ("                                                                    GOLDEN: %d                                                    ",golden);
$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
*/

task YOU_PASS_task;begin

$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
$display ("                                                               Congratulations!                						             ");
$display ("                                                        You have passed all patterns!          						             ");
$display ("                                                                time: %8t ns                                                        ",$time);
$display ("--------------------------------------------------------------------------------------------------------------------------------------------");

$finish;	
end endtask

endmodule


