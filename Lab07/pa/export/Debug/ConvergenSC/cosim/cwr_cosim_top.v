`timescale 1 ps / 1 ps

module cwr_cosim_top;

wire [2:0] cwr_HARDWARE_v_i_ALU_v_opcode;
wire [15:0] cwr_HARDWARE_v_i_ALU_v_rs_data;
wire [15:0] cwr_HARDWARE_v_i_ALU_v_rt_data;
wire [4:0] cwr_HARDWARE_v_i_ALU_v_immediate;
wire [15:0] cwr_HARDWARE_v_i_ALU_v_ALU_out;

ALU cwr_HARDWARE_v_i_ALU(
  cwr_HARDWARE_v_i_ALU_v_opcode,
  cwr_HARDWARE_v_i_ALU_v_rs_data,
  cwr_HARDWARE_v_i_ALU_v_rt_data,
  cwr_HARDWARE_v_i_ALU_v_immediate,
  cwr_HARDWARE_v_i_ALU_v_ALU_out
);

cwr_cosim_shell cwr_cosim_shell_i(
  .HARDWARE_v_i_ALU_v_opcode(cwr_HARDWARE_v_i_ALU_v_opcode),
  .HARDWARE_v_i_ALU_v_rs_data(cwr_HARDWARE_v_i_ALU_v_rs_data),
  .HARDWARE_v_i_ALU_v_rt_data(cwr_HARDWARE_v_i_ALU_v_rt_data),
  .HARDWARE_v_i_ALU_v_immediate(cwr_HARDWARE_v_i_ALU_v_immediate),
  .HARDWARE_v_i_ALU_v_ALU_out(cwr_HARDWARE_v_i_ALU_v_ALU_out)
);

endmodule

