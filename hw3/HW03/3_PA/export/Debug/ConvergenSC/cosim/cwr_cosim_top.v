`timescale 1 ps / 1 ps

module cwr_cosim_top;

wire        cwr_HARDWARE_v_i_PATTERN_v_clk;
wire        cwr_HARDWARE_v_i_PATTERN_v_reset;
wire [7:0] cwr_HARDWARE_v_i_PATTERN_v_gray_data;
wire        cwr_HARDWARE_v_i_PATTERN_v_gray_valid;
wire [47:0] cwr_HARDWARE_v_i_PATTERN_v_CNT;
wire        cwr_HARDWARE_v_i_PATTERN_v_CNT_valid;
wire [47:0] cwr_HARDWARE_v_i_PATTERN_v_HC;
wire [47:0] cwr_HARDWARE_v_i_PATTERN_v_M;
wire        cwr_HARDWARE_v_i_PATTERN_v_code_valid;
wire        cwr_HARDWARE_v_i_huffman_v_clk;
wire        cwr_HARDWARE_v_i_huffman_v_reset;
wire        cwr_HARDWARE_v_i_huffman_v_gray_valid;
wire [7:0] cwr_HARDWARE_v_i_huffman_v_gray_data;
wire        cwr_HARDWARE_v_i_huffman_v_CNT_valid;
wire [47:0] cwr_HARDWARE_v_i_huffman_v_CNT;
wire        cwr_HARDWARE_v_i_huffman_v_code_valid;
wire [47:0] cwr_HARDWARE_v_i_huffman_v_HC;
wire [47:0] cwr_HARDWARE_v_i_huffman_v_M;
wire [47:0] cwr_HARDWARE_v_i_huffman_v_in_Aid_all;
wire [47:0] cwr_HARDWARE_v_i_huffman_v_in_CNT_all;
wire [47:0] cwr_HARDWARE_v_i_huffman_v_out_Aid_all;
wire [47:0] cwr_HARDWARE_v_i_huffman_v_out_CNT_all;

PATTERN cwr_HARDWARE_v_i_PATTERN(
  cwr_HARDWARE_v_i_PATTERN_v_clk,
  cwr_HARDWARE_v_i_PATTERN_v_reset,
  cwr_HARDWARE_v_i_PATTERN_v_gray_data,
  cwr_HARDWARE_v_i_PATTERN_v_gray_valid,
  cwr_HARDWARE_v_i_PATTERN_v_CNT,
  cwr_HARDWARE_v_i_PATTERN_v_CNT_valid,
  cwr_HARDWARE_v_i_PATTERN_v_HC,
  cwr_HARDWARE_v_i_PATTERN_v_M,
  cwr_HARDWARE_v_i_PATTERN_v_code_valid
);

  defparam cwr_HARDWARE_v_i_PATTERN.CYCLE = 20;
  defparam cwr_HARDWARE_v_i_PATTERN.MAX_LATENCY = 100;

huffman cwr_HARDWARE_v_i_huffman(
  cwr_HARDWARE_v_i_huffman_v_clk,
  cwr_HARDWARE_v_i_huffman_v_reset,
  cwr_HARDWARE_v_i_huffman_v_gray_valid,
  cwr_HARDWARE_v_i_huffman_v_gray_data,
  cwr_HARDWARE_v_i_huffman_v_CNT_valid,
  cwr_HARDWARE_v_i_huffman_v_CNT,
  cwr_HARDWARE_v_i_huffman_v_code_valid,
  cwr_HARDWARE_v_i_huffman_v_HC,
  cwr_HARDWARE_v_i_huffman_v_M,
  cwr_HARDWARE_v_i_huffman_v_in_Aid_all,
  cwr_HARDWARE_v_i_huffman_v_in_CNT_all,
  cwr_HARDWARE_v_i_huffman_v_out_Aid_all,
  cwr_HARDWARE_v_i_huffman_v_out_CNT_all
);

cwr_cosim_shell cwr_cosim_shell_i(
  .HARDWARE_v_i_PATTERN_v_clk(cwr_HARDWARE_v_i_PATTERN_v_clk),
  .HARDWARE_v_i_PATTERN_v_reset(cwr_HARDWARE_v_i_PATTERN_v_reset),
  .HARDWARE_v_i_PATTERN_v_gray_data(cwr_HARDWARE_v_i_PATTERN_v_gray_data),
  .HARDWARE_v_i_PATTERN_v_gray_valid(cwr_HARDWARE_v_i_PATTERN_v_gray_valid),
  .HARDWARE_v_i_PATTERN_v_CNT(cwr_HARDWARE_v_i_PATTERN_v_CNT),
  .HARDWARE_v_i_PATTERN_v_CNT_valid(cwr_HARDWARE_v_i_PATTERN_v_CNT_valid),
  .HARDWARE_v_i_PATTERN_v_HC(cwr_HARDWARE_v_i_PATTERN_v_HC),
  .HARDWARE_v_i_PATTERN_v_M(cwr_HARDWARE_v_i_PATTERN_v_M),
  .HARDWARE_v_i_PATTERN_v_code_valid(cwr_HARDWARE_v_i_PATTERN_v_code_valid),
  .HARDWARE_v_i_huffman_v_clk(cwr_HARDWARE_v_i_huffman_v_clk),
  .HARDWARE_v_i_huffman_v_reset(cwr_HARDWARE_v_i_huffman_v_reset),
  .HARDWARE_v_i_huffman_v_gray_valid(cwr_HARDWARE_v_i_huffman_v_gray_valid),
  .HARDWARE_v_i_huffman_v_gray_data(cwr_HARDWARE_v_i_huffman_v_gray_data),
  .HARDWARE_v_i_huffman_v_CNT_valid(cwr_HARDWARE_v_i_huffman_v_CNT_valid),
  .HARDWARE_v_i_huffman_v_CNT(cwr_HARDWARE_v_i_huffman_v_CNT),
  .HARDWARE_v_i_huffman_v_code_valid(cwr_HARDWARE_v_i_huffman_v_code_valid),
  .HARDWARE_v_i_huffman_v_HC(cwr_HARDWARE_v_i_huffman_v_HC),
  .HARDWARE_v_i_huffman_v_M(cwr_HARDWARE_v_i_huffman_v_M),
  .HARDWARE_v_i_huffman_v_in_Aid_all(cwr_HARDWARE_v_i_huffman_v_in_Aid_all),
  .HARDWARE_v_i_huffman_v_in_CNT_all(cwr_HARDWARE_v_i_huffman_v_in_CNT_all),
  .HARDWARE_v_i_huffman_v_out_Aid_all(cwr_HARDWARE_v_i_huffman_v_out_Aid_all),
  .HARDWARE_v_i_huffman_v_out_CNT_all(cwr_HARDWARE_v_i_huffman_v_out_CNT_all)
);

endmodule

