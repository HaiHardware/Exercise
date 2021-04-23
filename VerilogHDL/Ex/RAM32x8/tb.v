`timescale 1ns/1ps 
module tb();
	wire [7:0] Out;
	reg [7:0] In;
	reg [4:0] adr;
	// write=1, read=0 
	reg RWS,CS;
	integer i;
	
//create the value for the input 
initial begin
	RWS = 1'b1;
	CS = 1'b1;
	In = 8'd0;
	adr = 5'd0;
	for(i=0;i<=50;i=i+1) begin
		#20
		In = In  + 8'd1;
		adr = adr + 5'd1;
	end 
#200 $finish;
end 
//create clock with period 10ns 
always @* begin
	 #10 RWS <= ~RWS;
end 
//instantiate the module needed to test
RAM RAM_inst(Out,In,adr,RWS,CS);
endmodule


