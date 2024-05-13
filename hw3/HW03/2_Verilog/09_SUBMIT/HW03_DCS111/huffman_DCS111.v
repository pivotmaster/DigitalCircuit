`timescale 1ns/10ps
module huffman( 
    clk, 
    reset, 
    gray_valid, 
    gray_data, 
    CNT_valid, 
    CNT,
    code_valid, 
    HC, 
    M, 
    in_Aid_all, 
    in_CNT_all, 
    out_Aid_all, 
    out_CNT_all
);

input               clk;
input               reset;
input               gray_valid;
input       [7:0]   gray_data;

output reg          CNT_valid;
output reg  [47:0]  CNT;
output reg          code_valid;
output reg  [47:0]  HC;
output reg  [47:0]  M;

// ===============================================================
//      SORT(6 input)
// ===============================================================
output reg [47:0]   in_Aid_all;
output reg [47:0]   in_CNT_all;

input      [47:0]   out_Aid_all;
input      [47:0]   out_CNT_all;

reg [7:0] in_Aid [5:0];
reg [7:0] in_CNT [5:0];

reg [7:0] out_Aid [5:0];
reg [7:0] out_CNT [5:0];

always @(*) begin
    in_Aid_all = {in_Aid[5], in_Aid[4], in_Aid[3], in_Aid[2], in_Aid[1], in_Aid[0]};
    in_CNT_all = {in_CNT[5], in_CNT[4], in_CNT[3], in_CNT[2], in_CNT[1], in_CNT[0]};
end

always @(*) begin
    {out_Aid[5], out_Aid[4], out_Aid[3], out_Aid[2], out_Aid[1], out_Aid[0]} = out_Aid_all;
    {out_CNT[5], out_CNT[4], out_CNT[3], out_CNT[2], out_CNT[1], out_CNT[0]} = out_CNT_all;
end

// ===============================================================
//      Reg & Wire Declaration
// ===============================================================
integer  i, j, a5, a4, a3, a2, a1, a0;
reg [1:0] state, next_state;
reg [7:0] buffer_gray_date;
// ===============================================================
//      FSM state
// ===============================================================

//You can modify the FSM state
localparam IDLE = 2'd0;
localparam READ = 2'd1;
localparam WORK = 2'd2;
localparam OUT  = 2'd3;
reg work_finished;

//================================================================
//      FSM design
//================================================================
always @(posedge clk or posedge reset) begin
    if(reset)begin
        state <= IDLE;
    end
    else begin
        state <= next_state;
    end 
end

always @(*) begin
    case(state)
        IDLE:begin
            if(gray_valid == 1'd1) begin
                next_state <= READ;
            end
            else begin
                next_state <= IDLE;
            end
        end
        READ:begin
            if(gray_valid == 1'd1) begin
                next_state <= READ;
            end
            else begin
                next_state <= WORK;
            end
        end
        WORK:begin
            if(work_finished == 1'd1) begin
                next_state <= OUT;
            end
            else begin
                next_state <= WORK;
            end
        end
        OUT:begin
            next_state <= IDLE;
        end
        default : next_state <= IDLE;
    endcase
end
// ===============================================================
//      Design
// ===============================================================

always @(posedge clk) begin
    if(state == IDLE || state == READ)
        buffer_gray_date <= gray_data;
    else begin
        buffer_gray_date <= buffer_gray_date;
    end
end

reg already_input;

always @(posedge clk) begin
    if(state == IDLE) begin
        a0 <= 0;
        a1 <= 0;
        a2 <= 0;
        a3 <= 0;
        a4 <= 0;
        a5 <= 0;
    end else if(state == READ) begin
        case(buffer_gray_date)
            8'd1:
                a0 <= a0 + 1;
            8'd2:
                a1 <= a1 + 1;
            8'd3:
                a2 <= a2 + 1;
            8'd4:
                a3 <= a3 + 1;
            8'd5:
                a4 <= a4 + 1;
            8'd6:
                a5 <= a5 + 1;
            default : a0 <= a0 + 1;
        endcase
    end else begin
        a0 <= a0;
        a1 <= a1;
        a2 <= a2;
        a3 <= a3;
        a4 <= a4;
        a5 <= a5;
    end
end

integer ID_num;
reg [7:0] ID [5:0];
reg [7:0] Code [5:0];
reg [7:0] Mask [5:0];
reg [7:0] Pointer [5:0];

always @(posedge reset or posedge clk) begin
    if(reset) begin
        CNT_valid <= 0;
        CNT <= 0;
    end else if(state == IDLE || state == READ) begin
        CNT_valid <= 0;
        CNT <= 0;
        already_input <= 1'd0;
        work_finished <= 1'd0;
        ID[0] <= 8'd6;
        ID[1] <= 8'd5;
        ID[2] <= 8'd4;
        ID[3] <= 8'd3;
        ID[4] <= 8'd2;
        ID[5] <= 8'd1;
        for(i=0;i<6;i++) begin
            Code[i] <= 8'd0;
            Mask[i] <= 8'd0;
            Pointer[i] <= 8'd0;
        end
        ID_num <= 7;
    end
    else if (state == WORK) begin
        if (already_input == 1'd0) begin
            already_input <=1'd1;
            in_CNT[0] <= a5;
            in_CNT[1] <= a4;
            in_CNT[2] <= a3;
            in_CNT[3] <= a2;
            in_CNT[4] <= a1;
            in_CNT[5] <= a0;
            in_Aid[0] <= 8'd1;
            in_Aid[1] <= 8'd2;
            in_Aid[2] <= 8'd3;
            in_Aid[3] <= 8'd4;
            in_Aid[4] <= 8'd5;
            in_Aid[5] <= 8'd6;
        end else if(ID[0] == ID[1] && ID[1] == ID[2] && ID[2] == ID[3] && ID[3] == ID[4] && ID[4] == ID[5]) begin
            work_finished <= 1'd1;
        end else begin 
            for(i=0;i<6;i++) begin
                if(ID[i] == out_Aid[1]) begin
                    Mask[i][Pointer[i]] <= 1'b1;
                    Code[i][Pointer[i]] <= 1'b0;
                    ID[i] <= ID_num;
                    Pointer[i] <= Pointer[i] + 1;
                end else if (ID[i] == out_Aid[0]) begin
                    Mask[i][Pointer[i]] <= 1'b1;
                    Code[i][Pointer[i]] <= 1'b1;
                    ID[i] <= ID_num;
                    Pointer[i] <= Pointer[i] + 1;
                end
            end
            
            CNT_valid <= 1'd1;
            CNT <= in_CNT_all;
            
            in_Aid[1] <= ID_num;
            in_Aid[0] <= 8'd127;
            in_CNT[1] <= out_CNT[0]+out_CNT[1];
            in_CNT[0] <= 8'd127;
            in_Aid[2] <= out_Aid[2];
            in_Aid[3] <= out_Aid[3];
            in_Aid[4] <= out_Aid[4];
            in_Aid[5] <= out_Aid[5];
            in_CNT[2] <= out_CNT[2];
            in_CNT[3] <= out_CNT[3];
            in_CNT[4] <= out_CNT[4];
            in_CNT[5] <= out_CNT[5];
            
            ID_num <= ID_num + 1;
        end
    end else begin
        ID_num <= ID_num;
    end
end

always @(posedge reset or posedge clk) begin
    if (reset) begin
        code_valid <= 1'd0;
    end else if (state == OUT) begin
        code_valid <= 1'd1;
        HC <= {Code[0], Code[1], Code[2], Code[3], Code[4], Code[5]};
        M <= {Mask[0], Mask[1], Mask[2], Mask[3], Mask[4], Mask[5]};
    end else begin
        code_valid <= 1'd0;
        HC <= 0;
        M <= 0;
    end
end

endmodule