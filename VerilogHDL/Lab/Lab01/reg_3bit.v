module reg_3bit(q,d,clk);
	output wire [2:0]q;
	input wire [2:0] d;
	input wire clk;
dflip dflip_inst[2:0](
	.q(q),
	.q_bar(),
	.d(d),
	.clk(clk)
);
endmodule
	