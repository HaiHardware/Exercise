module full_adder(out,in1,in2,c_in,c_out);
	output wire out,c_out;
	input wire in1,in2,c_in;
	wire outxor1,outand1,outand2;
	
	xor xor1(outxor1,in1,in2);
	xor xor2 (out,c_in,outxor1);
	and and1(outand1,in1,in2);
	and and2(outand2,outxor1,c_in);
	or or2(c_out,outand1,outand2);
endmodule 
	