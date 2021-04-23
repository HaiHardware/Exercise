`timescale 1ns/1ps 
module testbench();
	 wire [7:0] out;
	 wire empty,full;
	 wire [5:0] outfront,outback;
	 wire [4:0] outsel;
	 reg [7:0] in;
	 reg reset,clk,RWS,enable,rst;
	integer i;
//create the value for the input 
initial begin
  reset = 1'b0;
  rst = 1'b0;
  clk = 1'b0;
  RWS = 1'b1;
  enable = 1'b0;
  #60
  rst = 1'b1;
 	reset = 1'b1;
  enable = 1'b1;
	in = 8'd50;
	for(i=0;i<=90;i=i+1) begin
		#60
		in = in  + 8'd1;
		if ( i <= 30 ) begin 
		    RWS = 1'b1;
		end 
		else begin
		    RWS = 1'b0;
		end 
		if ( i==90) begin 
		    $finish;
		end 
	end 

end 
//create clock with period 10ns 
always @(clk) begin
	 #30 clk <= ~clk;

	     
end 
//instantiate the module needed to test
queue queue_x(out,outfront,outback,outsel,empty,full,in,reset,enable,RWS,clk,rst);
endmodule



