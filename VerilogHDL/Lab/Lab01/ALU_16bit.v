module ALU_16bit(out,overflow,in1,in2,sel);

	output wire [15:0] out;
	output wire overflow;
	 input wire [15:0] in1,in2;
	input wire [2:0] sel;
	wire [15:0] outFAS1;
	wire [15:0] outFAS2;
	wire [15:0] outFAS3;
	wire [15:0] outand;
	wire [15:0] outor;
	wire [15:0] outxor;
	wire overflow1,overflow2,overflow3;

overflow overflow_inst(
	.out(overflow),
	.in1(overflow1),
	.in2(overflow2),
	.in3(overflow3),
	.sel(sel)
);
	
full_adder_subtractor_16bit full_adder_subtractor_16bit_add(
	.out(outFAS1),
	.overflow(overflow1),
	.in1(in1),
	.in2(in2),
	.c_in(1'b0)
);

full_adder_subtractor_16bit full_adder_subtractor_16bit_addi(
	.out(outFAS2),
	.overflow(overflow2),
	.in1(in1),
	.in2(in2),
	.c_in(1'b0)
);

full_adder_subtractor_16bit full_adder_subtractor_16bit_sub(
	.out(outFAS3),
	.overflow(overflow3),
	.in1(in1),
	.in2(in2),
	.c_in(1'b1)
);

mdl_and mdl_and_inst(
	.out(outand),
	.in1(in1),
	.in2(in2)
);
mdl_or mdl_or_inst(
	.out(outor),
	.in1(in1),
	.in2(in2)
);
mdl_xor mdl_xor_inst(
	.out(outxor),
	.in1(in1),
	.in2(in2)
);

mux81_16bit mux81_16bit_inst(
	.out(out),
	.in1(16'd0),
	.in2(outFAS1),
	.in3(outFAS2),
	.in4(outFAS3),
	.in5(outand),
	.in6(outor),
	.in7(outxor),
	.in8(16'd0),
	.sel(sel)
);

endmodule 

