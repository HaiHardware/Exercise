module comparator(equal,in1,in2);
	output wire equal;
	input wire [4:0] in1,in2;
	
	wire x0,x1,x2,x3,x4;
	
	xnor xnor4(x4,in1[4],in2[4]);
	xnor xnor3(x3,in1[3],in2[3]);
	xnor xnor2(x2,in1[2],in2[2]);
	xnor xnor1(x1,in1[1],in2[1]);
	xnor xnor0(x0,in1[0],in2[0]);
	and and5(equal,x4,x3,x2,x1,x0);
	
endmodule