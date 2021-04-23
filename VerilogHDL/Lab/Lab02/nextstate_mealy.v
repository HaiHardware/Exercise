module nextstate_mealy(out,in,outq);
	output wire [1:0] out;
	input wire [2:0] in;
	input wire [1:0] outq;
	wire [2:0] in_bar;
	wire outand1,outand2,outand3,outand4,outand6,outand7,outand8,outxor1;
	wire [1:0] outq_bar;
	not not11(in_bar[2],in[2]);
	not not22(in_bar[1],in[1]);
	not not33(in_bar[0],in[0]);
	not not44(outq_bar[1],outq[1]);
	not not55(outq_bar[0],outq[0]);
	
	and and11(outand1,in[2],in[1],in[0]);
	and and22(outand2,in_bar[2],in_bar[1],in_bar[0]);
	xor xor1(outxor1,outq[1],outq[0]);
	and and33(outand3,outand1,outxor1);
	and and44(outand4,outand2,outq[1],outq[0]);
	or d1_mealy(out[1],outand4,outand3);
	
	and and66(outand6,outand2,outq_bar[1],outq_bar[0]);
	and and77(outand7,outand2,outxor1);
	and and88(outand8,outand1,outxor1);
	or d0_mealy(out[0],outand6,outand7,outand8);
	
endmodule