module counter(out,e,d,reset,clk);
	output wire [4:0] out;
	input wire e,reset,d,clk;
	wire [4:0] outhas;

has_5bit has_inst(
	.out_d(outhas),
	.q(out),
	.d(d),
	.e(e)
);

d_ff d_ff_inst [4:0](
	.q(out),
	.d(outhas),
	.clk(clk),
	.clear(reset)
);

endmodule