module overflow (out,in1,in2,in3,sel);
	output tri out;
	input wire in1,in2,in3;
	input wire [2:0] sel;
	wire [2:0] sel_bar;
	not nots2 (sel_bar[2],sel[2]);
	not nots1 (sel_bar[1],sel[1]);
	not nots0 (sel_bar[0],sel[0]);
	wire outand1,outand2,outand3;
	and and1(outand1,sel_bar[2],sel_bar[1],sel[0]);
	and and2(outand2,sel_bar[2],sel[1],sel_bar[0]);
	and and3(outand3,sel_bar[2],sel[1],sel[0]);
	bufif1 entri1 (out,in1,outand1);
	bufif1 entri2 (out,in2,outand2);
	bufif1 entri3 (out,in3,outand3);
	
endmodule	