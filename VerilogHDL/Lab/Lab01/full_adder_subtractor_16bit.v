module full_adder_subtractor_16bit(out,overflow,in1,in2,c_in);
	output wire [15:0] out;
	output wire overflow;
	input wire [15:0] in1,in2;
	input wire c_in;
	wire [14:0] CO;
	wire c_last;
	wire [15:0] outxor;
	
xor xor1(overflow,c_last,CO[14]);
xor xor_15[15:0](outxor[15:0],c_in,in2[15:0]);

full_adder full_adder_inst1(
	.out(out[15]),
	.c_out(c_last),
	.in1(in1[15]),
	.in2(outxor[15]),
	.c_in(CO[14])
);
full_adder full_adder_inst2[14:1](
	.out(out[14:1]),
	.c_out(CO[14:1]),
	.in1(in1[14:1]),
	.in2(outxor[14:1]),
	.c_in(CO[13:0])
);
full_adder full_adder_inst3(
	.out(out[0]),
	.c_out(CO[0]),
	.in1(in1[0]),
	.in2(outxor[0]),
	.c_in(c_in)
);

endmodule
