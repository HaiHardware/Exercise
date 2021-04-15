`timescale 1ns/1ps 
module testbench();
	wire [7:0] outA,outB;
	reg [7:0] In;
	reg [4:0] Readaddress_A,Readaddress_B,Writeaddress;
	reg WE,RE_A,RE_B,CLK;
	integer i;
	
//create the value for the input 
initial begin
	CLK  = 1'b0;
	WE = 1'b1;
	RE_A = 1'b1;
	RE_B = 1'b1;
	In = 8'd0;
	Writeaddress = 5'd0;
	Readaddress_A = 5'd0;
	Readaddress_B = 5'd0;
	for(i=0;i<=50;i=i+1) begin
		#30
		In = In  + 8'd1;
		Writeaddress = Writeaddress + 5'd1;
		Readaddress_A = Readaddress_A + 5'd1;
		Readaddress_B = Readaddress_B + 5'd1;
	 end
	 #5000 $finish;
end
//create clock with period 10ns 
 always	#15 CLK <= ~CLK;

//instantiate the module needed to test
regfile reg_inst(outA,outB,In,Writeaddress,Readaddress_A,Readaddress_B,WE,RE_A,RE_B,CLK);
endmodule

