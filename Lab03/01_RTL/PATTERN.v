`define CLK_PERIOD  30.0

module PATTERN(
	in_n0,
    in_n1,
    opt,
	out_n
);
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION                         
//---------------------------------------------------------------------
output reg [3:0]  in_n0,in_n1;
output reg opt;
input [3:0] out_n;

//---------------------------------------------------------------------
// PARAMETER DECLARATION
//---------------------------------------------------------------------
integer i, j;
integer seed;
integer NUM_PATTERN;
 	
//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION                             
//---------------------------------------------------------------------
reg [3:0] ans;
reg signed [3:0] n0,n1;

//---------------------------------------------------------------------
//CLK DECLARATION                             
//---------------------------------------------------------------------
reg CLK;
real CYCLE;
initial begin
	CLK=15;
	CYCLE=`CLK_PERIOD;
end
always #(CYCLE/2) CLK = ~CLK;
//---------------------------------------------------------------------
//   TEST PATTERN                                         
//---------------------------------------------------------------------
initial begin
	in_n0 =0;
	in_n1 =0;
	opt = 0;
    ans = 0;
 	
	seed = 253;
	NUM_PATTERN = 1000;

	@(negedge CLK);
    
	for( i = 1 ; i <= NUM_PATTERN; i = i + 1)
	begin    
		in_n0 ={1'b0 , $random(seed)%4'd8};		
		in_n1 ={1'b0 , $random(seed)%4'd8};		
		opt =  $random(seed)%2'd2;	

        n0=in_n0;
        n1=in_n1;
		case(opt)		
			1'b0: ans = n0 + n1;
			1'b1: ans = n0 - n1;   
		default: ans = ans;		
		endcase		
				
		@(negedge CLK)			
		if(ans === out_n) begin
			$display("\033[1;32m PATTERN %3d pass\033[m", i);
		end else begin
			$display("\033[1;31m ========================================================\033[m");
			$display("\033[1;31m                   PATTERN %3d fail\033[m", i);
			$display("\033[1;31m                    opt = %d \033[m",opt);
			$display("\033[1;31m              input1 = %d  input2 = %d \033[m",in_n0, in_n1);
			$display("\033[1;31m          Your answer =  %d Correct answer = %d",out_n, ans);
			$display("\033[1;31m ========================================================\033[m");	
			$finish;
		end
	end        
	pass_print;
	$finish;
end

task pass_print ;
begin
    $display("\033[1;35m ========================================================\033[m");
    $display("\033[1;35m                You have passed this pattern!!\033[m");	
	$display("\033[1;35m    Raise Hand and register your [DCS001 - DCS155] to TA");
	$display("\033[1;35m ========================================================\033[m");
end	
endtask

endmodule


