module RFC(OutputA, OutputB, Input, WriteSelect, ReadSelectA, ReadSelectB, CLK);
	output wire OutputA, OutputB;
	input wire Input,WriteSelect, ReadSelectA, ReadSelectB,CLK;
	
	wire WriteSelect_bar;
	wire outQ,outOR,outand1,outand2;
	not notWS(WriteSelect_bar, WriteSelect);
	and and1(outand1,outQ,WriteSelect_bar);
	and and2(outand2,Input,WriteSelect);
	or or1(outOR,outand1,outand2);
	bufif1 tri_1(OutputA,outQ,ReadSelectA);
	bufif1 tri_2(OutputB,outQ,ReadSelectB);
	
dflip dflip_inst(
	.q(outQ),
	.d(outOR),
	.clk(CLK),
	.q_bar()
);
endmodule

	