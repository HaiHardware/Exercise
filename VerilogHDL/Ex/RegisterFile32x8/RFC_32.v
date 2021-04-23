module RFC_32(OutputA, OutputB, Input, WriteSelect, ReadSelectA, ReadSelectB, CLK);
	parameter n=32;
	parameter m=8;
	output wire [m-1:0] OutputA,OutputB;
	input wire [m-1:0]Input;
	input wire [n-1:0] WriteSelect,ReadSelectA,ReadSelectB;
	input wire CLK;
	
RFC_8 RFC_8_inst [n-1:0](
	.OutputA(OutputA[m-1:0]),
	.OutputB(OutputB[m-1:0]),
	.Input(Input[m-1:0]),
	.WriteSelect(WriteSelect[n-1:0]),
	.ReadSelectA(ReadSelectA[n-1:0]),
	.ReadSelectB(ReadSelectB[n-1:0]),
	.CLK(CLK)
	
	
	
);
endmodule
	
	