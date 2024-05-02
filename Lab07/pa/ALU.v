`timescale 1ns/1ps

module ALU (
    input [2:0] opcode,
    input signed [15:0] rs_data,
    input signed [15:0] rt_data,
    input [4:0] immediate,
    output reg signed [15:0] ALU_out
);

reg signed [15:0] immediate_extened;

always @ (*) begin
    // Sign extend the immediate value
    if (immediate[4] == 1'b1) begin
        immediate_extened[15:5] = 11'b11111111111; // Sign extension for negative value
    end else begin
        immediate_extened[15:5] = 11'b00000000000; // Zero extension for non-negative
    end
    immediate_extened[4:0] = immediate[4:0];
end

always @ (*) begin
    // ALU operations
    case (opcode)
        3'b000: ALU_out = rs_data + rt_data;  // Addition
        3'b001: ALU_out = rs_data * rt_data;  // Multiplication
        3'b010: ALU_out = rs_data & rt_data;  // AND
        3'b011: ALU_out = ~rs_data;           // NOT
        3'b100: begin                         // Conditional sign
            if (rs_data >= 0)
                ALU_out = rs_data;
            else
                ALU_out = -rs_data;
        end
        3'b101: begin                         // Minimum
            if (rt_data >= rs_data)
                ALU_out = rs_data;
            else
                ALU_out = rt_data;
        end
        3'b110: ALU_out = rs_data << immediate;  // Shift left
        3'b111: ALU_out = rs_data + immediate_extened;  // Addition with sign-extended immediate
    endcase
end

endmodule

