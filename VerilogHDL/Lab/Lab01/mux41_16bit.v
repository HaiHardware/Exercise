module mux41_16bit(out,in1,in2,in3,in4,sel);

	parameter n=16;
	output wire [n-1:0] out;
	input wire [n-1:0] in1,in2,in3,in4;
	input wire [1:0] sel;
	
mux41_1bit mux41_1bit_inst[n-1:0](
	.out(out),
	.in1(in1),
	.in2(in2),
	.in3(in3),
	.in4(in4),
	.sel(sel)
);

endmodule
