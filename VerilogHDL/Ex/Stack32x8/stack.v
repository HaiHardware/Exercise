module stack(out,outmux,empty,full,in,reset,push_pop,enable,clk,rst);
	output wire [7:0] out;
	output wire empty,full;
	input wire [7:0] in; 
	input wire reset,enable,push_pop,clk;
	input wire rst;
	wire [4:0] outtop,outtop__;
	output wire [4:0] outmux;
	
	wire push_pop_bar;
	wire outand1,outand2;
	not notpp(push_pop_bar,push_pop);
	and and1(outand1,push_pop,enable);
	and and2(outand2,push_pop_bar,enable);
	nor nor1(empty,outtop[4],outtop[3],outtop[2],outtop[1],outtop[0]);
	and and3(full,outtop__[4],outtop__[3],outtop__[2],outtop__[1],outtop__[0]);
counter top_inst(
	.out(outtop),
	.e(enable),
	.d(outand1),
	.reset(reset),
	.clk(clk)
);
counter top___inst(
	.out(outtop__),
	.e(enable),
	.d(outand1),
	.reset(reset),
	.clk(clk)
);
mux21_5bit mux_inst(
	.out(outmux),
	.in1(outtop),
	.in2(outtop__),
	.sel(outand2)
);
RAM RAM_inst(
	.Out(out),
	.In(in),
	.adr(outmux),
	.RWS(outand2),
	.CS(enable),
	.rst(rst)
);
endmodule 