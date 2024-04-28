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

reg signed [15:0] ifmap_Buffer[0:35];   
reg signed [15:0] kernel_Buffer[0:8];  

reg [5:0] count;

reg [2:0] state,next_state;

reg signed [15:0] cnn_layer[0:15];
reg signed [15:0] relu_layer[0:15];

reg opt_reg;

genvar i;

//////////////////////////////////
//              FSM             //
//////////////////////////////////
parameter IDLE = 'd0;
parameter READ = 'd1;
parameter OUT = 'd2;

always @(posedge clk , negedge rst_n) begin
    if(!rst_n)begin
        state <= IDLE;
    end
    else begin
        state <= next_state;
    end 
end

always @(*) begin
    case(state)
        IDLE:begin
            if(in_valid)begin
                next_state <= READ;
            end
            else begin
                next_state <= IDLE;
            end
        end
        READ:begin
            if(count == 'd44)begin
                next_state <= OUT;
            end
            else begin
                next_state <= READ;
            end
        end
        OUT:begin
            if(count == 3)begin
                next_state <= IDLE;
            end
            else begin
                next_state <= OUT;
            end
        end
        default : next_state <= IDLE;
    endcase
end

//////////////////////////////////
//             input            //
//////////////////////////////////

always @(posedge clk ) begin
    if(in_valid && count == 0)begin
        opt_reg <= opt;
    end
end


always@(posedge clk) begin
	if(in_valid && (count < 36 && count >= 0))begin
        ifmap_Buffer[count] <= in_data;
    end
end

always@(posedge clk) begin
    if(in_valid && (count < 45 && count >= 36))begin
        kernel_Buffer[count - 'd36] <= in_data;
    end
end

//////////////////////////////////
//            counter           //
//////////////////////////////////

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		count <= 'd0;
	end
    else if(count == 'd44 && state == READ) begin
		count <= 'd0;
	end 
	else if(in_valid) begin
		count <= count + 'd1;
	end 
    else if(count == 'd3 && state == OUT) begin
		count <= 'd0;
	end  
    else if(state == OUT) begin
		count <= count + 'd1;
	end                  
	else begin
		count <= count;
	end 
end
//////////////////////////////////
//             conv             //
//////////////////////////////////

always@(*) begin
    cnn_layer[0] = ifmap_Buffer[0]  * kernel_Buffer[0]
                  +ifmap_Buffer[1]  * kernel_Buffer[1]
                  +ifmap_Buffer[2]  * kernel_Buffer[2]
                  +ifmap_Buffer[6]  * kernel_Buffer[3]
                  +ifmap_Buffer[7]  * kernel_Buffer[4]
                  +ifmap_Buffer[8]  * kernel_Buffer[5]
                  +ifmap_Buffer[12] * kernel_Buffer[6]
                  +ifmap_Buffer[13] * kernel_Buffer[7]
                  +ifmap_Buffer[14] * kernel_Buffer[8];
    cnn_layer[1] = ifmap_Buffer[1]  * kernel_Buffer[0]
                  +ifmap_Buffer[2]  * kernel_Buffer[1]
                  +ifmap_Buffer[3]  * kernel_Buffer[2]
                  +ifmap_Buffer[7]  * kernel_Buffer[3]
                  +ifmap_Buffer[8]  * kernel_Buffer[4]
                  +ifmap_Buffer[9]  * kernel_Buffer[5]
                  +ifmap_Buffer[13] * kernel_Buffer[6]
                  +ifmap_Buffer[14] * kernel_Buffer[7]
                  +ifmap_Buffer[15] * kernel_Buffer[8];
    cnn_layer[2] = ifmap_Buffer[2]  * kernel_Buffer[0]
                  +ifmap_Buffer[3]  * kernel_Buffer[1]
                  +ifmap_Buffer[4]  * kernel_Buffer[2]
                  +ifmap_Buffer[8]  * kernel_Buffer[3]
                  +ifmap_Buffer[9]  * kernel_Buffer[4]
                  +ifmap_Buffer[10] * kernel_Buffer[5]
                  +ifmap_Buffer[14] * kernel_Buffer[6]
                  +ifmap_Buffer[15] * kernel_Buffer[7]
                  +ifmap_Buffer[16] * kernel_Buffer[8];
    cnn_layer[3] = ifmap_Buffer[3]  * kernel_Buffer[0]
                  +ifmap_Buffer[4]  * kernel_Buffer[1]
                  +ifmap_Buffer[5]  * kernel_Buffer[2]
                  +ifmap_Buffer[9]  * kernel_Buffer[3]
                  +ifmap_Buffer[10] * kernel_Buffer[4]
                  +ifmap_Buffer[11] * kernel_Buffer[5]
                  +ifmap_Buffer[15] * kernel_Buffer[6]
                  +ifmap_Buffer[16] * kernel_Buffer[7]
                  +ifmap_Buffer[17] * kernel_Buffer[8];
    cnn_layer[4] = ifmap_Buffer[6]  * kernel_Buffer[0]
                  +ifmap_Buffer[7]  * kernel_Buffer[1]
                  +ifmap_Buffer[8]  * kernel_Buffer[2]
                  +ifmap_Buffer[12] * kernel_Buffer[3]
                  +ifmap_Buffer[13] * kernel_Buffer[4]
                  +ifmap_Buffer[14] * kernel_Buffer[5]
                  +ifmap_Buffer[18] * kernel_Buffer[6]
                  +ifmap_Buffer[19] * kernel_Buffer[7]
                  +ifmap_Buffer[20] * kernel_Buffer[8];
    cnn_layer[5] = ifmap_Buffer[7]  * kernel_Buffer[0]
                  +ifmap_Buffer[8]  * kernel_Buffer[1]
                  +ifmap_Buffer[9]  * kernel_Buffer[2]
                  +ifmap_Buffer[13] * kernel_Buffer[3]
                  +ifmap_Buffer[14] * kernel_Buffer[4]
                  +ifmap_Buffer[15] * kernel_Buffer[5]
                  +ifmap_Buffer[19] * kernel_Buffer[6]
                  +ifmap_Buffer[20] * kernel_Buffer[7]
                  +ifmap_Buffer[21] * kernel_Buffer[8];
    cnn_layer[6] = ifmap_Buffer[8]  * kernel_Buffer[0]
                  +ifmap_Buffer[9]  * kernel_Buffer[1]
                  +ifmap_Buffer[10] * kernel_Buffer[2]
                  +ifmap_Buffer[14] * kernel_Buffer[3]
                  +ifmap_Buffer[15] * kernel_Buffer[4]
                  +ifmap_Buffer[16] * kernel_Buffer[5]
                  +ifmap_Buffer[20] * kernel_Buffer[6]
                  +ifmap_Buffer[21] * kernel_Buffer[7]
                  +ifmap_Buffer[22] * kernel_Buffer[8];
    cnn_layer[7] = ifmap_Buffer[9]  * kernel_Buffer[0]
                  +ifmap_Buffer[10] * kernel_Buffer[1]
                  +ifmap_Buffer[11] * kernel_Buffer[2]
                  +ifmap_Buffer[15] * kernel_Buffer[3]
                  +ifmap_Buffer[16] * kernel_Buffer[4]
                  +ifmap_Buffer[17] * kernel_Buffer[5]
                  +ifmap_Buffer[21] * kernel_Buffer[6]
                  +ifmap_Buffer[22] * kernel_Buffer[7]
                  +ifmap_Buffer[23] * kernel_Buffer[8];
    cnn_layer[8] = ifmap_Buffer[12] * kernel_Buffer[0]
                  +ifmap_Buffer[13] * kernel_Buffer[1]
                  +ifmap_Buffer[14] * kernel_Buffer[2]
                  +ifmap_Buffer[18] * kernel_Buffer[3]
                  +ifmap_Buffer[19] * kernel_Buffer[4]
                  +ifmap_Buffer[20] * kernel_Buffer[5]
                  +ifmap_Buffer[24] * kernel_Buffer[6]
                  +ifmap_Buffer[25] * kernel_Buffer[7]
                  +ifmap_Buffer[26] * kernel_Buffer[8];
    cnn_layer[9] = ifmap_Buffer[13] * kernel_Buffer[0]
                  +ifmap_Buffer[14] * kernel_Buffer[1]
                  +ifmap_Buffer[15] * kernel_Buffer[2]
                  +ifmap_Buffer[19] * kernel_Buffer[3]
                  +ifmap_Buffer[20] * kernel_Buffer[4]
                  +ifmap_Buffer[21] * kernel_Buffer[5]
                  +ifmap_Buffer[25] * kernel_Buffer[6]
                  +ifmap_Buffer[26] * kernel_Buffer[7]
                  +ifmap_Buffer[27] * kernel_Buffer[8];
    cnn_layer[10]= ifmap_Buffer[14] * kernel_Buffer[0]
                  +ifmap_Buffer[15] * kernel_Buffer[1]
                  +ifmap_Buffer[16] * kernel_Buffer[2]
                  +ifmap_Buffer[20] * kernel_Buffer[3]
                  +ifmap_Buffer[21] * kernel_Buffer[4]
                  +ifmap_Buffer[22] * kernel_Buffer[5]
                  +ifmap_Buffer[26] * kernel_Buffer[6]
                  +ifmap_Buffer[27] * kernel_Buffer[7]
                  +ifmap_Buffer[28] * kernel_Buffer[8];
    cnn_layer[11]= ifmap_Buffer[15] * kernel_Buffer[0]
                  +ifmap_Buffer[16] * kernel_Buffer[1]
                  +ifmap_Buffer[17] * kernel_Buffer[2]
                  +ifmap_Buffer[21] * kernel_Buffer[3]
                  +ifmap_Buffer[22] * kernel_Buffer[4]
                  +ifmap_Buffer[23] * kernel_Buffer[5]
                  +ifmap_Buffer[27] * kernel_Buffer[6]
                  +ifmap_Buffer[28] * kernel_Buffer[7]
                  +ifmap_Buffer[29] * kernel_Buffer[8];
    cnn_layer[12] =ifmap_Buffer[18] * kernel_Buffer[0]
                  +ifmap_Buffer[19] * kernel_Buffer[1]
                  +ifmap_Buffer[20] * kernel_Buffer[2]
                  +ifmap_Buffer[24] * kernel_Buffer[3]
                  +ifmap_Buffer[25] * kernel_Buffer[4]
                  +ifmap_Buffer[26] * kernel_Buffer[5]
                  +ifmap_Buffer[30] * kernel_Buffer[6]
                  +ifmap_Buffer[31] * kernel_Buffer[7]
                  +ifmap_Buffer[32] * kernel_Buffer[8];
    cnn_layer[13] =ifmap_Buffer[19] * kernel_Buffer[0]
                  +ifmap_Buffer[20] * kernel_Buffer[1]
                  +ifmap_Buffer[21] * kernel_Buffer[2]
                  +ifmap_Buffer[25] * kernel_Buffer[3]
                  +ifmap_Buffer[26] * kernel_Buffer[4]
                  +ifmap_Buffer[27] * kernel_Buffer[5]
                  +ifmap_Buffer[31] * kernel_Buffer[6]
                  +ifmap_Buffer[32] * kernel_Buffer[7]
                  +ifmap_Buffer[33] * kernel_Buffer[8];
    cnn_layer[14]= ifmap_Buffer[20] * kernel_Buffer[0]
                  +ifmap_Buffer[21] * kernel_Buffer[1]
                  +ifmap_Buffer[22] * kernel_Buffer[2]
                  +ifmap_Buffer[26] * kernel_Buffer[3]
                  +ifmap_Buffer[27] * kernel_Buffer[4]
                  +ifmap_Buffer[28] * kernel_Buffer[5]
                  +ifmap_Buffer[32] * kernel_Buffer[6]
                  +ifmap_Buffer[33] * kernel_Buffer[7]
                  +ifmap_Buffer[34] * kernel_Buffer[8];
    cnn_layer[15]= ifmap_Buffer[21] * kernel_Buffer[0]
                  +ifmap_Buffer[22] * kernel_Buffer[1]
                  +ifmap_Buffer[23] * kernel_Buffer[2]
                  +ifmap_Buffer[27] * kernel_Buffer[3]
                  +ifmap_Buffer[28] * kernel_Buffer[4]
                  +ifmap_Buffer[29] * kernel_Buffer[5]
                  +ifmap_Buffer[33] * kernel_Buffer[6]
                  +ifmap_Buffer[34] * kernel_Buffer[7]
                  +ifmap_Buffer[35] * kernel_Buffer[8];
end

//////////////////////////////////
//             relu             //
//////////////////////////////////

generate
for(i = 0; i < 16; i = i + 1)begin
    always @(*) begin
        if(!opt_reg)begin
            if(cnn_layer[i][15])begin
                relu_layer[i] = 0;
            end
            else begin
                relu_layer[i] = cnn_layer[i];      
            end
        end
        else begin
            relu_layer[i] = cnn_layer[i];
        end
    end
end
endgenerate

//////////////////////////////////
//          maxpooling          //
//////////////////////////////////

wire signed [15:0] compare_l1 [0:7];
wire signed [15:0] compare_l2 [0:3];

assign compare_l1[0] = (relu_layer[0] > relu_layer[1]) ? relu_layer[0] : relu_layer[1];
assign compare_l1[1] = (relu_layer[2] > relu_layer[3]) ? relu_layer[2] : relu_layer[3];
assign compare_l1[2] = (relu_layer[4] > relu_layer[5]) ? relu_layer[4] : relu_layer[5];
assign compare_l1[3] = (relu_layer[6] > relu_layer[7]) ? relu_layer[6] : relu_layer[7];
assign compare_l1[4] = (relu_layer[8] > relu_layer[9]) ? relu_layer[8] : relu_layer[9];
assign compare_l1[5] = (relu_layer[10] > relu_layer[11]) ? relu_layer[10] : relu_layer[11];
assign compare_l1[6] = (relu_layer[12] > relu_layer[13]) ? relu_layer[12] : relu_layer[13];
assign compare_l1[7] = (relu_layer[14] > relu_layer[15]) ? relu_layer[14] : relu_layer[15];

assign compare_l2[0] = (compare_l1[0] > compare_l1[2]) ? compare_l1[0] : compare_l1[2];
assign compare_l2[1] = (compare_l1[1] > compare_l1[3]) ? compare_l1[1] : compare_l1[3];
assign compare_l2[2] = (compare_l1[4] > compare_l1[6]) ? compare_l1[4] : compare_l1[6];
assign compare_l2[3] = (compare_l1[5] > compare_l1[7]) ? compare_l1[5] : compare_l1[7];

//////////////////////////////////
//            output            //
//////////////////////////////////

always@(posedge clk, negedge rst_n) begin
    if(!rst_n)begin
        out_valid <= 0;
    end
    else if(state == OUT)begin
        out_valid <= 1;
    end
    else begin
        out_valid <= 0;
    end
end


always@(posedge clk,negedge rst_n) begin
    if(!rst_n)begin
        out_data <= 0;
    end
    else if(state == OUT)begin
        out_data <= compare_l2[count];
    end
    else begin
        out_data <= 0;
    end

end

endmodule
