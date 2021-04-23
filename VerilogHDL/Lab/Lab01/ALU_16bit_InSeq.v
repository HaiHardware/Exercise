module ALU_16bit_InSeq(out,overflow,in1,in2,sel,clk_in1,clk_in2,clk_sel);
	output wire [15:0] out;
	output wire overflow;
	input wire [15:0] in1,in2;
	input wire [2:0] sel;
	input wire clk_in1,clk_in2,clk_sel;
	wire [15:0]outin1,outin2;
	wire [2:0]outsel;
reg_16bit reg_16bit_in1(
	.q(outin1),
	.d(in1),
	.clk(clk_in1)
);
reg_16bit reg_16bit_in2(
	.q(outin2),
	.d(in2),
	.clk(clk_in2)
);
reg_3bit reg_3bit_sel(
	.q(outsel),
	.d(sel),
	.clk(clk_sel)
);
ALU_16bit ALU_16bit_inst(
	.out(out),
	.overflow(overflow),
	.in1(outin1),
	.in2(outin2),
	.sel(outsel)
);
endmodule
