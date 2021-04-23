module mdl_xor(out,in1,in2);
	output wire [15:0] out;
	input wire [15:0] in1,in2;
	xor xor_inst[15:0](out[15:0],in1[15:0],in2[15:0]);
endmodule
