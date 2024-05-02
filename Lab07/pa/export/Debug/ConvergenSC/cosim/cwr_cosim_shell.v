`timescale 1 ps / 1 ps

module cwr_cosim_shell (
  HARDWARE_v_i_ALU_v_opcode,
  HARDWARE_v_i_ALU_v_rs_data,
  HARDWARE_v_i_ALU_v_rt_data,
  HARDWARE_v_i_ALU_v_immediate,
  HARDWARE_v_i_ALU_v_ALU_out
);

output  [2:0] HARDWARE_v_i_ALU_v_opcode;
output  [15:0] HARDWARE_v_i_ALU_v_rs_data;
output  [15:0] HARDWARE_v_i_ALU_v_rt_data;
output  [4:0] HARDWARE_v_i_ALU_v_immediate;
input   [15:0] HARDWARE_v_i_ALU_v_ALU_out;

reg     [2:0] HARDWARE_v_i_ALU_v_opcode;
reg     [15:0] HARDWARE_v_i_ALU_v_rs_data;
reg     [15:0] HARDWARE_v_i_ALU_v_rt_data;
reg     [4:0] HARDWARE_v_i_ALU_v_immediate;

parameter CWR_HDL_SHELL = "primary";

initial
  begin
    $cwr_cosim_init;
  end

endmodule

