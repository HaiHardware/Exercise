module decoder3to8 (F,x,enable);
	output wire [7:0] F;
	input wire [2:0] x;
	input wire enable;
	wire x_bar[2:0];
	
	not notx2(x_bar[2],x[2]);
	not notx1(x_bar[1],x[1]);
	not notx0(x_bar[0],x[0]);
	and and1(F[7],x[2],x[1],x[0],enable);
	and and2(F[6],x[2],x[1],x_bar[0],enable);
	and and3(F[5],x[2],x_bar[1],x[0],enable);
	and and4(F[4],x[2],x_bar[1],x_bar[0],enable);
	and and5(F[3],x_bar[2],x[1],x[0],enable);
	and and6(F[2],x_bar[2],x[1],x_bar[0],enable);
	and and7(F[1],x_bar[2],x_bar[1],x[0],enable);
	and and8(F[0],x_bar[2],x_bar[1],x_bar[0],enable);
	
	
endmodule 
