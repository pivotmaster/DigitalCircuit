//############################################################################
//   2024 Digital Circuit and System Lab
//   HW03        : Huffman Coding
//   Author      : HsuChiChen (chenneil90121@gmail.com)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   Date        : 2024.04.30
//   Version     : v1.0
//   File Name   : sort.v
//   Module Name : sort
//############################################################################
// Huffman coding is a method of lossless data compression. 
// It assigns variable-length codes to input characters, the length of the code depends on the frequency of the character.
// The most frequent character gets the smallest code and the least frequent character gets the largest code.
// The codes are prefix-free, which means that no code is a prefix of another code.
// This is useful for decoding, as it means that the code can be read one bit at a time and the result will be unambiguous.

// My algorithm is as follows:
// 1. count the number of 6 character from gray image in 100 cycles
// 2. sort the 6 character and 6 weight in 5 cycles. Simulatuously, calculate the Huffman code and code length
// Do not need to establish Huffman tree, just use the pointer to top node for node 0 ~ 5
// 3. output the number of 6 characters, Huffman code, and mask for each character's Huffman code in 1 cycle

// In TSMC 0.13um technology, latency is 5 cycles
// when cycle time is 5ns, total cell area 41584 um^2
// when cycle time is 6ns, total cell area 35080 um^2
// when cycle time is 10ns, total cell area 26710 um^2

//================================================//
//            6-input sorting network             //
//================================================//
module sort (
    // Input signals
    in_Aid_all, in_CNT_all,
    // Output signals
    out_Aid_all,  out_CNT_all
);

input [47:0]  in_Aid_all;
input [47:0]  in_CNT_all;

output reg [47:0] out_Aid_all;
output reg [47:0] out_CNT_all;

reg [7:0] in_Aid  [5:0];
reg [7:0] in_CNT  [5:0];
reg [7:0] out_Aid [5:0];
reg [7:0] out_CNT [5:0];

always @(*) begin
    {in_Aid[5], in_Aid[4], in_Aid[3], in_Aid[2], in_Aid[1], in_Aid[0]} = in_Aid_all;
    {in_CNT[5], in_CNT[4], in_CNT[3], in_CNT[2], in_CNT[1], in_CNT[0]} = in_CNT_all;
end


wire f0_1 = (in_CNT[0] > in_CNT[1]) ? 1'd1 : 1'd0;
wire f0_2 = (in_CNT[0] > in_CNT[2]) ? 1'd1 : 1'd0;
wire f0_3 = (in_CNT[0] > in_CNT[3]) ? 1'd1 : 1'd0;
wire f0_4 = (in_CNT[0] > in_CNT[4]) ? 1'd1 : 1'd0;
wire f0_5 = (in_CNT[0] > in_CNT[5]) ? 1'd1 : 1'd0;

wire [2:0] addr_0 = f0_1 + f0_2 + f0_3 + f0_4 + f0_5;

wire f1_0 = ~f0_1;
wire f1_2 = (in_CNT[1] > in_CNT[2]) ? 1'd1 : 1'd0;
wire f1_3 = (in_CNT[1] > in_CNT[3]) ? 1'd1 : 1'd0;
wire f1_4 = (in_CNT[1] > in_CNT[4]) ? 1'd1 : 1'd0;
wire f1_5 = (in_CNT[1] > in_CNT[5]) ? 1'd1 : 1'd0;

wire [2:0] addr_1 = f1_0 + f1_2 + f1_3 + f1_4 + f1_5;

wire f2_0 = ~f0_2;
wire f2_1 = ~f1_2;
wire f2_3 = (in_CNT[2] > in_CNT[3]) ? 1'd1 : 1'd0;
wire f2_4 = (in_CNT[2] > in_CNT[4]) ? 1'd1 : 1'd0;
wire f2_5 = (in_CNT[2] > in_CNT[5]) ? 1'd1 : 1'd0;

wire [2:0] addr_2 = f2_0 + f2_1 + f2_3 + f2_4 + f2_5;

wire f3_0 = ~f0_3;
wire f3_1 = ~f1_3;
wire f3_2 = ~f2_3;
wire f3_4 = (in_CNT[3] > in_CNT[4]) ? 1'd1 : 1'd0;
wire f3_5 = (in_CNT[3] > in_CNT[5]) ? 1'd1 : 1'd0;

wire [2:0] addr_3 = f3_0 + f3_1 + f3_2 + f3_4 + f3_5;

wire f4_0 = ~f0_4;
wire f4_1 = ~f1_4;
wire f4_2 = ~f2_4;
wire f4_3 = ~f3_4;
wire f4_5 = (in_CNT[4] > in_CNT[5]) ? 1'd1 : 1'd0;

wire [2:0] addr_4 = f4_0 + f4_1 + f4_2 + f4_3 + f4_5;

wire f5_0 = ~f0_5;
wire f5_1 = ~f1_5;
wire f5_2 = ~f2_5;
wire f5_3 = ~f3_5;
wire f5_4 = ~f4_5;

wire [2:0] addr_5 = f5_0 + f5_1 + f5_2 + f5_3 + f5_4;

always @(*) begin
    out_Aid[0] = 0;
    out_Aid[1] = 0;
    out_Aid[2] = 0;
    out_Aid[3] = 0;
    out_Aid[4] = 0;
    out_Aid[5] = 0;
    out_Aid[addr_0] = in_Aid[0];
    out_Aid[addr_1] = in_Aid[1];
    out_Aid[addr_2] = in_Aid[2];
    out_Aid[addr_3] = in_Aid[3];
    out_Aid[addr_4] = in_Aid[4];
    out_Aid[addr_5] = in_Aid[5];
end

always @(*) begin
    out_CNT[0] = 0;
    out_CNT[1] = 0;
    out_CNT[2] = 0;
    out_CNT[3] = 0;
    out_CNT[4] = 0;
    out_CNT[5] = 0;
    out_CNT[addr_0] = in_CNT[0];
    out_CNT[addr_1] = in_CNT[1];
    out_CNT[addr_2] = in_CNT[2];
    out_CNT[addr_3] = in_CNT[3];
    out_CNT[addr_4] = in_CNT[4];
    out_CNT[addr_5] = in_CNT[5];
end

always @(*) begin
    out_Aid_all = {out_Aid[5], out_Aid[4], out_Aid[3], out_Aid[2], out_Aid[1], out_Aid[0]};
    out_CNT_all = {out_CNT[5], out_CNT[4], out_CNT[3], out_CNT[2], out_CNT[1], out_CNT[0]};
end

endmodule