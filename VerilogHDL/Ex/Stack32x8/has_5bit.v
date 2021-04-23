module has_5bit(out_d,d,q,e);
	output wire [4:0] out_d;
	input wire [4:0] q;
	input wire e,d;
	
	wire[4:0] carry_wire;
has has_inst[4:0](
	.inff(out_d),
	.carry(carry_wire[4:0]),
	.d(d),
	.q(q),
	.c({carry_wire[3:0],e})
);
endmodule