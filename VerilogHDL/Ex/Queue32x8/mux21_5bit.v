module mux21_5bit(out,in1,in2,sel);

	parameter n = 5;
	output wire [n-1:0] out;
	input wire [n-1:0] in1,in2;
	input wire sel;
	
mux21 mux21_inst[n-1:0](
	.out(out),
	.in1(in1),
	.in2(in2),
	.sel(sel)
);
endmodule