`timescale 1ns/1ps 
module testbench();
  wire [7:0] out;
	wire empty,full;
	wire [4:0] outmux;
  reg [7:0] in; 
	reg reset,enable,push_pop,clk;
	reg rst;
	integer i;
initial begin 
	  rst = 1'b0;
	  reset = 1'b0;
	  clk = 1'b0;
	  push_pop=1'b0;
	  enable = 1'b0;
	  #72
	  enable = 1'b1;
	  
	  rst = 1'b1;
	  
	  reset = 1'b1;
	  
	  in = 8'd49;
	  
	  for (i=0;i<=90;i=i+1) begin 
	   #72 
	     in= in + 8'd1;
	   if (i<=27) begin
	     push_pop = 1'b0;
	     end
	    else begin 
	      push_pop = 1'b1;
	      end
	    if ( i==90) begin 
	      $finish;
	      end
	  end
end
always @(clk) begin 
  #36 clk <= ~clk;
end	  

stack stack_DUT(out,outmux,empty,full,in,reset,push_pop,enable,clk,rst);
endmodule
