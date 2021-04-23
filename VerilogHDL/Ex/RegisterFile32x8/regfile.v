module regfile(outA,outB,In,Writeaddress,Readaddress_A,Readaddress_B,WE,RE_A,RE_B,CLK);
	output wire [7:0] outA,outB;
	input wire [7:0] In;
	input wire [4:0] Readaddress_A,Readaddress_B,Writeaddress;
	input wire WE,RE_A,RE_B,CLK;
	
	wire [31:0] outdecoder_write,outdecoder_readA,outdecoder_readB;
	
decoder5to32 decoder5to32_inst1(
	.outD(outdecoder_write[31:0]),
	.bitaddress(Writeaddress[4:0]),
	.WE(WE)
);

decoder5to32 decoder5to32_inst2(
	.outD(outdecoder_readA[31:0]),
	.bitaddress(Readaddress_A[4:0]),
	.WE(RE_A)
);

decoder5to32 decoder5to32_inst3(
	.outD(outdecoder_readB[31:0]),
	.bitaddress(Readaddress_B[4:0]),
	.WE(RE_B)
);

RFC_32 RFC_32_inst(
	.OutputA(outA[7:0]), 
	.OutputB(outB[7:0]), 
	.Input(In[7:0]), 
	.WriteSelect(outdecoder_write[31:0]), 
	.ReadSelectA(outdecoder_readA[31:0]), 
	.ReadSelectB(outdecoder_readB[31:0]), 
	.CLK(CLK)
);

endmodule
