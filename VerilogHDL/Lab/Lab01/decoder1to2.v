module decoder1to2(out,in);
	output wire [1:0] out;
	input wire in;
	wire in_bar;
	not notin(in_bar,in);
	assign out[1] = {in};
	assign out[0] = {in_bar};


endmodule
