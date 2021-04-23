module moore(out,in,clear,clk);
	output wire out; 
	input wire [2:0] in;
	input wire clk,clear;
	wire [2:0] outq,ind;
	
	
d_ff d_ff_inst[2:0](
	.q(outq),
	.d(ind),
	.clk(clk),
	.clear(clear)
);

nextstate nextstate_inst(
	.out(ind),
	.in(in),
	.outq(outq)
);

outputlogic outputlogic_inst(
	.out(out),
	.in(outq)
);
endmodule