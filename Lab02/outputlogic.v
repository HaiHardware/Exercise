module outputlogic(out,in);
	output wire out;
	input wire [2:0] in;
	wire [1:0]in_bar;
	not not1(in_bar[1],in[1]);
	not not2(in_bar[0],in[0]);
	and and1(out,in[2],in_bar[1],in_bar[0]);
	
endmodule 
