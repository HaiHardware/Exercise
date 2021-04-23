module mux41_1bit(out,in1,in2,in3,in4,sel);

	output wire out;
	input wire [1:0] sel;
	input wire in1,in2,in3,in4;
	wire outinst1,outinst2;
	
mux21 mux21_inst1(
	.out(outinst1),
	.in1(in4),
	.in2(in3),
	.sel(sel[0])
);

mux21 mux21_inst2(
	.out(outinst2),
	.in1(in2),
	.in2(in1),
	.sel(sel[0])
);

mux21 mux21_inst3(
	.out(out),
	.in1(outinst1),
	.in2(outinst2),
	.sel(sel[1])
);
endmodule
	