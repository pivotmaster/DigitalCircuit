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

//////////////////////////////////
//              reg             //
//////////////////////////////////

reg signed [15:0] ifmap_Buffer[0:5][0:5];   
reg signed [15:0] kernel_Buffer[0:8];  

reg [5:0] count;

reg [2:0] state, next_state;

reg signed [15:0] conv_layer[0:15];
reg signed [15:0] relu_layer[0:15];

reg opt_reg;

genvar i;

//////////////////////////////////
//              FSM             //
//////////////////////////////////
parameter IDLE = 'd0;
parameter READ = 'd1;
parameter CAL  = 'd2;
parameter OUT  = 'd3;

always @(posedge clk or negedge rst_n) begin
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
                next_state <= CAL;
            end
            else begin
                next_state <= READ;
            end
        end
        CAL:begin
            if(count == 'd16)begin
                next_state <= OUT;
            end
            else begin
                next_state <= CAL;
            end
        end
        OUT:begin
            if(count == 'd3)begin
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
always @(posedge clk) begin
    if(in_valid && count == 0)begin
        opt_reg <= opt;
    end
end

always@(posedge clk) begin
	if(in_valid && (count < 36 && count >= 0))begin
        ifmap_Buffer[count/6][count%6] <= in_data;
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
	else if(count == 'd16 && state == CAL) begin
		count <= 'd0;
	end
    else if(count == 'd3 && state == OUT) begin
		count <= 'd0;
	end  
    else if(state == CAL || state == OUT) begin
		count <= count + 'd1;
	end                  
	else begin
		count <= count;
	end 
end

wire [2:0] row = count[4:2];
wire [2:0] col = count[1:0];

//////////////////////////////////
//             conv             //
//////////////////////////////////
always@(posedge clk) begin
    if(count < 16 && state == CAL)begin
        conv_layer[count] <= ifmap_Buffer[row  ][col  ] * kernel_Buffer[0] +
                             ifmap_Buffer[row  ][col+1] * kernel_Buffer[1] +
                             ifmap_Buffer[row  ][col+2] * kernel_Buffer[2] +
                             ifmap_Buffer[row+1][col  ] * kernel_Buffer[3] +
                             ifmap_Buffer[row+1][col+1] * kernel_Buffer[4] +
                             ifmap_Buffer[row+1][col+2] * kernel_Buffer[5] +
                             ifmap_Buffer[row+2][col  ] * kernel_Buffer[6] +
                             ifmap_Buffer[row+2][col+1] * kernel_Buffer[7] +
                             ifmap_Buffer[row+2][col+2] * kernel_Buffer[8] ;
    end
end

//////////////////////////////////
//             relu             //
//////////////////////////////////
generate
for(i = 0; i < 16; i = i + 1)begin
    always @(posedge clk) begin
        if(!opt_reg)begin
            if(conv_layer[i][15])begin
                relu_layer[i] <= 0;
            end
            else begin
                relu_layer[i] <= conv_layer[i];      
            end
        end
        else begin
            relu_layer[i] <= conv_layer[i];
        end
    end
end
endgenerate

//////////////////////////////////
//          maxpooling          //
//////////////////////////////////
wire signed [15:0] maxpool_l1 [0:7];
wire signed [15:0] maxpool_l2 [0:3];

assign maxpool_l1[0] = (relu_layer[0]  > relu_layer[1])  ? relu_layer[0]  : relu_layer[1];
assign maxpool_l1[1] = (relu_layer[2]  > relu_layer[3])  ? relu_layer[2]  : relu_layer[3];
assign maxpool_l1[2] = (relu_layer[4]  > relu_layer[5])  ? relu_layer[4]  : relu_layer[5];
assign maxpool_l1[3] = (relu_layer[6]  > relu_layer[7])  ? relu_layer[6]  : relu_layer[7];
assign maxpool_l1[4] = (relu_layer[8]  > relu_layer[9])  ? relu_layer[8]  : relu_layer[9];
assign maxpool_l1[5] = (relu_layer[10] > relu_layer[11]) ? relu_layer[10] : relu_layer[11];
assign maxpool_l1[6] = (relu_layer[12] > relu_layer[13]) ? relu_layer[12] : relu_layer[13];
assign maxpool_l1[7] = (relu_layer[14] > relu_layer[15]) ? relu_layer[14] : relu_layer[15];

assign maxpool_l2[0] = (maxpool_l1[0] > maxpool_l1[2]) ? maxpool_l1[0] : maxpool_l1[2];
assign maxpool_l2[1] = (maxpool_l1[1] > maxpool_l1[3]) ? maxpool_l1[1] : maxpool_l1[3];
assign maxpool_l2[2] = (maxpool_l1[4] > maxpool_l1[6]) ? maxpool_l1[4] : maxpool_l1[6];
assign maxpool_l2[3] = (maxpool_l1[5] > maxpool_l1[7]) ? maxpool_l1[5] : maxpool_l1[7];

//////////////////////////////////
//            output            //
//////////////////////////////////
always@(posedge clk or negedge rst_n) begin
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

always@(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        out_data <= 0;
    end
    else if(state == OUT)begin
        out_data <= maxpool_l2[count];
    end
    else begin
        out_data <= 0;
    end
end

endmodule