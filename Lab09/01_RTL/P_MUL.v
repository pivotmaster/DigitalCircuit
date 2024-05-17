module P_MUL(
    // input signals
	in_1,
	in_2,
	in_3,
	in_valid,
	rst_n,
	clk,
	
    // output signals
    out_valid,
	out
);

//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION                         
//---------------------------------------------------------------------
input [46:0] in_1, in_2;
input [47:0] in_3;
input in_valid, rst_n, clk;
output reg out_valid;
output reg [95:0] out;

//==============================================//
//  			 reg declaration				//
//==============================================//
// reg [47:0] A;
reg [23:0] A1, A2, B1, B2;
reg [95:0] A1B1, A1B2, A2B1, A2B2;
reg out_start;
//==============================================//
//             	  Your Design          		 	//
//==============================================//\
integer i;
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		i <= 0;
		out <= 0;
		out_valid <= 0;
		out_start <= 0;
	end else  begin
		if(i != 5)
			i <= i+1;
		else
			out_start <= 1;
		{A1, A2} <= in_1 + in_2;
		{B1, B2} <= in_3;
		A1B1 <= ((A1 * B1) << 48);
		A1B2 <= ((A1 * B2) << 24);
		A2B1 <= ((A2 * B1) << 24);
		A2B2 <= (A2 * B2);
		out <= A1B1 + A1B2 + A2B1 + A2B2;
		out_valid <= out_start;
	end
end

endmodule