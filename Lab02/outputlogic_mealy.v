module outputlogic_mealy(out,in,outq);
	output wire out;
	input wire [1:0] outq;
	input wire [2:0] in;
	wire [2:0]in_bar;
	wire [1:0]outq_bar;
	not notq(outq_bar[0],outq[0]);
	not notin(in_bar[2],in[2]);
	and and1(out,in_bar[2],in[1],in[0],outq[1],outq_bar[0]);
	
endmodule 
