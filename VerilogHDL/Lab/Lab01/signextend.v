module signextend(out,in);

	output wire  [15:0] out;
	input wire [4:0] in;
   assign out = {10'd0,in[4:0]};

endmodule 
	