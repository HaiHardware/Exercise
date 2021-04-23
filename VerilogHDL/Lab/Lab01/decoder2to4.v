module decoder2to4 (out,in);
	output wire [3:0] out;
	input wire [1:0] in;
	wire in_bar[1:0];
	
	
	not notin1 (in_bar[1],in[1]);
	not notin0 (in_bar[0],in[0]);
	and and1(out[3],in[1],in[0]);
	and and2(out[2],in[1],in_bar[0]);
	and and3(out[1],in_bar[1],in[0]);
	and and4(out[0],in_bar[1],in_bar[0]);
endmodule
