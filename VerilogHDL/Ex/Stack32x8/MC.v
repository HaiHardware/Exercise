module MC (Out,In,RS,WE,rst);
	output wire Out;
	input wire RS,WE,In,rst;
	wire outand1;
	wire outlatch;
	and and1(outand1,RS,WE);
	//bufif1 bufif1_1(Out,outlatch,RS);
Tristate Tristate_inst(
	.out(Out),
	.in(outlatch),
	.oe(RS)
);
	
D_latch D_latch_inst(
	.q(outlatch),
	.d(In),
	.en(outand1),
	.rst(rst)
);

endmodule
