`define CYCLE    10.0          	       // Modify your clock period here
module PATTERN(
	clk,
	reset,
	datain,
	cmd,
	cmd_valid,
	dataout,
	output_valid,
	busy
);
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION                         
//---------------------------------------------------------------------
output reg clk;
output reg reset;
output reg [7:0] datain;
output reg [2:0] cmd;
output reg cmd_valid;
input [7:0] dataout;
input output_valid;
input busy;

//---------------------------------------------------------------------
// PARAMETER DECLARATION
//---------------------------------------------------------------------
parameter IMAGE_N_PAT = 25;
parameter CMD_N_PAT = 30;
parameter OUT_LENGTH= 270;
parameter t_reset = `CYCLE*2;

integer       i, j, out_f, err, pattern_num;

integer latency = 0;
 	
//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION                             
//---------------------------------------------------------------------
reg   [7:0]   image_mem [0:IMAGE_N_PAT-1];
reg   [2:0]   cmd_mem   [0:CMD_N_PAT-1];
reg   [7:0]   out_mem   [0:OUT_LENGTH-1];
reg   [7:0]   out_temp;

reg           stop;
reg           over;

//---------------------------------------------------------------------
//CLK DECLARATION                             
//---------------------------------------------------------------------
always begin #(`CYCLE/2) clk = ~clk; end
//---------------------------------------------------------------------
//   TEST PATTERN                                         
//---------------------------------------------------------------------
`define IMAGE    "image.dat"
`define CMD      "cmd.dat"
`define EXPECT   "out_golden.dat"
initial	$readmemh (`IMAGE,  image_mem);
initial	$readmemh (`CMD,    cmd_mem);
initial	$readmemh (`EXPECT, out_mem);

initial begin
   clk         = 1'b0;
   reset       = 1'b0;
   cmd_valid   = 1'b0;
   stop        = 1'b0;  
   over        = 1'b0;
   pattern_num = 0;
   err         = 0;    
end

initial begin
   @(negedge clk)  reset = 1'b1;
   #t_reset        reset = 1'b0;
   
   @(negedge clk)    i=0;
   while (i <= CMD_N_PAT) begin               
      if(!busy) begin
        cmd = cmd_mem[i];
        cmd_valid = 1'b1;  
        
        if(cmd_mem[i] === 3'h0) begin    //cmd: Load data        
           for(j=0; j<=IMAGE_N_PAT; j=j+1)begin
              @(negedge clk) datain = image_mem[j];
                             cmd = 'hz; cmd_valid = 1'b0;
           end
           i = i+1;
        end
        else begin                      //cmd: other command
           @(negedge clk) datain='hz; cmd_valid = 1'b0; i = i+1;
        end       
      end 
      else begin
         datain='hz; cmd = 'hz;  cmd_valid = 0;
         @(negedge clk);
      end               
    end                                       
    stop = 1 ;      
end

always @(posedge clk)begin
   out_temp = out_mem[pattern_num];
   if(output_valid)begin
      $fdisplay(out_f,"%h", dataout);
      if(dataout !== out_temp) begin
         $display("\033[1;31m ========================================================\033[m");
			$display("\033[1;31m                   PATTERN %3d FAIL\033[m", pattern_num);
			$display("\033[1;31m          Your answer =  %d Correct answer = %d",dataout, out_temp);
			$display("\033[1;31m ========================================================\033[m");	
			$finish;
         err = err + 1 ;
      end
      pattern_num = pattern_num + 1;      
   end
   if(pattern_num === OUT_LENGTH)  over = 1'b1;
end

always @(posedge clk or posedge reset) begin
   if(reset)begin
      latency <= 0;
   end
   else begin
      latency <= latency + 1;
   end
end

initial begin
      @(posedge stop)      
      if((over) || (pattern_num!='h0)) begin
         if (err == 0)  begin
			$display("\n");
            $display("\033[1;35m =================================================================================================\033[m");
            $display("\033[1;35m                                        Congratulations!\033[m");
            $display("\033[1;35m                                 You have passed this pattern!!\033[m");	
	         $display("\033[1;35m   Please go to 09_SUBMMIT folder demo and submit your code (No need to submmit to E3 platform)");
	         $display("\033[1;35m =================================================================================================\033[m");
			$display("\n");
            $display("Your execution cycles : " , latency , " cycles" , "\n");
         end
         else 
            $display("FAIL! There are %d errors!\n", err);
            $display("---------------------------------------------\n");
      end
      else begin
        $display("---------------------------------------------\n");
        $display("Error!!! There is no any data output ...!\n");
        $display("-------------------FAIL-------------------\n");
        $display("---------------------------------------------\n");
      end
      $finish;
end

/*initial begin
	in_n0 =0;
	in_n1 =0;
	opt = 0;
    ans = 0;
 	
	seed = 253;
	NUM_PATTERN = 1000;

	@(negedge CLK);
    
	for( i = 1 ; i <= NUM_PATTERN; i = i + 1)
	begin    
		in_n0 ={1'b0 , $random(seed)%4'd8};		
		in_n1 ={1'b0 , $random(seed)%4'd8};		
		opt =  $random(seed)%2'd2;	

        n0=in_n0;
        n1=in_n1;
		case(opt)		
			1'b0: ans = n0 + n1;
			1'b1: ans = n0 - n1;   
		default: ans = ans;		
		endcase		
				
		@(negedge CLK)			
		if(ans !== out_n)
		begin		
		  $display("\033[1;31m   ******---------******---------******---------******   \033[m");		
		  $display("opt=%d ",opt);		
		  $display("in_n0: %d  in_n1: %d",in_n0, in_n1);		
		  $display("your ANS: %d correct ANS: %d",out_n, ans);		
		  $finish;				
		end		
		else begin
			$display("PATTERN %d pass", i);
		end
	end        
	pass_print;
	$finish;
end

task pass_print ;
begin
    $display("\033[1;35m You have passed this pattern!!\033[m");	
	$display("\033[1;31m   ******---------******   \033[m");		
	$display("\033[1;33m   **                 **   \033[m");
	$display("\033[1;32m   ** congratulation! **   \033[m");
	$display("\033[1;33m   **                 **   \033[m");	
	$display("\033[1;31m   ******---------******   \033[m");
end	
endtask*/

endmodule


