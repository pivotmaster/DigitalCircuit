/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R) NXT
// Version   : T-2022.03
// Date      : Wed Mar 27 23:10:47 2024
/////////////////////////////////////////////////////////////


module lcd_ctrl ( clk, reset, datain, cmd, cmd_valid, dataout, output_valid, 
        busy );
  input [7:0] datain;
  input [2:0] cmd;
  output [7:0] dataout;
  input clk, reset, cmd_valid;
  output output_valid, busy;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85,
         N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99,
         N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, N119, N120, N121,
         N122, N123, N124, N125, N126, N127, N128, N129,
         \image_buffer[0][0][7] , \image_buffer[0][0][6] ,
         \image_buffer[0][0][5] , \image_buffer[0][0][4] ,
         \image_buffer[0][0][3] , \image_buffer[0][0][2] ,
         \image_buffer[0][0][1] , \image_buffer[0][0][0] ,
         \image_buffer[0][1][7] , \image_buffer[0][1][6] ,
         \image_buffer[0][1][5] , \image_buffer[0][1][4] ,
         \image_buffer[0][1][3] , \image_buffer[0][1][2] ,
         \image_buffer[0][1][1] , \image_buffer[0][1][0] ,
         \image_buffer[0][2][7] , \image_buffer[0][2][6] ,
         \image_buffer[0][2][5] , \image_buffer[0][2][4] ,
         \image_buffer[0][2][3] , \image_buffer[0][2][2] ,
         \image_buffer[0][2][1] , \image_buffer[0][2][0] ,
         \image_buffer[0][3][7] , \image_buffer[0][3][6] ,
         \image_buffer[0][3][5] , \image_buffer[0][3][4] ,
         \image_buffer[0][3][3] , \image_buffer[0][3][2] ,
         \image_buffer[0][3][1] , \image_buffer[0][3][0] ,
         \image_buffer[0][4][7] , \image_buffer[0][4][6] ,
         \image_buffer[0][4][5] , \image_buffer[0][4][4] ,
         \image_buffer[0][4][3] , \image_buffer[0][4][2] ,
         \image_buffer[0][4][1] , \image_buffer[0][4][0] ,
         \image_buffer[1][0][7] , \image_buffer[1][0][6] ,
         \image_buffer[1][0][5] , \image_buffer[1][0][4] ,
         \image_buffer[1][0][3] , \image_buffer[1][0][2] ,
         \image_buffer[1][0][1] , \image_buffer[1][0][0] ,
         \image_buffer[1][1][7] , \image_buffer[1][1][6] ,
         \image_buffer[1][1][5] , \image_buffer[1][1][4] ,
         \image_buffer[1][1][3] , \image_buffer[1][1][2] ,
         \image_buffer[1][1][1] , \image_buffer[1][1][0] ,
         \image_buffer[1][2][7] , \image_buffer[1][2][6] ,
         \image_buffer[1][2][5] , \image_buffer[1][2][4] ,
         \image_buffer[1][2][3] , \image_buffer[1][2][2] ,
         \image_buffer[1][2][1] , \image_buffer[1][2][0] ,
         \image_buffer[1][3][7] , \image_buffer[1][3][6] ,
         \image_buffer[1][3][5] , \image_buffer[1][3][4] ,
         \image_buffer[1][3][3] , \image_buffer[1][3][2] ,
         \image_buffer[1][3][1] , \image_buffer[1][3][0] ,
         \image_buffer[1][4][7] , \image_buffer[1][4][6] ,
         \image_buffer[1][4][5] , \image_buffer[1][4][4] ,
         \image_buffer[1][4][3] , \image_buffer[1][4][2] ,
         \image_buffer[1][4][1] , \image_buffer[1][4][0] ,
         \image_buffer[2][0][7] , \image_buffer[2][0][6] ,
         \image_buffer[2][0][5] , \image_buffer[2][0][4] ,
         \image_buffer[2][0][3] , \image_buffer[2][0][2] ,
         \image_buffer[2][0][1] , \image_buffer[2][0][0] ,
         \image_buffer[2][1][7] , \image_buffer[2][1][6] ,
         \image_buffer[2][1][5] , \image_buffer[2][1][4] ,
         \image_buffer[2][1][3] , \image_buffer[2][1][2] ,
         \image_buffer[2][1][1] , \image_buffer[2][1][0] ,
         \image_buffer[2][2][7] , \image_buffer[2][2][6] ,
         \image_buffer[2][2][5] , \image_buffer[2][2][4] ,
         \image_buffer[2][2][3] , \image_buffer[2][2][2] ,
         \image_buffer[2][2][1] , \image_buffer[2][2][0] ,
         \image_buffer[2][3][7] , \image_buffer[2][3][6] ,
         \image_buffer[2][3][5] , \image_buffer[2][3][4] ,
         \image_buffer[2][3][3] , \image_buffer[2][3][2] ,
         \image_buffer[2][3][1] , \image_buffer[2][3][0] ,
         \image_buffer[2][4][7] , \image_buffer[2][4][6] ,
         \image_buffer[2][4][5] , \image_buffer[2][4][4] ,
         \image_buffer[2][4][3] , \image_buffer[2][4][2] ,
         \image_buffer[2][4][1] , \image_buffer[2][4][0] ,
         \image_buffer[3][0][7] , \image_buffer[3][0][6] ,
         \image_buffer[3][0][5] , \image_buffer[3][0][4] ,
         \image_buffer[3][0][3] , \image_buffer[3][0][2] ,
         \image_buffer[3][0][1] , \image_buffer[3][0][0] ,
         \image_buffer[3][1][7] , \image_buffer[3][1][6] ,
         \image_buffer[3][1][5] , \image_buffer[3][1][4] ,
         \image_buffer[3][1][3] , \image_buffer[3][1][2] ,
         \image_buffer[3][1][1] , \image_buffer[3][1][0] ,
         \image_buffer[3][2][7] , \image_buffer[3][2][6] ,
         \image_buffer[3][2][5] , \image_buffer[3][2][4] ,
         \image_buffer[3][2][3] , \image_buffer[3][2][2] ,
         \image_buffer[3][2][1] , \image_buffer[3][2][0] ,
         \image_buffer[3][3][7] , \image_buffer[3][3][6] ,
         \image_buffer[3][3][5] , \image_buffer[3][3][4] ,
         \image_buffer[3][3][3] , \image_buffer[3][3][2] ,
         \image_buffer[3][3][1] , \image_buffer[3][3][0] ,
         \image_buffer[3][4][7] , \image_buffer[3][4][6] ,
         \image_buffer[3][4][5] , \image_buffer[3][4][4] ,
         \image_buffer[3][4][3] , \image_buffer[3][4][2] ,
         \image_buffer[3][4][1] , \image_buffer[3][4][0] ,
         \image_buffer[4][0][7] , \image_buffer[4][0][6] ,
         \image_buffer[4][0][5] , \image_buffer[4][0][4] ,
         \image_buffer[4][0][3] , \image_buffer[4][0][2] ,
         \image_buffer[4][0][1] , \image_buffer[4][0][0] ,
         \image_buffer[4][1][7] , \image_buffer[4][1][6] ,
         \image_buffer[4][1][5] , \image_buffer[4][1][4] ,
         \image_buffer[4][1][3] , \image_buffer[4][1][2] ,
         \image_buffer[4][1][1] , \image_buffer[4][1][0] ,
         \image_buffer[4][2][7] , \image_buffer[4][2][6] ,
         \image_buffer[4][2][5] , \image_buffer[4][2][4] ,
         \image_buffer[4][2][3] , \image_buffer[4][2][2] ,
         \image_buffer[4][2][1] , \image_buffer[4][2][0] ,
         \image_buffer[4][3][7] , \image_buffer[4][3][6] ,
         \image_buffer[4][3][5] , \image_buffer[4][3][4] ,
         \image_buffer[4][3][3] , \image_buffer[4][3][2] ,
         \image_buffer[4][3][1] , \image_buffer[4][3][0] ,
         \image_buffer[4][4][7] , \image_buffer[4][4][6] ,
         \image_buffer[4][4][5] , \image_buffer[4][4][4] ,
         \image_buffer[4][4][3] , \image_buffer[4][4][2] ,
         \image_buffer[4][4][1] , \image_buffer[4][4][0] , N130, N131, N132,
         N133, N134, N135, N136, N137, N138, N139, N140, N141, N142, N143,
         N144, N145, N146, N147, N148, N149, N150, N151, N152, N153, N154,
         N155, N156, N157, N158, N159, N160, N161, N162, N163, N164, N165,
         N166, N167, N168, N169, N170, N171, N172, N173, N174, N175, N176,
         N177, N178, N179, N180, N181, N182, N183, N184, N185, N186, N187,
         N188, N189, N190, N191, N192, N193, N194, N195, N196, N197, N198,
         N199, N200, N201, N202, N203, N204, N205, N206, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N259, N260, N261, N262, N263, N264,
         N265, N266, N267, N268, N269, N270, N271, N272, N273, N274, N275,
         N276, N277, N278, N279, N280, N281, N282, N283, N284, N285, N286,
         N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N351, N352,
         N353, N354, N355, N356, N357, N358, N359, N360, N361, N362, N363,
         N364, N365, N366, N367, N368, N369, N370, N371, N372, N373, N374,
         N375, N376, N377, N378, N379, N380, N381, N382, N383, N384, N385;
  wire   [1:0] cs;
  wire   [1:0] ns;
  wire   [2:0] x_cnt;
  wire   [2:0] y_cnt;
  wire   [2:0] x;
  wire   [2:0] y;

  \**SEQGEN**  \cs_reg[1]  ( .clear(reset), .preset(1'b0), .next_state(ns[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(cs[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \cs_reg[0]  ( .clear(reset), .preset(1'b0), .next_state(ns[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(cs[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  GTECH_AND2 C15 ( .A(N71), .B(N321), .Z(N72) );
  GTECH_OR2 C17 ( .A(cs[1]), .B(N321), .Z(N73) );
  GTECH_OR2 C20 ( .A(N71), .B(cs[0]), .Z(N75) );
  GTECH_AND2 C22 ( .A(cs[1]), .B(cs[0]), .Z(N77) );
  \**SEQGEN**  \x_cnt_reg[2]  ( .clear(reset), .preset(1'b0), .next_state(N126), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_cnt[2]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N123)
         );
  \**SEQGEN**  \x_cnt_reg[1]  ( .clear(reset), .preset(1'b0), .next_state(N125), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_cnt[1]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N123)
         );
  \**SEQGEN**  \x_cnt_reg[0]  ( .clear(reset), .preset(1'b0), .next_state(N124), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_cnt[0]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N123)
         );
  \**SEQGEN**  \y_cnt_reg[2]  ( .clear(reset), .preset(1'b0), .next_state(N129), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y_cnt[2]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N123)
         );
  \**SEQGEN**  \y_cnt_reg[1]  ( .clear(reset), .preset(1'b0), .next_state(N128), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y_cnt[1]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N123)
         );
  \**SEQGEN**  \y_cnt_reg[0]  ( .clear(reset), .preset(1'b0), .next_state(N127), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y_cnt[0]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N123)
         );
  \**SEQGEN**  \image_buffer_reg[0][0][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][0][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N189) );
  \**SEQGEN**  \image_buffer_reg[0][0][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][0][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N189) );
  \**SEQGEN**  \image_buffer_reg[0][0][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][0][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N189) );
  \**SEQGEN**  \image_buffer_reg[0][0][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][0][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N189) );
  \**SEQGEN**  \image_buffer_reg[0][0][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][0][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N189) );
  \**SEQGEN**  \image_buffer_reg[0][0][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][0][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N189) );
  \**SEQGEN**  \image_buffer_reg[0][0][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][0][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N189) );
  \**SEQGEN**  \image_buffer_reg[0][0][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][0][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N189) );
  \**SEQGEN**  \image_buffer_reg[0][1][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][1][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N188) );
  \**SEQGEN**  \image_buffer_reg[0][1][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][1][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N188) );
  \**SEQGEN**  \image_buffer_reg[0][1][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][1][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N188) );
  \**SEQGEN**  \image_buffer_reg[0][1][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][1][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N188) );
  \**SEQGEN**  \image_buffer_reg[0][1][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][1][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N188) );
  \**SEQGEN**  \image_buffer_reg[0][1][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][1][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N188) );
  \**SEQGEN**  \image_buffer_reg[0][1][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][1][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N188) );
  \**SEQGEN**  \image_buffer_reg[0][1][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][1][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N188) );
  \**SEQGEN**  \image_buffer_reg[0][2][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][2][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N187) );
  \**SEQGEN**  \image_buffer_reg[0][2][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][2][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N187) );
  \**SEQGEN**  \image_buffer_reg[0][2][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][2][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N187) );
  \**SEQGEN**  \image_buffer_reg[0][2][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][2][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N187) );
  \**SEQGEN**  \image_buffer_reg[0][2][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][2][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N187) );
  \**SEQGEN**  \image_buffer_reg[0][2][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][2][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N187) );
  \**SEQGEN**  \image_buffer_reg[0][2][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][2][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N187) );
  \**SEQGEN**  \image_buffer_reg[0][2][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][2][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N187) );
  \**SEQGEN**  \image_buffer_reg[0][3][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][3][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N186) );
  \**SEQGEN**  \image_buffer_reg[0][3][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][3][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N186) );
  \**SEQGEN**  \image_buffer_reg[0][3][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][3][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N186) );
  \**SEQGEN**  \image_buffer_reg[0][3][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][3][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N186) );
  \**SEQGEN**  \image_buffer_reg[0][3][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][3][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N186) );
  \**SEQGEN**  \image_buffer_reg[0][3][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][3][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N186) );
  \**SEQGEN**  \image_buffer_reg[0][3][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][3][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N186) );
  \**SEQGEN**  \image_buffer_reg[0][3][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][3][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N186) );
  \**SEQGEN**  \image_buffer_reg[0][4][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][4][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N185) );
  \**SEQGEN**  \image_buffer_reg[0][4][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][4][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N185) );
  \**SEQGEN**  \image_buffer_reg[0][4][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][4][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N185) );
  \**SEQGEN**  \image_buffer_reg[0][4][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][4][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N185) );
  \**SEQGEN**  \image_buffer_reg[0][4][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][4][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N185) );
  \**SEQGEN**  \image_buffer_reg[0][4][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][4][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N185) );
  \**SEQGEN**  \image_buffer_reg[0][4][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][4][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N185) );
  \**SEQGEN**  \image_buffer_reg[0][4][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[0][4][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N185) );
  \**SEQGEN**  \image_buffer_reg[1][0][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][0][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N184) );
  \**SEQGEN**  \image_buffer_reg[1][0][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][0][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N184) );
  \**SEQGEN**  \image_buffer_reg[1][0][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][0][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N184) );
  \**SEQGEN**  \image_buffer_reg[1][0][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][0][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N184) );
  \**SEQGEN**  \image_buffer_reg[1][0][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][0][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N184) );
  \**SEQGEN**  \image_buffer_reg[1][0][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][0][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N184) );
  \**SEQGEN**  \image_buffer_reg[1][0][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][0][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N184) );
  \**SEQGEN**  \image_buffer_reg[1][0][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][0][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N184) );
  \**SEQGEN**  \image_buffer_reg[1][1][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][1][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N183) );
  \**SEQGEN**  \image_buffer_reg[1][1][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][1][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N183) );
  \**SEQGEN**  \image_buffer_reg[1][1][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][1][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N183) );
  \**SEQGEN**  \image_buffer_reg[1][1][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][1][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N183) );
  \**SEQGEN**  \image_buffer_reg[1][1][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][1][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N183) );
  \**SEQGEN**  \image_buffer_reg[1][1][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][1][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N183) );
  \**SEQGEN**  \image_buffer_reg[1][1][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][1][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N183) );
  \**SEQGEN**  \image_buffer_reg[1][1][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][1][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N183) );
  \**SEQGEN**  \image_buffer_reg[1][2][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][2][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N182) );
  \**SEQGEN**  \image_buffer_reg[1][2][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][2][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N182) );
  \**SEQGEN**  \image_buffer_reg[1][2][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][2][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N182) );
  \**SEQGEN**  \image_buffer_reg[1][2][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][2][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N182) );
  \**SEQGEN**  \image_buffer_reg[1][2][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][2][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N182) );
  \**SEQGEN**  \image_buffer_reg[1][2][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][2][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N182) );
  \**SEQGEN**  \image_buffer_reg[1][2][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][2][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N182) );
  \**SEQGEN**  \image_buffer_reg[1][2][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][2][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N182) );
  \**SEQGEN**  \image_buffer_reg[1][3][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][3][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N181) );
  \**SEQGEN**  \image_buffer_reg[1][3][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][3][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N181) );
  \**SEQGEN**  \image_buffer_reg[1][3][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][3][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N181) );
  \**SEQGEN**  \image_buffer_reg[1][3][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][3][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N181) );
  \**SEQGEN**  \image_buffer_reg[1][3][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][3][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N181) );
  \**SEQGEN**  \image_buffer_reg[1][3][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][3][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N181) );
  \**SEQGEN**  \image_buffer_reg[1][3][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][3][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N181) );
  \**SEQGEN**  \image_buffer_reg[1][3][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][3][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N181) );
  \**SEQGEN**  \image_buffer_reg[1][4][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][4][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N180) );
  \**SEQGEN**  \image_buffer_reg[1][4][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][4][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N180) );
  \**SEQGEN**  \image_buffer_reg[1][4][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][4][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N180) );
  \**SEQGEN**  \image_buffer_reg[1][4][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][4][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N180) );
  \**SEQGEN**  \image_buffer_reg[1][4][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][4][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N180) );
  \**SEQGEN**  \image_buffer_reg[1][4][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][4][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N180) );
  \**SEQGEN**  \image_buffer_reg[1][4][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][4][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N180) );
  \**SEQGEN**  \image_buffer_reg[1][4][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[1][4][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N180) );
  \**SEQGEN**  \image_buffer_reg[2][0][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][0][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N179) );
  \**SEQGEN**  \image_buffer_reg[2][0][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][0][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N179) );
  \**SEQGEN**  \image_buffer_reg[2][0][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][0][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N179) );
  \**SEQGEN**  \image_buffer_reg[2][0][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][0][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N179) );
  \**SEQGEN**  \image_buffer_reg[2][0][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][0][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N179) );
  \**SEQGEN**  \image_buffer_reg[2][0][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][0][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N179) );
  \**SEQGEN**  \image_buffer_reg[2][0][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][0][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N179) );
  \**SEQGEN**  \image_buffer_reg[2][0][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][0][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N179) );
  \**SEQGEN**  \image_buffer_reg[2][1][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][1][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N178) );
  \**SEQGEN**  \image_buffer_reg[2][1][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][1][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N178) );
  \**SEQGEN**  \image_buffer_reg[2][1][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][1][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N178) );
  \**SEQGEN**  \image_buffer_reg[2][1][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][1][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N178) );
  \**SEQGEN**  \image_buffer_reg[2][1][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][1][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N178) );
  \**SEQGEN**  \image_buffer_reg[2][1][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][1][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N178) );
  \**SEQGEN**  \image_buffer_reg[2][1][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][1][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N178) );
  \**SEQGEN**  \image_buffer_reg[2][1][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][1][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N178) );
  \**SEQGEN**  \image_buffer_reg[2][2][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][2][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N177) );
  \**SEQGEN**  \image_buffer_reg[2][2][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][2][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N177) );
  \**SEQGEN**  \image_buffer_reg[2][2][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][2][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N177) );
  \**SEQGEN**  \image_buffer_reg[2][2][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][2][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N177) );
  \**SEQGEN**  \image_buffer_reg[2][2][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][2][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N177) );
  \**SEQGEN**  \image_buffer_reg[2][2][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][2][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N177) );
  \**SEQGEN**  \image_buffer_reg[2][2][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][2][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N177) );
  \**SEQGEN**  \image_buffer_reg[2][2][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][2][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N177) );
  \**SEQGEN**  \image_buffer_reg[2][3][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][3][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N176) );
  \**SEQGEN**  \image_buffer_reg[2][3][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][3][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N176) );
  \**SEQGEN**  \image_buffer_reg[2][3][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][3][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N176) );
  \**SEQGEN**  \image_buffer_reg[2][3][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][3][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N176) );
  \**SEQGEN**  \image_buffer_reg[2][3][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][3][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N176) );
  \**SEQGEN**  \image_buffer_reg[2][3][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][3][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N176) );
  \**SEQGEN**  \image_buffer_reg[2][3][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][3][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N176) );
  \**SEQGEN**  \image_buffer_reg[2][3][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][3][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N176) );
  \**SEQGEN**  \image_buffer_reg[2][4][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][4][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N175) );
  \**SEQGEN**  \image_buffer_reg[2][4][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][4][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N175) );
  \**SEQGEN**  \image_buffer_reg[2][4][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][4][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N175) );
  \**SEQGEN**  \image_buffer_reg[2][4][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][4][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N175) );
  \**SEQGEN**  \image_buffer_reg[2][4][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][4][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N175) );
  \**SEQGEN**  \image_buffer_reg[2][4][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][4][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N175) );
  \**SEQGEN**  \image_buffer_reg[2][4][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][4][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N175) );
  \**SEQGEN**  \image_buffer_reg[2][4][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[2][4][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N175) );
  \**SEQGEN**  \image_buffer_reg[3][0][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][0][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N174) );
  \**SEQGEN**  \image_buffer_reg[3][0][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][0][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N174) );
  \**SEQGEN**  \image_buffer_reg[3][0][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][0][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N174) );
  \**SEQGEN**  \image_buffer_reg[3][0][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][0][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N174) );
  \**SEQGEN**  \image_buffer_reg[3][0][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][0][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N174) );
  \**SEQGEN**  \image_buffer_reg[3][0][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][0][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N174) );
  \**SEQGEN**  \image_buffer_reg[3][0][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][0][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N174) );
  \**SEQGEN**  \image_buffer_reg[3][0][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][0][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N174) );
  \**SEQGEN**  \image_buffer_reg[3][1][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][1][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N173) );
  \**SEQGEN**  \image_buffer_reg[3][1][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][1][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N173) );
  \**SEQGEN**  \image_buffer_reg[3][1][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][1][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N173) );
  \**SEQGEN**  \image_buffer_reg[3][1][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][1][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N173) );
  \**SEQGEN**  \image_buffer_reg[3][1][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][1][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N173) );
  \**SEQGEN**  \image_buffer_reg[3][1][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][1][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N173) );
  \**SEQGEN**  \image_buffer_reg[3][1][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][1][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N173) );
  \**SEQGEN**  \image_buffer_reg[3][1][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][1][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N173) );
  \**SEQGEN**  \image_buffer_reg[3][2][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][2][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N172) );
  \**SEQGEN**  \image_buffer_reg[3][2][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][2][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N172) );
  \**SEQGEN**  \image_buffer_reg[3][2][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][2][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N172) );
  \**SEQGEN**  \image_buffer_reg[3][2][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][2][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N172) );
  \**SEQGEN**  \image_buffer_reg[3][2][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][2][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N172) );
  \**SEQGEN**  \image_buffer_reg[3][2][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][2][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N172) );
  \**SEQGEN**  \image_buffer_reg[3][2][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][2][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N172) );
  \**SEQGEN**  \image_buffer_reg[3][2][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][2][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N172) );
  \**SEQGEN**  \image_buffer_reg[3][3][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][3][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N171) );
  \**SEQGEN**  \image_buffer_reg[3][3][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][3][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N171) );
  \**SEQGEN**  \image_buffer_reg[3][3][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][3][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N171) );
  \**SEQGEN**  \image_buffer_reg[3][3][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][3][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N171) );
  \**SEQGEN**  \image_buffer_reg[3][3][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][3][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N171) );
  \**SEQGEN**  \image_buffer_reg[3][3][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][3][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N171) );
  \**SEQGEN**  \image_buffer_reg[3][3][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][3][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N171) );
  \**SEQGEN**  \image_buffer_reg[3][3][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][3][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N171) );
  \**SEQGEN**  \image_buffer_reg[3][4][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][4][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N170) );
  \**SEQGEN**  \image_buffer_reg[3][4][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][4][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N170) );
  \**SEQGEN**  \image_buffer_reg[3][4][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][4][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N170) );
  \**SEQGEN**  \image_buffer_reg[3][4][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][4][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N170) );
  \**SEQGEN**  \image_buffer_reg[3][4][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][4][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N170) );
  \**SEQGEN**  \image_buffer_reg[3][4][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][4][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N170) );
  \**SEQGEN**  \image_buffer_reg[3][4][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][4][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N170) );
  \**SEQGEN**  \image_buffer_reg[3][4][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[3][4][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N170) );
  \**SEQGEN**  \image_buffer_reg[4][0][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][0][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N169) );
  \**SEQGEN**  \image_buffer_reg[4][0][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][0][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N169) );
  \**SEQGEN**  \image_buffer_reg[4][0][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][0][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N169) );
  \**SEQGEN**  \image_buffer_reg[4][0][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][0][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N169) );
  \**SEQGEN**  \image_buffer_reg[4][0][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][0][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N169) );
  \**SEQGEN**  \image_buffer_reg[4][0][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][0][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N169) );
  \**SEQGEN**  \image_buffer_reg[4][0][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][0][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N169) );
  \**SEQGEN**  \image_buffer_reg[4][0][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][0][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N169) );
  \**SEQGEN**  \image_buffer_reg[4][1][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][1][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N168) );
  \**SEQGEN**  \image_buffer_reg[4][1][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][1][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N168) );
  \**SEQGEN**  \image_buffer_reg[4][1][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][1][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N168) );
  \**SEQGEN**  \image_buffer_reg[4][1][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][1][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N168) );
  \**SEQGEN**  \image_buffer_reg[4][1][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][1][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N168) );
  \**SEQGEN**  \image_buffer_reg[4][1][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][1][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N168) );
  \**SEQGEN**  \image_buffer_reg[4][1][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][1][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N168) );
  \**SEQGEN**  \image_buffer_reg[4][1][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][1][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N168) );
  \**SEQGEN**  \image_buffer_reg[4][2][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][2][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N167) );
  \**SEQGEN**  \image_buffer_reg[4][2][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][2][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N167) );
  \**SEQGEN**  \image_buffer_reg[4][2][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][2][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N167) );
  \**SEQGEN**  \image_buffer_reg[4][2][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][2][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N167) );
  \**SEQGEN**  \image_buffer_reg[4][2][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][2][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N167) );
  \**SEQGEN**  \image_buffer_reg[4][2][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][2][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N167) );
  \**SEQGEN**  \image_buffer_reg[4][2][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][2][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N167) );
  \**SEQGEN**  \image_buffer_reg[4][2][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][2][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N167) );
  \**SEQGEN**  \image_buffer_reg[4][3][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][3][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N166) );
  \**SEQGEN**  \image_buffer_reg[4][3][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][3][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N166) );
  \**SEQGEN**  \image_buffer_reg[4][3][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][3][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N166) );
  \**SEQGEN**  \image_buffer_reg[4][3][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][3][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N166) );
  \**SEQGEN**  \image_buffer_reg[4][3][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][3][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N166) );
  \**SEQGEN**  \image_buffer_reg[4][3][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][3][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N166) );
  \**SEQGEN**  \image_buffer_reg[4][3][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][3][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N166) );
  \**SEQGEN**  \image_buffer_reg[4][3][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][3][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N166) );
  \**SEQGEN**  \image_buffer_reg[4][4][7]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][4][7] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N165) );
  \**SEQGEN**  \image_buffer_reg[4][4][6]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][4][6] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N165) );
  \**SEQGEN**  \image_buffer_reg[4][4][5]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][4][5] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N165) );
  \**SEQGEN**  \image_buffer_reg[4][4][4]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][4][4] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N165) );
  \**SEQGEN**  \image_buffer_reg[4][4][3]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][4][3] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N165) );
  \**SEQGEN**  \image_buffer_reg[4][4][2]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][4][2] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N165) );
  \**SEQGEN**  \image_buffer_reg[4][4][1]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][4][1] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N165) );
  \**SEQGEN**  \image_buffer_reg[4][4][0]  ( .clear(reset), .preset(1'b0), 
        .next_state(datain[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(\image_buffer[4][4][0] ), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N165) );
  \**SEQGEN**  busy_reg ( .clear(reset), .preset(1'b0), .next_state(N193), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(busy), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  output_valid_reg ( .clear(reset), .preset(1'b0), .next_state(
        N318), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        output_valid), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  GTECH_AND2 C1038 ( .A(N198), .B(N199), .Z(N201) );
  GTECH_AND2 C1039 ( .A(N201), .B(N200), .Z(N202) );
  GTECH_OR2 C1041 ( .A(cmd[2]), .B(cmd[1]), .Z(N203) );
  GTECH_OR2 C1042 ( .A(N203), .B(N200), .Z(N204) );
  GTECH_OR2 C1045 ( .A(cmd[2]), .B(N199), .Z(N206) );
  GTECH_OR2 C1046 ( .A(N206), .B(cmd[0]), .Z(N207) );
  GTECH_OR2 C1051 ( .A(N206), .B(N200), .Z(N209) );
  GTECH_OR2 C1054 ( .A(N198), .B(cmd[1]), .Z(N211) );
  GTECH_OR2 C1055 ( .A(N211), .B(cmd[0]), .Z(N212) );
  GTECH_AND2 C1057 ( .A(cmd[2]), .B(cmd[0]), .Z(N214) );
  GTECH_AND2 C1058 ( .A(cmd[2]), .B(cmd[1]), .Z(N215) );
  \**SEQGEN**  \x_reg[2]  ( .clear(reset), .preset(1'b0), .next_state(N241), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N315) );
  \**SEQGEN**  \x_reg[1]  ( .clear(reset), .preset(1'b0), .next_state(N240), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N315) );
  \**SEQGEN**  \x_reg[0]  ( .clear(reset), .preset(1'b0), .next_state(N239), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N315) );
  \**SEQGEN**  \y_reg[2]  ( .clear(reset), .preset(1'b0), .next_state(N245), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N246) );
  \**SEQGEN**  \y_reg[1]  ( .clear(reset), .preset(1'b0), .next_state(N244), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N246) );
  \**SEQGEN**  \y_reg[0]  ( .clear(reset), .preset(1'b0), .next_state(N243), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N246) );
  \**SEQGEN**  \dataout_reg[7]  ( .clear(reset), .preset(1'b0), .next_state(
        N304), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(dataout[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N349) );
  \**SEQGEN**  \dataout_reg[6]  ( .clear(reset), .preset(1'b0), .next_state(
        N305), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(dataout[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N349) );
  \**SEQGEN**  \dataout_reg[5]  ( .clear(reset), .preset(1'b0), .next_state(
        N306), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(dataout[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N349) );
  \**SEQGEN**  \dataout_reg[4]  ( .clear(reset), .preset(1'b0), .next_state(
        N307), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(dataout[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N349) );
  \**SEQGEN**  \dataout_reg[3]  ( .clear(reset), .preset(1'b0), .next_state(
        N308), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(dataout[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N349) );
  \**SEQGEN**  \dataout_reg[2]  ( .clear(reset), .preset(1'b0), .next_state(
        N309), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(dataout[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N349) );
  \**SEQGEN**  \dataout_reg[1]  ( .clear(reset), .preset(1'b0), .next_state(
        N310), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(dataout[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N349) );
  \**SEQGEN**  \dataout_reg[0]  ( .clear(reset), .preset(1'b0), .next_state(
        N311), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(dataout[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N349) );
  GTECH_OR2 C1269 ( .A(cs[0]), .B(cs[1]), .Z(N316) );
  GTECH_NOT I_0 ( .A(N316), .Z(N317) );
  GTECH_AND2 C1271 ( .A(cs[0]), .B(cs[1]), .Z(N318) );
  GTECH_OR2 C1272 ( .A(cs[0]), .B(cs[1]), .Z(N319) );
  GTECH_NOT I_1 ( .A(N319), .Z(N320) );
  GTECH_NOT I_2 ( .A(cs[0]), .Z(N321) );
  GTECH_OR2 C1275 ( .A(N321), .B(cs[1]), .Z(N322) );
  GTECH_NOT I_3 ( .A(N322), .Z(N323) );
  GTECH_OR2 C1278 ( .A(N321), .B(cs[1]), .Z(N324) );
  GTECH_NOT I_4 ( .A(N324), .Z(N325) );
  GTECH_AND2 C1280 ( .A(ns[0]), .B(ns[1]), .Z(N326) );
  GTECH_NOT I_5 ( .A(y_cnt[2]), .Z(N327) );
  GTECH_OR2 C1282 ( .A(y_cnt[1]), .B(N327), .Z(N328) );
  GTECH_OR2 C1283 ( .A(y_cnt[0]), .B(N328), .Z(N329) );
  GTECH_NOT I_6 ( .A(N329), .Z(N330) );
  GTECH_NOT I_7 ( .A(y_cnt[1]), .Z(N331) );
  GTECH_OR2 C1286 ( .A(N331), .B(y_cnt[2]), .Z(N332) );
  GTECH_OR2 C1287 ( .A(y_cnt[0]), .B(N332), .Z(N333) );
  GTECH_NOT I_8 ( .A(N333), .Z(N334) );
  GTECH_NOT I_9 ( .A(x[1]), .Z(N335) );
  GTECH_OR2 C1290 ( .A(N335), .B(x[2]), .Z(N336) );
  GTECH_OR2 C1291 ( .A(x[0]), .B(N336), .Z(N337) );
  GTECH_NOT I_10 ( .A(N337), .Z(N338) );
  GTECH_OR2 C1293 ( .A(x[1]), .B(x[2]), .Z(N339) );
  GTECH_OR2 C1294 ( .A(x[0]), .B(N339), .Z(N340) );
  GTECH_NOT I_11 ( .A(N340), .Z(N341) );
  GTECH_OR2 C1296 ( .A(y[1]), .B(y[2]), .Z(N342) );
  GTECH_OR2 C1297 ( .A(y[0]), .B(N342), .Z(N343) );
  GTECH_NOT I_12 ( .A(N343), .Z(N344) );
  GTECH_NOT I_13 ( .A(y[1]), .Z(N345) );
  GTECH_OR2 C1300 ( .A(N345), .B(y[2]), .Z(N346) );
  GTECH_OR2 C1301 ( .A(y[0]), .B(N346), .Z(N347) );
  GTECH_NOT I_14 ( .A(N347), .Z(N348) );
  GTECH_AND2 C1303 ( .A(cs[0]), .B(cs[1]), .Z(N349) );
  GTECH_NOT I_15 ( .A(x_cnt[2]), .Z(N350) );
  GTECH_OR2 C1305 ( .A(x_cnt[1]), .B(N350), .Z(N351) );
  GTECH_OR2 C1306 ( .A(x_cnt[0]), .B(N351), .Z(N352) );
  GTECH_NOT I_16 ( .A(N352), .Z(N353) );
  GTECH_NOT I_17 ( .A(x_cnt[1]), .Z(N354) );
  GTECH_OR2 C1309 ( .A(N354), .B(x_cnt[2]), .Z(N355) );
  GTECH_OR2 C1310 ( .A(x_cnt[0]), .B(N355), .Z(N356) );
  GTECH_NOT I_18 ( .A(N356), .Z(N357) );
  GTECH_OR2 C1312 ( .A(cmd[1]), .B(cmd[2]), .Z(N358) );
  GTECH_OR2 C1313 ( .A(cmd[0]), .B(N358), .Z(N359) );
  GTECH_OR2 C1316 ( .A(x_cnt[1]), .B(N350), .Z(N360) );
  GTECH_OR2 C1317 ( .A(x_cnt[0]), .B(N360), .Z(N361) );
  GTECH_NOT I_19 ( .A(N361), .Z(N362) );
  GTECH_OR2 C1320 ( .A(y_cnt[1]), .B(N327), .Z(N363) );
  GTECH_OR2 C1321 ( .A(y_cnt[0]), .B(N363), .Z(N364) );
  GTECH_NOT I_20 ( .A(N364), .Z(N365) );
  GTECH_OR2 C1324 ( .A(N354), .B(x_cnt[2]), .Z(N366) );
  GTECH_OR2 C1325 ( .A(x_cnt[0]), .B(N366), .Z(N367) );
  GTECH_NOT I_21 ( .A(N367), .Z(N368) );
  GTECH_OR2 C1328 ( .A(N331), .B(y_cnt[2]), .Z(N369) );
  GTECH_OR2 C1329 ( .A(y_cnt[0]), .B(N369), .Z(N370) );
  GTECH_NOT I_22 ( .A(N370), .Z(N371) );
  GTECH_OR2 C1332 ( .A(N321), .B(cs[1]), .Z(N372) );
  GTECH_NOT I_23 ( .A(N372), .Z(N373) );
  GTECH_AND2 C1334 ( .A(cs[0]), .B(cs[1]), .Z(N374) );
  ADD_UNS_OP add_206 ( .A(x), .B(x_cnt), .Z({N255, N251, N250}) );
  ADD_UNS_OP add_206_2 ( .A(y), .B(y_cnt), .Z({N300, N253, N252}) );
  SUB_UNS_OP sub_174_aco ( .A(x), .B(N340), .Z({N225, N224, N223}) );
  SUB_UNS_OP sub_182_aco ( .A(y), .B(N343), .Z({N230, N229, N228}) );
  ADD_UNS_OP add_85 ( .A(x_cnt), .B(1'b1), .Z({N99, N98, N97}) );
  ADD_UNS_OP add_98 ( .A(x_cnt), .B(1'b1), .Z({N116, N115, N114}) );
  ADD_UNS_OP add_82 ( .A(y_cnt), .B(1'b1), .Z({N93, N92, N91}) );
  ADD_UNS_OP add_95 ( .A(y_cnt), .B(1'b1), .Z({N110, N109, N108}) );
  ADD_UNS_OP add_166 ( .A(x), .B(1'b1), .Z({N220, N219, N218}) );
  ADD_UNS_OP add_190 ( .A(y), .B(1'b1), .Z({N234, N233, N232}) );
  GTECH_AND2 C1389 ( .A(N0), .B(N1), .Z(N375) );
  GTECH_NOT I_24 ( .A(y_cnt[0]), .Z(N0) );
  GTECH_NOT I_25 ( .A(y_cnt[1]), .Z(N1) );
  GTECH_AND2 C1390 ( .A(N375), .B(y_cnt[2]), .Z(N134) );
  GTECH_AND2 C1391 ( .A(y_cnt[0]), .B(y_cnt[1]), .Z(N376) );
  GTECH_AND2 C1392 ( .A(N376), .B(N2), .Z(N133) );
  GTECH_NOT I_26 ( .A(y_cnt[2]), .Z(N2) );
  GTECH_AND2 C1393 ( .A(N3), .B(y_cnt[1]), .Z(N377) );
  GTECH_NOT I_27 ( .A(y_cnt[0]), .Z(N3) );
  GTECH_AND2 C1394 ( .A(N377), .B(N4), .Z(N132) );
  GTECH_NOT I_28 ( .A(y_cnt[2]), .Z(N4) );
  GTECH_AND2 C1395 ( .A(y_cnt[0]), .B(N5), .Z(N378) );
  GTECH_NOT I_29 ( .A(y_cnt[1]), .Z(N5) );
  GTECH_AND2 C1396 ( .A(N378), .B(N6), .Z(N131) );
  GTECH_NOT I_30 ( .A(y_cnt[2]), .Z(N6) );
  GTECH_AND2 C1397 ( .A(N7), .B(N8), .Z(N379) );
  GTECH_NOT I_31 ( .A(y_cnt[0]), .Z(N7) );
  GTECH_NOT I_32 ( .A(y_cnt[1]), .Z(N8) );
  GTECH_AND2 C1398 ( .A(N379), .B(N9), .Z(N130) );
  GTECH_NOT I_33 ( .A(y_cnt[2]), .Z(N9) );
  GTECH_AND2 C1405 ( .A(N10), .B(N11), .Z(N380) );
  GTECH_NOT I_34 ( .A(x_cnt[0]), .Z(N10) );
  GTECH_NOT I_35 ( .A(x_cnt[1]), .Z(N11) );
  GTECH_AND2 C1406 ( .A(N380), .B(x_cnt[2]), .Z(N139) );
  GTECH_AND2 C1407 ( .A(x_cnt[0]), .B(x_cnt[1]), .Z(N381) );
  GTECH_AND2 C1408 ( .A(N381), .B(N12), .Z(N138) );
  GTECH_NOT I_36 ( .A(x_cnt[2]), .Z(N12) );
  GTECH_AND2 C1409 ( .A(N13), .B(x_cnt[1]), .Z(N382) );
  GTECH_NOT I_37 ( .A(x_cnt[0]), .Z(N13) );
  GTECH_AND2 C1410 ( .A(N382), .B(N14), .Z(N137) );
  GTECH_NOT I_38 ( .A(x_cnt[2]), .Z(N14) );
  GTECH_AND2 C1411 ( .A(x_cnt[0]), .B(N15), .Z(N383) );
  GTECH_NOT I_39 ( .A(x_cnt[1]), .Z(N15) );
  GTECH_AND2 C1412 ( .A(N383), .B(N16), .Z(N136) );
  GTECH_NOT I_40 ( .A(x_cnt[2]), .Z(N16) );
  GTECH_AND2 C1413 ( .A(N17), .B(N18), .Z(N384) );
  GTECH_NOT I_41 ( .A(x_cnt[0]), .Z(N17) );
  GTECH_NOT I_42 ( .A(x_cnt[1]), .Z(N18) );
  GTECH_AND2 C1414 ( .A(N384), .B(N19), .Z(N135) );
  GTECH_NOT I_43 ( .A(x_cnt[2]), .Z(N19) );
  GTECH_AND3 C1415 ( .A(N20), .B(N21), .C(N22), .Z(N254) );
  GTECH_NOT I_44 ( .A(N255), .Z(N20) );
  GTECH_NOT I_45 ( .A(N250), .Z(N21) );
  GTECH_NOT I_46 ( .A(N251), .Z(N22) );
  GTECH_AND2 C1416 ( .A(N250), .B(N23), .Z(N256) );
  GTECH_NOT I_47 ( .A(N251), .Z(N23) );
  GTECH_AND2 C1417 ( .A(N24), .B(N251), .Z(N257) );
  GTECH_NOT I_48 ( .A(N250), .Z(N24) );
  GTECH_AND2 C1418 ( .A(N250), .B(N251), .Z(N258) );
  GTECH_AND3 C1422 ( .A(N25), .B(N26), .C(N27), .Z(N299) );
  GTECH_NOT I_49 ( .A(N300), .Z(N25) );
  GTECH_NOT I_50 ( .A(N252), .Z(N26) );
  GTECH_NOT I_51 ( .A(N253), .Z(N27) );
  GTECH_AND2 C1423 ( .A(N252), .B(N28), .Z(N301) );
  GTECH_NOT I_52 ( .A(N253), .Z(N28) );
  GTECH_AND2 C1424 ( .A(N29), .B(N253), .Z(N302) );
  GTECH_NOT I_53 ( .A(N252), .Z(N29) );
  GTECH_AND2 C1425 ( .A(N252), .B(N253), .Z(N303) );
  SELECT_OP C1430 ( .DATA1({N359, 1'b1}), .DATA2(cs), .CONTROL1(N30), 
        .CONTROL2(N31), .Z({N79, N78}) );
  GTECH_BUF B_0 ( .A(cmd_valid), .Z(N30) );
  GTECH_BUF B_1 ( .A(N196), .Z(N31) );
  SELECT_OP C1431 ( .DATA1({1'b1, 1'b1}), .DATA2(cs), .CONTROL1(N32), 
        .CONTROL2(N81), .Z({N83, N82}) );
  GTECH_BUF B_2 ( .A(N80), .Z(N32) );
  SELECT_OP C1432 ( .DATA1({1'b0, 1'b0}), .DATA2(cs), .CONTROL1(N33), 
        .CONTROL2(N85), .Z({N87, N86}) );
  GTECH_BUF B_3 ( .A(N84), .Z(N33) );
  SELECT_OP C1433 ( .DATA1({N79, N78}), .DATA2({N83, N82}), .DATA3({1'b0, 1'b0}), .DATA4({N87, N86}), .CONTROL1(N34), .CONTROL2(N35), .CONTROL3(N36), 
        .CONTROL4(N37), .Z(ns) );
  GTECH_BUF B_4 ( .A(N72), .Z(N34) );
  GTECH_BUF B_5 ( .A(N74), .Z(N35) );
  GTECH_BUF B_6 ( .A(N76), .Z(N36) );
  GTECH_BUF B_7 ( .A(N77), .Z(N37) );
  SELECT_OP C1434 ( .DATA1({1'b0, 1'b0, 1'b0}), .DATA2({N93, N92, N91}), 
        .CONTROL1(N38), .CONTROL2(N39), .Z({N96, N95, N94}) );
  GTECH_BUF B_8 ( .A(N330), .Z(N38) );
  GTECH_BUF B_9 ( .A(N329), .Z(N39) );
  SELECT_OP C1435 ( .DATA1({N96, N95, N94}), .DATA2(y_cnt), .CONTROL1(N40), 
        .CONTROL2(N41), .Z({N102, N101, N100}) );
  GTECH_BUF B_10 ( .A(N353), .Z(N40) );
  GTECH_BUF B_11 ( .A(N352), .Z(N41) );
  SELECT_OP C1436 ( .DATA1({1'b0, 1'b0, 1'b0}), .DATA2({N99, N98, N97}), 
        .CONTROL1(N40), .CONTROL2(N41), .Z({N105, N104, N103}) );
  SELECT_OP C1437 ( .DATA1({1'b0, 1'b0, 1'b0}), .DATA2({N110, N109, N108}), 
        .CONTROL1(N42), .CONTROL2(N43), .Z({N113, N112, N111}) );
  GTECH_BUF B_12 ( .A(N334), .Z(N42) );
  GTECH_BUF B_13 ( .A(N333), .Z(N43) );
  SELECT_OP C1438 ( .DATA1({N113, N112, N111}), .DATA2(y_cnt), .CONTROL1(N44), 
        .CONTROL2(N45), .Z({N119, N118, N117}) );
  GTECH_BUF B_14 ( .A(N357), .Z(N44) );
  GTECH_BUF B_15 ( .A(N356), .Z(N45) );
  SELECT_OP C1439 ( .DATA1({1'b0, 1'b0, 1'b0}), .DATA2({N116, N115, N114}), 
        .CONTROL1(N44), .CONTROL2(N45), .Z({N122, N121, N120}) );
  SELECT_OP C1440 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b0), 
        .CONTROL1(N46), .CONTROL2(N47), .CONTROL3(N48), .CONTROL4(N49), .Z(
        N123) );
  GTECH_BUF B_16 ( .A(N373), .Z(N46) );
  GTECH_BUF B_17 ( .A(N374), .Z(N47) );
  GTECH_BUF B_18 ( .A(N317), .Z(N48) );
  GTECH_BUF B_19 ( .A(N88), .Z(N49) );
  SELECT_OP C1441 ( .DATA1({N105, N104, N103}), .DATA2({N122, N121, N120}), 
        .DATA3({1'b0, 1'b0, 1'b0}), .CONTROL1(N46), .CONTROL2(N47), .CONTROL3(
        N48), .Z({N126, N125, N124}) );
  SELECT_OP C1442 ( .DATA1({N102, N101, N100}), .DATA2({N119, N118, N117}), 
        .DATA3({1'b0, 1'b0, 1'b0}), .CONTROL1(N46), .CONTROL2(N47), .CONTROL3(
        N48), .Z({N129, N128, N127}) );
  SELECT_OP C1443 ( .DATA1({N140, N141, N142, N143, N144, N145, N146, N147, 
        N148, N149, N150, N151, N152, N153, N154, N155, N156, N157, N158, N159, 
        N160, N161, N162, N163, N164}), .DATA2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N50), 
        .CONTROL2(N51), .Z({N189, N188, N187, N186, N185, N184, N183, N182, 
        N181, N180, N179, N178, N177, N176, N175, N174, N173, N172, N171, N170, 
        N169, N168, N167, N166, N165}) );
  GTECH_BUF B_20 ( .A(N323), .Z(N50) );
  GTECH_BUF B_21 ( .A(N322), .Z(N51) );
  SELECT_OP C1444 ( .DATA1(1'b1), .DATA2(1'b0), .DATA3(busy), .CONTROL1(N52), 
        .CONTROL2(N195), .CONTROL3(N192), .Z(N193) );
  GTECH_BUF B_22 ( .A(N190), .Z(N52) );
  SELECT_OP C1447 ( .DATA1(y), .DATA2({N234, N233, N232}), .CONTROL1(N53), 
        .CONTROL2(N54), .Z({N237, N236, N235}) );
  GTECH_BUF B_23 ( .A(N348), .Z(N53) );
  GTECH_BUF B_24 ( .A(N347), .Z(N54) );
  SELECT_OP C1448 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b1), .CONTROL1(N55), .CONTROL2(N56), .CONTROL3(
        N57), .CONTROL4(N58), .CONTROL5(N59), .CONTROL6(N60), .Z(N238) );
  GTECH_BUF B_25 ( .A(N202), .Z(N55) );
  GTECH_BUF B_26 ( .A(N205), .Z(N56) );
  GTECH_BUF B_27 ( .A(N208), .Z(N57) );
  GTECH_BUF B_28 ( .A(N210), .Z(N58) );
  GTECH_BUF B_29 ( .A(N213), .Z(N59) );
  GTECH_BUF B_30 ( .A(N216), .Z(N60) );
  SELECT_OP C1449 ( .DATA1({1'b0, 1'b0, 1'b1}), .DATA2({N220, N219, N218}), 
        .DATA3({N225, N224, N223}), .DATA4({1'b0, 1'b0, 1'b0}), .CONTROL1(N55), 
        .CONTROL2(N56), .CONTROL3(N57), .CONTROL4(N60), .Z({N241, N240, N239})
         );
  SELECT_OP C1450 ( .DATA1(1'b1), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b1), 
        .DATA5(1'b1), .DATA6(1'b1), .CONTROL1(N55), .CONTROL2(N56), .CONTROL3(
        N57), .CONTROL4(N58), .CONTROL5(N59), .CONTROL6(N60), .Z(N242) );
  SELECT_OP C1451 ( .DATA1({1'b0, 1'b0, 1'b1}), .DATA2({N230, N229, N228}), 
        .DATA3({N237, N236, N235}), .DATA4({1'b0, 1'b0, 1'b0}), .CONTROL1(N55), 
        .CONTROL2(N58), .CONTROL3(N59), .CONTROL4(N60), .Z({N245, N244, N243})
         );
  SELECT_OP C1452 ( .DATA1(N242), .DATA2(1'b0), .CONTROL1(N30), .CONTROL2(N31), 
        .Z(N246) );
  SELECT_OP C1453 ( .DATA1(N238), .DATA2(1'b0), .CONTROL1(N30), .CONTROL2(N31), 
        .Z(N247) );
  SELECT_OP C1454 ( .DATA1(\image_buffer[0][0][7] ), .DATA2(
        \image_buffer[1][0][7] ), .DATA3(\image_buffer[2][0][7] ), .DATA4(
        \image_buffer[3][0][7] ), .DATA5(\image_buffer[4][0][7] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N259) );
  GTECH_BUF B_31 ( .A(N254), .Z(N61) );
  GTECH_BUF B_32 ( .A(N256), .Z(N62) );
  GTECH_BUF B_33 ( .A(N257), .Z(N63) );
  GTECH_BUF B_34 ( .A(N258), .Z(N64) );
  GTECH_BUF B_35 ( .A(N255), .Z(N65) );
  SELECT_OP C1455 ( .DATA1(\image_buffer[0][0][6] ), .DATA2(
        \image_buffer[1][0][6] ), .DATA3(\image_buffer[2][0][6] ), .DATA4(
        \image_buffer[3][0][6] ), .DATA5(\image_buffer[4][0][6] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N260) );
  SELECT_OP C1456 ( .DATA1(\image_buffer[0][0][5] ), .DATA2(
        \image_buffer[1][0][5] ), .DATA3(\image_buffer[2][0][5] ), .DATA4(
        \image_buffer[3][0][5] ), .DATA5(\image_buffer[4][0][5] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N261) );
  SELECT_OP C1457 ( .DATA1(\image_buffer[0][0][4] ), .DATA2(
        \image_buffer[1][0][4] ), .DATA3(\image_buffer[2][0][4] ), .DATA4(
        \image_buffer[3][0][4] ), .DATA5(\image_buffer[4][0][4] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N262) );
  SELECT_OP C1458 ( .DATA1(\image_buffer[0][0][3] ), .DATA2(
        \image_buffer[1][0][3] ), .DATA3(\image_buffer[2][0][3] ), .DATA4(
        \image_buffer[3][0][3] ), .DATA5(\image_buffer[4][0][3] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N263) );
  SELECT_OP C1459 ( .DATA1(\image_buffer[0][0][2] ), .DATA2(
        \image_buffer[1][0][2] ), .DATA3(\image_buffer[2][0][2] ), .DATA4(
        \image_buffer[3][0][2] ), .DATA5(\image_buffer[4][0][2] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N264) );
  SELECT_OP C1460 ( .DATA1(\image_buffer[0][0][1] ), .DATA2(
        \image_buffer[1][0][1] ), .DATA3(\image_buffer[2][0][1] ), .DATA4(
        \image_buffer[3][0][1] ), .DATA5(\image_buffer[4][0][1] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N265) );
  SELECT_OP C1461 ( .DATA1(\image_buffer[0][0][0] ), .DATA2(
        \image_buffer[1][0][0] ), .DATA3(\image_buffer[2][0][0] ), .DATA4(
        \image_buffer[3][0][0] ), .DATA5(\image_buffer[4][0][0] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N266) );
  SELECT_OP C1462 ( .DATA1(\image_buffer[0][1][7] ), .DATA2(
        \image_buffer[1][1][7] ), .DATA3(\image_buffer[2][1][7] ), .DATA4(
        \image_buffer[3][1][7] ), .DATA5(\image_buffer[4][1][7] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N267) );
  SELECT_OP C1463 ( .DATA1(\image_buffer[0][1][6] ), .DATA2(
        \image_buffer[1][1][6] ), .DATA3(\image_buffer[2][1][6] ), .DATA4(
        \image_buffer[3][1][6] ), .DATA5(\image_buffer[4][1][6] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N268) );
  SELECT_OP C1464 ( .DATA1(\image_buffer[0][1][5] ), .DATA2(
        \image_buffer[1][1][5] ), .DATA3(\image_buffer[2][1][5] ), .DATA4(
        \image_buffer[3][1][5] ), .DATA5(\image_buffer[4][1][5] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N269) );
  SELECT_OP C1465 ( .DATA1(\image_buffer[0][1][4] ), .DATA2(
        \image_buffer[1][1][4] ), .DATA3(\image_buffer[2][1][4] ), .DATA4(
        \image_buffer[3][1][4] ), .DATA5(\image_buffer[4][1][4] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N270) );
  SELECT_OP C1466 ( .DATA1(\image_buffer[0][1][3] ), .DATA2(
        \image_buffer[1][1][3] ), .DATA3(\image_buffer[2][1][3] ), .DATA4(
        \image_buffer[3][1][3] ), .DATA5(\image_buffer[4][1][3] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N271) );
  SELECT_OP C1467 ( .DATA1(\image_buffer[0][1][2] ), .DATA2(
        \image_buffer[1][1][2] ), .DATA3(\image_buffer[2][1][2] ), .DATA4(
        \image_buffer[3][1][2] ), .DATA5(\image_buffer[4][1][2] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N272) );
  SELECT_OP C1468 ( .DATA1(\image_buffer[0][1][1] ), .DATA2(
        \image_buffer[1][1][1] ), .DATA3(\image_buffer[2][1][1] ), .DATA4(
        \image_buffer[3][1][1] ), .DATA5(\image_buffer[4][1][1] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N273) );
  SELECT_OP C1469 ( .DATA1(\image_buffer[0][1][0] ), .DATA2(
        \image_buffer[1][1][0] ), .DATA3(\image_buffer[2][1][0] ), .DATA4(
        \image_buffer[3][1][0] ), .DATA5(\image_buffer[4][1][0] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N274) );
  SELECT_OP C1470 ( .DATA1(\image_buffer[0][2][7] ), .DATA2(
        \image_buffer[1][2][7] ), .DATA3(\image_buffer[2][2][7] ), .DATA4(
        \image_buffer[3][2][7] ), .DATA5(\image_buffer[4][2][7] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N275) );
  SELECT_OP C1471 ( .DATA1(\image_buffer[0][2][6] ), .DATA2(
        \image_buffer[1][2][6] ), .DATA3(\image_buffer[2][2][6] ), .DATA4(
        \image_buffer[3][2][6] ), .DATA5(\image_buffer[4][2][6] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N276) );
  SELECT_OP C1472 ( .DATA1(\image_buffer[0][2][5] ), .DATA2(
        \image_buffer[1][2][5] ), .DATA3(\image_buffer[2][2][5] ), .DATA4(
        \image_buffer[3][2][5] ), .DATA5(\image_buffer[4][2][5] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N277) );
  SELECT_OP C1473 ( .DATA1(\image_buffer[0][2][4] ), .DATA2(
        \image_buffer[1][2][4] ), .DATA3(\image_buffer[2][2][4] ), .DATA4(
        \image_buffer[3][2][4] ), .DATA5(\image_buffer[4][2][4] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N278) );
  SELECT_OP C1474 ( .DATA1(\image_buffer[0][2][3] ), .DATA2(
        \image_buffer[1][2][3] ), .DATA3(\image_buffer[2][2][3] ), .DATA4(
        \image_buffer[3][2][3] ), .DATA5(\image_buffer[4][2][3] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N279) );
  SELECT_OP C1475 ( .DATA1(\image_buffer[0][2][2] ), .DATA2(
        \image_buffer[1][2][2] ), .DATA3(\image_buffer[2][2][2] ), .DATA4(
        \image_buffer[3][2][2] ), .DATA5(\image_buffer[4][2][2] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N280) );
  SELECT_OP C1476 ( .DATA1(\image_buffer[0][2][1] ), .DATA2(
        \image_buffer[1][2][1] ), .DATA3(\image_buffer[2][2][1] ), .DATA4(
        \image_buffer[3][2][1] ), .DATA5(\image_buffer[4][2][1] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N281) );
  SELECT_OP C1477 ( .DATA1(\image_buffer[0][2][0] ), .DATA2(
        \image_buffer[1][2][0] ), .DATA3(\image_buffer[2][2][0] ), .DATA4(
        \image_buffer[3][2][0] ), .DATA5(\image_buffer[4][2][0] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N282) );
  SELECT_OP C1478 ( .DATA1(\image_buffer[0][3][7] ), .DATA2(
        \image_buffer[1][3][7] ), .DATA3(\image_buffer[2][3][7] ), .DATA4(
        \image_buffer[3][3][7] ), .DATA5(\image_buffer[4][3][7] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N283) );
  SELECT_OP C1479 ( .DATA1(\image_buffer[0][3][6] ), .DATA2(
        \image_buffer[1][3][6] ), .DATA3(\image_buffer[2][3][6] ), .DATA4(
        \image_buffer[3][3][6] ), .DATA5(\image_buffer[4][3][6] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N284) );
  SELECT_OP C1480 ( .DATA1(\image_buffer[0][3][5] ), .DATA2(
        \image_buffer[1][3][5] ), .DATA3(\image_buffer[2][3][5] ), .DATA4(
        \image_buffer[3][3][5] ), .DATA5(\image_buffer[4][3][5] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N285) );
  SELECT_OP C1481 ( .DATA1(\image_buffer[0][3][4] ), .DATA2(
        \image_buffer[1][3][4] ), .DATA3(\image_buffer[2][3][4] ), .DATA4(
        \image_buffer[3][3][4] ), .DATA5(\image_buffer[4][3][4] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N286) );
  SELECT_OP C1482 ( .DATA1(\image_buffer[0][3][3] ), .DATA2(
        \image_buffer[1][3][3] ), .DATA3(\image_buffer[2][3][3] ), .DATA4(
        \image_buffer[3][3][3] ), .DATA5(\image_buffer[4][3][3] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N287) );
  SELECT_OP C1483 ( .DATA1(\image_buffer[0][3][2] ), .DATA2(
        \image_buffer[1][3][2] ), .DATA3(\image_buffer[2][3][2] ), .DATA4(
        \image_buffer[3][3][2] ), .DATA5(\image_buffer[4][3][2] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N288) );
  SELECT_OP C1484 ( .DATA1(\image_buffer[0][3][1] ), .DATA2(
        \image_buffer[1][3][1] ), .DATA3(\image_buffer[2][3][1] ), .DATA4(
        \image_buffer[3][3][1] ), .DATA5(\image_buffer[4][3][1] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N289) );
  SELECT_OP C1485 ( .DATA1(\image_buffer[0][3][0] ), .DATA2(
        \image_buffer[1][3][0] ), .DATA3(\image_buffer[2][3][0] ), .DATA4(
        \image_buffer[3][3][0] ), .DATA5(\image_buffer[4][3][0] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N290) );
  SELECT_OP C1486 ( .DATA1(\image_buffer[0][4][7] ), .DATA2(
        \image_buffer[1][4][7] ), .DATA3(\image_buffer[2][4][7] ), .DATA4(
        \image_buffer[3][4][7] ), .DATA5(\image_buffer[4][4][7] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N291) );
  SELECT_OP C1487 ( .DATA1(\image_buffer[0][4][6] ), .DATA2(
        \image_buffer[1][4][6] ), .DATA3(\image_buffer[2][4][6] ), .DATA4(
        \image_buffer[3][4][6] ), .DATA5(\image_buffer[4][4][6] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N292) );
  SELECT_OP C1488 ( .DATA1(\image_buffer[0][4][5] ), .DATA2(
        \image_buffer[1][4][5] ), .DATA3(\image_buffer[2][4][5] ), .DATA4(
        \image_buffer[3][4][5] ), .DATA5(\image_buffer[4][4][5] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N293) );
  SELECT_OP C1489 ( .DATA1(\image_buffer[0][4][4] ), .DATA2(
        \image_buffer[1][4][4] ), .DATA3(\image_buffer[2][4][4] ), .DATA4(
        \image_buffer[3][4][4] ), .DATA5(\image_buffer[4][4][4] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N294) );
  SELECT_OP C1490 ( .DATA1(\image_buffer[0][4][3] ), .DATA2(
        \image_buffer[1][4][3] ), .DATA3(\image_buffer[2][4][3] ), .DATA4(
        \image_buffer[3][4][3] ), .DATA5(\image_buffer[4][4][3] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N295) );
  SELECT_OP C1491 ( .DATA1(\image_buffer[0][4][2] ), .DATA2(
        \image_buffer[1][4][2] ), .DATA3(\image_buffer[2][4][2] ), .DATA4(
        \image_buffer[3][4][2] ), .DATA5(\image_buffer[4][4][2] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N296) );
  SELECT_OP C1492 ( .DATA1(\image_buffer[0][4][1] ), .DATA2(
        \image_buffer[1][4][1] ), .DATA3(\image_buffer[2][4][1] ), .DATA4(
        \image_buffer[3][4][1] ), .DATA5(\image_buffer[4][4][1] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N297) );
  SELECT_OP C1493 ( .DATA1(\image_buffer[0][4][0] ), .DATA2(
        \image_buffer[1][4][0] ), .DATA3(\image_buffer[2][4][0] ), .DATA4(
        \image_buffer[3][4][0] ), .DATA5(\image_buffer[4][4][0] ), .CONTROL1(
        N61), .CONTROL2(N62), .CONTROL3(N63), .CONTROL4(N64), .CONTROL5(N65), 
        .Z(N298) );
  SELECT_OP C1494 ( .DATA1(N259), .DATA2(N267), .DATA3(N275), .DATA4(N283), 
        .DATA5(N291), .CONTROL1(N66), .CONTROL2(N67), .CONTROL3(N68), 
        .CONTROL4(N69), .CONTROL5(N70), .Z(N304) );
  GTECH_BUF B_36 ( .A(N299), .Z(N66) );
  GTECH_BUF B_37 ( .A(N301), .Z(N67) );
  GTECH_BUF B_38 ( .A(N302), .Z(N68) );
  GTECH_BUF B_39 ( .A(N303), .Z(N69) );
  GTECH_BUF B_40 ( .A(N300), .Z(N70) );
  SELECT_OP C1495 ( .DATA1(N260), .DATA2(N268), .DATA3(N276), .DATA4(N284), 
        .DATA5(N292), .CONTROL1(N66), .CONTROL2(N67), .CONTROL3(N68), 
        .CONTROL4(N69), .CONTROL5(N70), .Z(N305) );
  SELECT_OP C1496 ( .DATA1(N261), .DATA2(N269), .DATA3(N277), .DATA4(N285), 
        .DATA5(N293), .CONTROL1(N66), .CONTROL2(N67), .CONTROL3(N68), 
        .CONTROL4(N69), .CONTROL5(N70), .Z(N306) );
  SELECT_OP C1497 ( .DATA1(N262), .DATA2(N270), .DATA3(N278), .DATA4(N286), 
        .DATA5(N294), .CONTROL1(N66), .CONTROL2(N67), .CONTROL3(N68), 
        .CONTROL4(N69), .CONTROL5(N70), .Z(N307) );
  SELECT_OP C1498 ( .DATA1(N263), .DATA2(N271), .DATA3(N279), .DATA4(N287), 
        .DATA5(N295), .CONTROL1(N66), .CONTROL2(N67), .CONTROL3(N68), 
        .CONTROL4(N69), .CONTROL5(N70), .Z(N308) );
  SELECT_OP C1499 ( .DATA1(N264), .DATA2(N272), .DATA3(N280), .DATA4(N288), 
        .DATA5(N296), .CONTROL1(N66), .CONTROL2(N67), .CONTROL3(N68), 
        .CONTROL4(N69), .CONTROL5(N70), .Z(N309) );
  SELECT_OP C1500 ( .DATA1(N265), .DATA2(N273), .DATA3(N281), .DATA4(N289), 
        .DATA5(N297), .CONTROL1(N66), .CONTROL2(N67), .CONTROL3(N68), 
        .CONTROL4(N69), .CONTROL5(N70), .Z(N310) );
  SELECT_OP C1501 ( .DATA1(N266), .DATA2(N274), .DATA3(N282), .DATA4(N290), 
        .DATA5(N298), .CONTROL1(N66), .CONTROL2(N67), .CONTROL3(N68), 
        .CONTROL4(N69), .CONTROL5(N70), .Z(N311) );
  GTECH_NOT I_54 ( .A(cs[1]), .Z(N71) );
  GTECH_NOT I_55 ( .A(N73), .Z(N74) );
  GTECH_NOT I_56 ( .A(N75), .Z(N76) );
  GTECH_AND2 C1517 ( .A(N362), .B(N365), .Z(N80) );
  GTECH_NOT I_57 ( .A(N80), .Z(N81) );
  GTECH_AND2 C1520 ( .A(N368), .B(N371), .Z(N84) );
  GTECH_NOT I_58 ( .A(N84), .Z(N85) );
  GTECH_NOT I_59 ( .A(N385), .Z(N88) );
  GTECH_OR2 C1524 ( .A(N71), .B(cs[0]), .Z(N385) );
  GTECH_AND2 C1530 ( .A(N249), .B(N373), .Z(N89) );
  GTECH_AND2 C1533 ( .A(N89), .B(N353), .Z(N90) );
  GTECH_AND2 C1536 ( .A(N90), .B(N329) );
  GTECH_AND2 C1537 ( .A(N89), .B(N352) );
  GTECH_AND2 C1538 ( .A(N249), .B(N374), .Z(N106) );
  GTECH_AND2 C1541 ( .A(N106), .B(N357), .Z(N107) );
  GTECH_AND2 C1544 ( .A(N107), .B(N333) );
  GTECH_AND2 C1545 ( .A(N106), .B(N356) );
  GTECH_AND2 C1548 ( .A(N135), .B(N130), .Z(N140) );
  GTECH_AND2 C1549 ( .A(N135), .B(N131), .Z(N141) );
  GTECH_AND2 C1550 ( .A(N135), .B(N132), .Z(N142) );
  GTECH_AND2 C1551 ( .A(N135), .B(N133), .Z(N143) );
  GTECH_AND2 C1552 ( .A(N135), .B(N134), .Z(N144) );
  GTECH_AND2 C1553 ( .A(N136), .B(N130), .Z(N145) );
  GTECH_AND2 C1554 ( .A(N136), .B(N131), .Z(N146) );
  GTECH_AND2 C1555 ( .A(N136), .B(N132), .Z(N147) );
  GTECH_AND2 C1556 ( .A(N136), .B(N133), .Z(N148) );
  GTECH_AND2 C1557 ( .A(N136), .B(N134), .Z(N149) );
  GTECH_AND2 C1558 ( .A(N137), .B(N130), .Z(N150) );
  GTECH_AND2 C1559 ( .A(N137), .B(N131), .Z(N151) );
  GTECH_AND2 C1560 ( .A(N137), .B(N132), .Z(N152) );
  GTECH_AND2 C1561 ( .A(N137), .B(N133), .Z(N153) );
  GTECH_AND2 C1562 ( .A(N137), .B(N134), .Z(N154) );
  GTECH_AND2 C1563 ( .A(N138), .B(N130), .Z(N155) );
  GTECH_AND2 C1564 ( .A(N138), .B(N131), .Z(N156) );
  GTECH_AND2 C1565 ( .A(N138), .B(N132), .Z(N157) );
  GTECH_AND2 C1566 ( .A(N138), .B(N133), .Z(N158) );
  GTECH_AND2 C1567 ( .A(N138), .B(N134), .Z(N159) );
  GTECH_AND2 C1568 ( .A(N139), .B(N130), .Z(N160) );
  GTECH_AND2 C1569 ( .A(N139), .B(N131), .Z(N161) );
  GTECH_AND2 C1570 ( .A(N139), .B(N132), .Z(N162) );
  GTECH_AND2 C1571 ( .A(N139), .B(N133), .Z(N163) );
  GTECH_AND2 C1572 ( .A(N139), .B(N134), .Z(N164) );
  GTECH_OR2 C1573 ( .A(N325), .B(N326), .Z(N190) );
  GTECH_OR2 C1576 ( .A(N320), .B(N190), .Z(N191) );
  GTECH_NOT I_60 ( .A(N191), .Z(N192) );
  GTECH_NOT I_61 ( .A(N190), .Z(N194) );
  GTECH_AND2 C1579 ( .A(N320), .B(N194), .Z(N195) );
  GTECH_NOT I_62 ( .A(cmd_valid), .Z(N196) );
  GTECH_AND2 C1584 ( .A(N249), .B(cmd_valid), .Z(N197) );
  GTECH_NOT I_63 ( .A(cmd[2]), .Z(N198) );
  GTECH_NOT I_64 ( .A(cmd[1]), .Z(N199) );
  GTECH_NOT I_65 ( .A(cmd[0]), .Z(N200) );
  GTECH_NOT I_66 ( .A(N204), .Z(N205) );
  GTECH_NOT I_67 ( .A(N207), .Z(N208) );
  GTECH_NOT I_68 ( .A(N209), .Z(N210) );
  GTECH_NOT I_69 ( .A(N212), .Z(N213) );
  GTECH_OR2 C1592 ( .A(N214), .B(N215), .Z(N216) );
  GTECH_AND2 C1599 ( .A(N197), .B(N205), .Z(N217) );
  GTECH_AND2 C1602 ( .A(N217), .B(N337) );
  GTECH_AND2 C1603 ( .A(N197), .B(N208), .Z(N221) );
  GTECH_AND2 C1606 ( .A(N221), .B(N340), .Z(N222) );
  GTECH_AND2 C1607 ( .A(N197), .B(N210), .Z(N226) );
  GTECH_AND2 C1610 ( .A(N226), .B(N343), .Z(N227) );
  GTECH_AND2 C1611 ( .A(N197), .B(N213), .Z(N231) );
  GTECH_AND2 C1614 ( .A(N231), .B(N347) );
  GTECH_NOT I_70 ( .A(reset), .Z(N248) );
  GTECH_BUF B_41 ( .A(N248), .Z(N249) );
  GTECH_AND2 C1619 ( .A(N249), .B(N349) );
  GTECH_AND2 C1620 ( .A(N205), .B(cmd_valid), .Z(N312) );
  GTECH_AND2 C1621 ( .A(N338), .B(N312), .Z(N313) );
  GTECH_NOT I_71 ( .A(N313), .Z(N314) );
  GTECH_AND2 C1623 ( .A(N247), .B(N314), .Z(N315) );
  GTECH_OR2 C1624 ( .A(N222), .B(N341) );
  GTECH_OR2 C1625 ( .A(N227), .B(N344) );
endmodule

