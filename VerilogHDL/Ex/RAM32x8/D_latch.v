module D_latch (q,q_bar,d,c);
	output wire q,q_bar;
	input wire d,c;
	wire d_bar;
	wire outand1,outand2;
	not notd(d_bar,d);
	and and1(outand1,d_bar,c);
	and and2(outand2,d,c);
	nor nor1(q,outand1,q_bar);
	nor nor2(q_bar,outand2,q);
endmodule 