module mux21(out,in1,in2,sel);

	output wire out; 
	input wire in1,in2,sel;
	wire outand1,outand2;
	wire sel_bar;
	not notsel(sel_bar,sel);
	and and1(outand1,in1,sel);
	and and2(outand2,in2,sel_bar);
	or or1(out,outand1,outand2);
	
endmodule
	
	
	