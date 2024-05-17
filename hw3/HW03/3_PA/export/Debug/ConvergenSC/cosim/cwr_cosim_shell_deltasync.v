`timescale 1 ps / 1 ps

module cwr_cosim_shell_deltasync (
  cwr_ToggleSig,
  HARDWARE_v_i_PATTERN_v_clk,
  HARDWARE_v_i_PATTERN_v_reset,
  HARDWARE_v_i_PATTERN_v_gray_data,
  HARDWARE_v_i_PATTERN_v_gray_valid,
  HARDWARE_v_i_PATTERN_v_CNT,
  HARDWARE_v_i_PATTERN_v_CNT_valid,
  HARDWARE_v_i_PATTERN_v_HC,
  HARDWARE_v_i_PATTERN_v_M,
  HARDWARE_v_i_PATTERN_v_code_valid,
  HARDWARE_v_i_huffman_v_clk,
  HARDWARE_v_i_huffman_v_reset,
  HARDWARE_v_i_huffman_v_gray_valid,
  HARDWARE_v_i_huffman_v_gray_data,
  HARDWARE_v_i_huffman_v_CNT_valid,
  HARDWARE_v_i_huffman_v_CNT,
  HARDWARE_v_i_huffman_v_code_valid,
  HARDWARE_v_i_huffman_v_HC,
  HARDWARE_v_i_huffman_v_M,
  HARDWARE_v_i_huffman_v_in_Aid_all,
  HARDWARE_v_i_huffman_v_in_CNT_all,
  HARDWARE_v_i_huffman_v_out_Aid_all,
  HARDWARE_v_i_huffman_v_out_CNT_all
);

output         cwr_ToggleSig;
input          HARDWARE_v_i_PATTERN_v_clk;
input          HARDWARE_v_i_PATTERN_v_reset;
input   [7:0] HARDWARE_v_i_PATTERN_v_gray_data;
input          HARDWARE_v_i_PATTERN_v_gray_valid;
output  [47:0] HARDWARE_v_i_PATTERN_v_CNT;
output         HARDWARE_v_i_PATTERN_v_CNT_valid;
output  [47:0] HARDWARE_v_i_PATTERN_v_HC;
output  [47:0] HARDWARE_v_i_PATTERN_v_M;
output         HARDWARE_v_i_PATTERN_v_code_valid;
output         HARDWARE_v_i_huffman_v_clk;
output         HARDWARE_v_i_huffman_v_reset;
output         HARDWARE_v_i_huffman_v_gray_valid;
output  [7:0] HARDWARE_v_i_huffman_v_gray_data;
input          HARDWARE_v_i_huffman_v_CNT_valid;
input   [47:0] HARDWARE_v_i_huffman_v_CNT;
input          HARDWARE_v_i_huffman_v_code_valid;
input   [47:0] HARDWARE_v_i_huffman_v_HC;
input   [47:0] HARDWARE_v_i_huffman_v_M;
input   [47:0] HARDWARE_v_i_huffman_v_in_Aid_all;
input   [47:0] HARDWARE_v_i_huffman_v_in_CNT_all;
output  [47:0] HARDWARE_v_i_huffman_v_out_Aid_all;
output  [47:0] HARDWARE_v_i_huffman_v_out_CNT_all;

reg     [47:0] HARDWARE_v_i_PATTERN_v_CNT;
reg            HARDWARE_v_i_PATTERN_v_CNT_valid;
reg     [47:0] HARDWARE_v_i_PATTERN_v_HC;
reg     [47:0] HARDWARE_v_i_PATTERN_v_M;
reg            HARDWARE_v_i_PATTERN_v_code_valid;
reg            HARDWARE_v_i_huffman_v_clk;
reg            HARDWARE_v_i_huffman_v_reset;
reg            HARDWARE_v_i_huffman_v_gray_valid;
reg     [7:0] HARDWARE_v_i_huffman_v_gray_data;
reg     [47:0] HARDWARE_v_i_huffman_v_out_Aid_all;
reg     [47:0] HARDWARE_v_i_huffman_v_out_CNT_all;
reg            cwr_ToggleSig;

parameter CWR_HDL_SHELL = "primary";

initial
  begin
    $cwr_cosim_init;
  end

endmodule

