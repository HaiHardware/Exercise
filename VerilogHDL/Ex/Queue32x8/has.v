module has(inff,carry,d,q,c);
	output wire inff,carry;
	input wire d,q,c;
	
	wire d_bar,q_bar;
	wire outand1,outand2;
	not notd(d_bar,d);
	not notq(q_bar,q);
	
	and and1(outand1,d,q_bar,c);
	and and2(outand2,c,q,d_bar);
	or or1(carry,outand1,outand2);
	xor xor1(inff,c,q);
	
endmodule