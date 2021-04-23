module mux81_16bit(out,in1,in2,in3,in4,in5,in6,in7,in8,sel);

	parameter n=16;
	output wire [n-1:0] out;
	input wire [2:0] sel;
	input wire [n-1:0] in1,in2,in3,in4,in5,in6,in7,in8;
	
mux81_1bit mux81_1bit_inst[n-1:0](
	.out(out),
	.in1(in8),
	.in2(in7),
	.in3(in6),
	.in4(in5),
	.in5(in4),
	.in6(in3),
	.in7(in2),
	.in8(in1),
	.sel(sel)
);
endmodule
