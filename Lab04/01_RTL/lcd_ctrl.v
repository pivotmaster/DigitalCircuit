module LCD_CTRL(clk, reset, datain, cmd, cmd_valid, dataout, output_valid, busy);
input           clk;
input           reset;
input   [7:0]   datain;
input   [2:0]   cmd;
input           cmd_valid;
output reg [7:0] dataout;
output reg       output_valid;
output reg       busy;
                                 
///// Reg /////
reg [1:0] cs, ns;
reg [2:0] x_cnt, y_cnt;
reg [7:0] image_buffer [0:4][0:4];
reg [2:0] x, y;
reg [3:0] OUT_cnt;
///////////////

reg [2:0] x_off, y_off;

///// Parameter /////
parameter IDLE = 2'd0;
parameter READ = 2'd1;
parameter EXE  = 2'd2;
parameter OUT  = 2'd3;
/////////////////////

///// FSM /////
always @(posedge clk or posedge reset) begin
    if (reset) begin
        cs <= IDLE;
    end else begin
        cs <= ns;
    end
end

always @(*) begin
    case (cs)
        IDLE: begin
            if (cmd_valid) begin
                if (cmd == 3'd0) begin
                    ns = READ;
                end else begin
                    ns = OUT;
                end
            end else begin
                ns = cs;
            end
        end 

        READ: begin
            if (x_cnt == 3'd4 && y_cnt == 3'd4) begin
                ns = OUT;
            end else begin
                ns = cs;
            end
        end

        EXE: begin
            ns = IDLE;
        end

        OUT: begin
            if (x_cnt == 3'd2 && y_cnt == 3'd2) begin
                ns = IDLE;
            end else begin
                ns = cs;
            end
        end
    endcase
end
///////////////

///// Busy Setting /////
always @(*) begin
    // Default value of busy is 0 unless in active states
    busy = (cs != IDLE);
end
////////////////////////

///// Pointer /////
always @(posedge clk or posedge reset) begin
    if (reset) begin
        x_cnt <= 3'd0;
        y_cnt <= 3'd0;
        x_off <= 3'd1;
        y_off <= 3'd1;
    end else if (cs == READ) begin
        if (x_cnt == 3'd4) begin
            if (y_cnt == 3'd4) begin
                x_cnt <= 3'd0;
                y_cnt <= 3'd0;
            end else begin
                x_cnt <= 3'd0;
                y_cnt <= y_cnt + 3'd1;
            end
        end else begin
            x_cnt <= x_cnt + 3'd1;
            y_cnt <= y_cnt;
        end
    end else if (cs == OUT) begin
        if (x_cnt == 3'd2) begin
            if (y_cnt == 3'd2) begin
                x_cnt <= 3'd0;
                y_cnt <= 3'd0;
            end else begin
                x_cnt <= 3'd0;
                y_cnt <= y_cnt + 3'd1;
            end
        end else begin
            x_cnt <= x_cnt + 3'd1;
            y_cnt <= y_cnt;
        end
    end
end
///////////////////

///// Image Input /////
integer i, j;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        for (i = 0; i < 5; i = i + 1) begin
            for (j = 0; j < 5; j = j + 1) begin
                image_buffer[i][j] <= 8'd0;
            end
        end
    end else if (cs == READ) begin
        image_buffer[x_cnt][y_cnt] <= datain;
    end
end
///////////////////////

///// Execuate /////
always @(posedge clk or posedge reset) begin
    if (cmd == 3'd1) begin
        if (x_off != 3'd2) begin
            x_off <= x_off + 3'd1;
        end
    end else if (cmd == 3'd2) begin
        if (x_off != 3'd0) begin
            x_off <= x_off - 3'd1;
        end
    end else if (cmd == 3'd3) begin
        if (y_off != 3'd0) begin
            y_off <= y_off - 3'd1;
        end
    end else if (cmd == 3'd4) begin
        if (y_off != 3'd2) begin
            y_off <= y_off + 3'd1;
        end
    end else if (cmd == 3'd0) begin
        x_off <= 3'd1;
        y_off <= 3'd1;
    end
end
////////////////////

///// Output Setting /////
always @(posedge clk or posedge reset) begin
    if (reset) begin
        output_valid <= 0;
    end else if (cs == OUT) begin
        // Output valid only when data is being sent
        output_valid <= 1;
    end else begin
        output_valid <= 0;
    end
end
//////////////////////////

///// Image Output /////
always @(posedge clk or posedge reset) begin
    if (reset) begin
        OUT_cnt <= 0;
        dataout <= 8'd0;
    end else if (cs == OUT && OUT_cnt < 9) begin
        dataout <= image_buffer[x_cnt+x_off][y_cnt+y_off];
        // OUT_cnt <= OUT_cnt + 1;

        if (OUT_cnt == 8) begin // Last pixel
            output_valid <= 0; // Clear output_valid after the last pixel has been outputted
        end
    end else if (cs != OUT) begin
        OUT_cnt <= 0; // Reset counter when not in OUT state
        dataout <= 8'd0;
    end
end
////////////////////////

endmodule


