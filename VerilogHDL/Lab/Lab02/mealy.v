module mealy(out,in,clear,clk);
	output wire out; 
	input wire [2:0] in;
	input wire clk,clear;
	wire [1:0] outq,ind;
	
	
d_ff d_ff_inst[1:0](
	.q(outq),
	.d(ind),
	.clk(clk),
	.clear(clear)
);

nextstate_mealy nextstate_ml_inst(
	.out(ind),
	.in(in),
	.outq(outq)
);

outputlogic_mealy outputlogic_ml_inst(
	.out(out),
	.in(in),
	.outq(outq)
);
endmodule
hi
