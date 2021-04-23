module RAM(Out,In,adr,RWS,CS,rst);
	output wire [7:0] Out;
	input wire [7:0] In;
	input wire [4:0] adr;
	input wire RWS,CS,rst;// write=1, read=0 
	
	wire RWS_bar;
	wire outand1,outand2;//write enable
	wire [7:0] word_32_to_tri;
	wire [31:0] d_to_word;
	
	not notRWS(RWS_bar,RWS);
	and and1(outand1,RWS,CS);
	and and2(outand2,RWS_bar,CS);

//	bufif1 bufif1_1(Out[7],word_32_to_tri[7],outand2);
//	bufif1 bufif1_2(Out[6],word_32_to_tri[6],outand2);
//	bufif1 bufif1_3(Out[5],word_32_to_tri[5],outand2);
//	bufif1 bufif1_4(Out[4],word_32_to_tri[4],outand2);
//	bufif1 bufif1_5(Out[3],word_32_to_tri[3],outand2);
//	bufif1 bufif1_6(Out[2],word_32_to_tri[2],outand2);
//	bufif1 bufif1_7(Out[1],word_32_to_tri[1],outand2);
//	bufif1 bufif1_8(Out[0],word_32_to_tri[0],outand2);
Tristate Tristate_inst[7:0](
	.out(Out[7:0]),
	.in(word_32_to_tri[7:0]),
	.oe(outand2)
);
	
decoder5to32 decoder5to32_inst(
	.outD(d_to_word[31:0]),
	.bitaddress(adr[4:0])
);

word_32 word_32_inst(
	.Out(word_32_to_tri[7:0]),
	.In(In[7:0]),
	.RS(d_to_word[31:0]),
	.WE(outand1),
	.rst(rst)
);
endmodule
