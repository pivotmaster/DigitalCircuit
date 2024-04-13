module CNN(
    //input
    input                           clk,
    input                           rst_n,
    input                           in_valid,
    input      signed   [15:0]      in_data,
    input                           opt,
    //output
    output reg                      out_valid, 
    output reg signed   [15:0]      out_data	
);

///////////////////////////////////////////////////////
//                   Parameter                       //
///////////////////////////////////////////////////////

//You can modify the states.
parameter IDLE = 2'd0;
parameter READ = 2'd1;
parameter CALC = 2'd2;
parameter OUT  = 2'd3;

///////////////////////////////////////////////////////
//                       FSM                         //
///////////////////////////////////////////////////////

//You can modify the reg name for your convenience.
reg [1:0] current_state, next_state;


///////////////////////////////////////////////////////
//                   wire & reg                      //
///////////////////////////////////////////////////////

//write down the wire and reg you need here.
reg signed [15:0] image_buffer [0:5][0:5];
reg signed [15:0] CNN_kernal [0:2][0:2];
reg signed [15:0] CNN_buffer [0:3][0:3];
reg signed [15:0] ReLU_buffer [0:3][0:3];
reg signed [15:0] Maxpool_buffer [0:1][0:1]; 
reg [2:0] in_x, in_y;
reg out_x, out_y;
reg [4:0] cal_x, cal_y;
reg image_inputing;
reg counting_finished;
reg output_finished;

///////////////////////////////////////////////////////
//                   FSM design                      //
///////////////////////////////////////////////////////

//If you don't know how to design FSM, you can refer to lab04. 
always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0) begin
        current_state <= IDLE;
    end else begin
        current_state <= next_state;
    end
end

always @(*) begin
    case (current_state)
        IDLE: begin
            if (in_valid == 1'd1) begin
                next_state = READ;
            end else begin
                next_state = IDLE;
            end
        end 

        READ: begin
            if (in_valid == 1'd1) begin
                next_state = READ;
            end else begin
                next_state = CALC;
            end
        end

        CALC: begin
            if (counting_finished == 1'd1) begin
                next_state = OUT;
            end else begin
                next_state = CALC;
            end
        end

        OUT: begin
            if (output_finished == 1'd1) begin
                next_state = IDLE;
            end else begin
                next_state = OUT;
            end
        end

        default: next_state = IDLE;
    endcase
end

///////////////////////////////////////////////////////
//                     design                        //
///////////////////////////////////////////////////////

//write down your design here.
integer i, j;
reg busy;
reg ram_ov;
reg deactivate_ReLU;
reg signed [15:0] ram_in;
reg signed [15:0] ram_od;

//
always@(posedge clk) begin
    if (opt == 1'b0) begin
        deactivate_ReLU <= 1'b0;
    end else if (opt == 1'b1) begin
        deactivate_ReLU <= 1'b1;
    end
end

always@(posedge clk or negedge rst_n) begin
    if (rst_n == 1'd0) begin
        out_data <= 16'd0;
        out_valid <= 1'd0;
    end
    else if (current_state == IDLE) begin
        in_x <= 3'd0;
        in_y <= 3'd0;
        out_x <= 1'd0;
        out_y <= 1'd0;
        out_data <= 16'd0;
        out_valid <= 1'd0;
        ram_od <= 16'd0;
        ram_ov <= 1'd0;
        image_inputing <= 1'd1;
        counting_finished <= 1'd0;
        output_finished <= 1'd0;
        if (opt == 1'd0 || opt == 1'd1) begin
            ram_in <= in_data;
        end else begin
            ram_in <= 16'd0;
        end
    end else if (current_state == READ) begin
        if (image_inputing == 1'd1) begin
            image_buffer[in_x][in_y] <= ram_in;
            ram_in <= in_data;
            if (in_x != 3'd5) begin
                in_x <= in_x + 3'd1;
            end else begin 
                in_x <= 0;
                if (in_y != 3'd5) begin
                    in_y <= in_y + 3'd1;
                end else begin
                    in_y <= 0;
                    image_inputing <= 1'd0;
                end
            end
        end else begin
            CNN_kernal[in_x][in_y] <= ram_in;
            ram_in <= in_data;
            if (in_x != 3'd2) begin
                in_x <= in_x + 3'd1;
            end else begin 
                in_x <= 0;
                if (in_y != 3'd2) begin
                    in_y <= in_y + 3'd1;
                end else begin
                    in_y <= 0;
                    image_inputing <= 1'd1;
                    busy <= 1'd0;
                end
            end
        end
    end else if (current_state == CALC) begin
        if (busy == 1'd0) begin
            busy <= 1'd1;
            // CNN ///////////////////////////////////////////////////////////////////////////////
            // Perform Convolution
            for (cal_x = 0; cal_x < 4; cal_x = cal_x + 1) begin
                for (cal_y = 0; cal_y < 4; cal_y = cal_y + 1) begin
                    // Reset buffer
                    CNN_buffer[cal_x][cal_y] = 0;

                    // Perform element-wise multiplication and summation
                    for (i = 0; i < 3; i = i + 1) begin
                        for (j = 0; j < 3; j = j + 1) begin
                            CNN_buffer[cal_x][cal_y] = CNN_buffer[cal_x][cal_y] +
                                image_buffer[cal_x + i][cal_y + j] * CNN_kernal[i][j];
                        end
                    end
                end
            end

            // Apply ReLU function
            
            for (i = 0; i < 4; i = i + 1) begin
                for (j = 0; j < 4; j = j + 1) begin
                    if (deactivate_ReLU == 1'b0) begin
                        ReLU_buffer[i][j] = (CNN_buffer[i][j] < 0) ? 0 : CNN_buffer[i][j];
                    end else begin
                        ReLU_buffer[i][j] = CNN_buffer[i][j];
                    end
                end
            end
            

            // Perform Max Pooling
            for (i = 0; i < 2; i = i + 1) begin
                for (j = 0; j < 2; j = j + 1) begin
                    if (ReLU_buffer[2*i][2*j] > ReLU_buffer[2*i][2*j+1]) begin
                        if (ReLU_buffer[2*i][2*j] > ReLU_buffer[2*i+1][2*j]) begin
                            if (ReLU_buffer[2*i][2*j] > ReLU_buffer[2*i+1][2*j+1]) begin
                                Maxpool_buffer[i][j] = ReLU_buffer[2*i][2*j];
                            end else begin
                                Maxpool_buffer[i][j] = ReLU_buffer[2*i+1][2*j+1];
                            end
                        end else begin
                            if (ReLU_buffer[2*i+1][2*j] > ReLU_buffer[2*i+1][2*j+1]) begin
                                Maxpool_buffer[i][j] = ReLU_buffer[2*i+1][2*j];
                            end else begin
                                Maxpool_buffer[i][j] = ReLU_buffer[2*i+1][2*j+1];
                            end
                        end
                    end else begin
                        if (ReLU_buffer[2*i][2*j+1] > ReLU_buffer[2*i+1][2*j]) begin
                            if (ReLU_buffer[2*i][2*j+1] > ReLU_buffer[2*i+1][2*j+1]) begin
                                Maxpool_buffer[i][j] = ReLU_buffer[2*i][2*j+1];
                            end else begin
                                Maxpool_buffer[i][j] = ReLU_buffer[2*i+1][2*j+1];
                            end
                        end else begin
                            if (ReLU_buffer[2*i+1][2*j] > ReLU_buffer[2*i+1][2*j+1]) begin
                                Maxpool_buffer[i][j] = ReLU_buffer[2*i+1][2*j];
                            end else begin
                                Maxpool_buffer[i][j] = ReLU_buffer[2*i+1][2*j+1];
                            end
                        end
                    end
                end
            end
            //////////////////////////////////////////////////////////////////////////////////////
            counting_finished <= 1'd1;
            busy <= 1'd0;
        end else begin
            //
        end
    end else begin
        out_valid <= ram_ov;
        out_data <= ram_od;
        ram_ov <= 1'd1;
        ram_od <= Maxpool_buffer[out_x][out_y];
        if (out_x != 1'd1) begin
            out_x <= out_x + 1'd1;
        end else begin 
            out_x <= 0;
            if (out_y != 1'd1) begin
                out_y <= out_y + 1'd1;
            end else begin
                out_y <= 0;
                output_finished <= 1'd1;
            end
        end
    end
end

endmodule
