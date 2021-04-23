module counter(out,e,reset,clk);
	output wire [5:0] out;
	input wire e,reset,clk;
	wire [5:0] outhas;

has_5bit has_inst(
	.out_d(outhas),
	.q(out),
	.e(e)
);

d_ff d_ff_inst [5:0](
	.q(out),
	.d(outhas),
	.clk(clk),
	.clear(reset)
);

endmodule