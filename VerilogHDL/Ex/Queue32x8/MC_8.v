module MC_8(Out,In,RS,WE,rst);
	output wire [7:0] Out;
	input wire [7:0] In;
	input wire RS,WE,rst;
MC MC_inst[7:0](
	.Out(Out[7:0]),
	.In(In[7:0]),
	.RS(RS),
	.WE(WE),
	.rst(rst)
);
endmodule
