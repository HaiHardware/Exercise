module decoder2to4 (F,x);
	output wire [3:0] F;
	input wire [1:0] x;
	wire x_bar[1:0];
	
	
	not notx1 (x_bar[1],x[1]);
	not notx0 (x_bar[0],x[0]);
	and and1(F[3],x[1],x[0]);
	and and2(F[2],x[1],x_bar[0]);
	and and3(F[1],x_bar[1],x[0]);
	and and4(F[0],x_bar[1],x_bar[0]);
endmodule
