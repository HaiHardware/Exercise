module queue(out,outfront,outback,outsel,empty,full,in,reset,enable,RWS,clk,rst);
	output wire [7:0] out;
	output wire empty,full;
	input wire [7:0] in;
	input wire reset,clk,RWS,enable,rst;
	
	output wire [5:0] outfront,outback;
	output wire [4:0] outsel;
	wire control_sel,control_RWS;
	wire outxor;
	wire RWS_bar,outxor_bar;
	wire outcompa;
	not notRWS(RWS_bar,RWS);
	not notxor(outxor_bar,outxor);
	and and1(control_sel,RWS_bar,enable);
	and and2(control_RWS,enable,RWS);
	xor xor1(outxor,outfront[5],outback[5]);
	and and3(empty,outcompa,outxor_bar);
	and and4(full,outcompa,outxor);
	
counter front(
	.out(outfront),
	.e(control_sel),
	.reset(reset),
	.clk(clk)
);

counter back(
	.out(outback),
	.e(control_RWS),
	.reset(reset),
	.clk(clk)
);

comparator comparator_inst(
	.equal(outcompa),
	.in1(outback[4:0]),
	.in2(outfront[4:0])
);

mux21_5bit mux21_inst(
	.out(outsel[4:0]),
	.in1(outfront[4:0]),
	.in2(outback[4:0]),
	.sel(control_sel)
);

RAM RAM_inst(
	.Out(out),
	.In(in),
	.adr(outsel),
	.RWS(control_RWS),
	.CS(enable),
	.rst(rst)
);

endmodule 