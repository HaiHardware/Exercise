module RFC_8(OutputA, OutputB, Input, WriteSelect, ReadSelectA, ReadSelectB, CLK);
	parameter n=8;
	output wire [n-1:0] OutputA,OutputB;
	input wire [n-1:0] Input;
	input wire WriteSelect,ReadSelectA,ReadSelectB,CLK;
	
RFC RFC_inst [n-1:0](
	.OutputA(OutputA[n-1:0]),
	.OutputB(OutputB[n-1:0]),
	.Input(Input[n-1:0]),
	.WriteSelect(WriteSelect),
	.ReadSelectA(ReadSelectA),
	.ReadSelectB(ReadSelectB),
	.CLK(CLK)
	

	
);
endmodule
	
	