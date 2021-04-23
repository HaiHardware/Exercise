module has_5bit(out_d,q,e);
	output wire [5:0] out_d;
	input wire [5:0] q;
	input wire e;
	
	wire[5:0] carry_wire;
has has_inst[5:0](
	.inff(out_d),
	.carry(carry_wire[5:0]),
	.d(1'd0),
	.q(q),
	.c({carry_wire[4:0],e})
);
endmodule