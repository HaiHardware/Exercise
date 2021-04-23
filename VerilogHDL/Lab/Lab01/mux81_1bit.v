module mux81_1bit(out,in1,in2,in3,in4,in5,in6,in7,in8,sel);

	output wire out;
	input wire [2:0] sel;
	input wire in1,in2,in3,in4,in5,in6,in7,in8;
	wire outinst1,outinst2;
mux41_1bit mux41_1bit_inst1(
	.out(outinst1),
	.in1(in8),
	.in2(in7),
	.in3(in6),
	.in4(in5),
	.sel(sel[1:0])
);
mux41_1bit mux41_1bit_inst2(
	.out(outinst2),
	.in1(in4),
	.in2(in3),
	.in3(in2),
	.in4(in1),
	.sel(sel[1:0])
);
mux21 mux21_inst(
	.out(out),
	.in1(outinst2),
	.in2(outinst1),
	.sel(sel[2])
);
endmodule
