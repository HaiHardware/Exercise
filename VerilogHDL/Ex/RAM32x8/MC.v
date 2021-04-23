module MC (Out,In,RS,WE);
	output wire Out;
	input wire RS,WE,In;
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
	.c(outand1),
	.q_bar()
);

endmodule
