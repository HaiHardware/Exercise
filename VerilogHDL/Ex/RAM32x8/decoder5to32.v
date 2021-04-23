module decoder5to32(outD,bitaddress);
	output wire [31:0] outD;
	input wire [4:0] bitaddress;
	wire [3:0] outdecoder2to4;
	
decoder2to4 decoder2to4_inst(
	.x(bitaddress[4:3]),
	.F(outdecoder2to4[3:0])
);

decoder3to8 decoder3to8_inst1(
	.F(outD[31:24]),
	.x(bitaddress[2:0]),
	.enable(outdecoder2to4[3])
);

decoder3to8 decoder3to8_inst2(
	.F(outD[23:16]),
	.x(bitaddress[2:0]),
	.enable(outdecoder2to4[2])
);

decoder3to8 decoder3to8_inst3(
	.F(outD[15:8]),
	.x(bitaddress[2:0]),
	.enable(outdecoder2to4[1])
);

decoder3to8 decoder3to8_inst4(
	.F(outD[7:0]),
	.x(bitaddress[2:0]),
	.enable(outdecoder2to4[0])
);
endmodule
	