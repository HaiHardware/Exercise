module decoder3to8 (out,in);
	output wire [7:0] out;
	input wire [2:0] in;
	wire in_bar[2:0];
	
	not notin2(in_bar[2],in[2]);
	not notin1(in_bar[1],in[1]);
	not notin0(in_bar[0],in[0]);
	and and1(out[7],in[2],in[1],in[0]);
	and and2(out[6],in[2],in[1],in_bar[0]);
	and and3(out[5],in[2],in_bar[1],in[0]);
	and and4(out[4],in[2],in_bar[1],in_bar[0]);
	and and5(out[3],in_bar[2],in[1],in[0]);
	and and6(out[2],in_bar[2],in[1],in_bar[0]);
	and and7(out[1],in_bar[2],in_bar[1],in[0]);
	and and8(out[0],in_bar[2],in_bar[1],in_bar[0]);
	
	
endmodule 
