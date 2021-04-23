module word_32(Out,In,RS,WE,rst);
	output wire [7:0]Out;
	input wire [7:0]In;
	input wire [31:0] RS;
	input wire WE,rst;
	
MC_8 MC_8_inst[31:0](
	.Out(Out[7:0]),
	.In(In[7:0]),
	.RS(RS[31:0]),
	.WE(WE),
	.rst(rst)
);
endmodule