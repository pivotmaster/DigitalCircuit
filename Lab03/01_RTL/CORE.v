//--------------------------------------------------------------
//Module "half Adder" provided by TA
//--------------------------------------------------------------
module HA(
		a, 
		b, 
		sum, 
		c_out
);
  input wire a, b;
  output wire sum, c_out;
  xor (sum, a, b);
  and (c_out, a, b);
endmodule

//--------------------------------------------------------------
//Finish module "full Adder" & "core" by yourself
//--------------------------------------------------------------
module FA(
		a, 
		b, 
		c_in, 
		sum, 
		c_out
);
  input   a, b, c_in;
  output  sum, c_out;

//-----write your code here-----V V V
  wire c1, s1, c2;
  HA ha1(.a(a), .b(b), .sum(s1), .c_out(c1));
  HA ha2(.a(s1), .b(c_in), .sum(sum), .c_out(c2));
  or or1(c_out, c1, c2);
//-----write your code here-----Λ Λ Λ
endmodule


module CORE (
    in_n0,
    in_n1,
    opt,
    out_n
);
//--------------------------------------------------------------
//Input, Output Declaration
//--------------------------------------------------------------
input [3:0] in_n0, in_n1;
input opt;
output [3:0] out_n;

//-----write your code here-----V V V
//assign out_n = (opt)? in_n0 - in_n1 : in_n0 + in_n1;    //do not use this assign statement
  wire c_out_1, c_out_2, c_out_3, c_out_4;
  wire b1, b2, b3, b4;
  wire temp;
  xor (b1, opt, in_n1[0]);
  xor (b2, opt, in_n1[1]);
  xor (b3, opt, in_n1[2]);
  xor (temp, in_n1[3], in_n1[3]);
  xor (b4, opt, temp);
  FA fa1(.a(in_n0[0]), .b(b1), .c_in(opt), .sum(out_n[0]), .c_out(c_out_1));
  FA fa2(.a(in_n0[1]), .b(b2), .c_in(c_out_1), .sum(out_n[1]), .c_out(c_out_2));
  FA fa3(.a(in_n0[2]), .b(b3), .c_in(c_out_2), .sum(out_n[2]), .c_out(c_out_3));
  FA fa4(.a(in_n0[3]), .b(b4), .c_in(c_out_3), .sum(out_n[3]), .c_out(c_out_4));
//-----write your code here-----Λ Λ Λ

endmodule 