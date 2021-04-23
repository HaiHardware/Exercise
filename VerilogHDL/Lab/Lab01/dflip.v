module dflip(q, q_bar, d, clk);
	output wire q, q_bar;
	input wire d, clk;
	
	wire d_bar;
	wire outnand1, outnand2, outnand3, outnand4, outnand5, outnand6;
	not notd(d_bar, d);
	nand nand1(outnand1, d, clk);
	nand nand2(outnand2, d_bar, clk);
	nand nand3(outnand3, outnand1, outnand4);
	nand nand4(outnand4, outnand2, outnand3);
	nand nand5(outnand5, outnand3, clk);
	nand nand6(outnand6, outnand4, clk);
	nand nand7(q, outnand5, q_bar);
	nand nand8(q_bar, outnand6, q);
	
endmodule
	