module mdl_or(out,in1,in2);
	output wire [15:0] out;
	input wire [15:0] in1,in2;
	or or_inst[15:0](out[15:0],in1[15:0],in2[15:0]);
endmodule
