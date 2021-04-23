module nextstate(out,in,outq);
	output wire [2:0] out;
	input wire [2:0] in,outq; //in = input outq = q;
	wire [2:0]in_bar,outq_bar;
	wire outand1,outand2,outand3,outor1;
	not not1(in_bar[2],in[2]);
	not not3(in_bar[1],in[1]);
	not not4(in_bar[0],in[0]);
	not not2(outq_bar[2],outq[2]);
	not not5(outq_bar[1],outq[1]);
	not not6(outq_bar[0],outq[0]);
	
	and d2(out[2],in_bar[2],in[1],in[0],outq_bar[2],outq[1],outq[0]);

	and and1(outand1,in[2],in[1],in[0],outq_bar[2],outq[0]);
	and and2(outand2,in_bar[2],in_bar[1],in_bar[0],outq_bar[2],outq[1],outq_bar[0]);
	or d1(out[1],outand1,outand2);

	and and3(outand3,outq_bar[1],outq_bar[0]);
	or or1(outor1,outand3,outq_bar[2]);
	and d0(out[0],outor1,in_bar[2],in_bar[1],in_bar[0]);
	
endmodule