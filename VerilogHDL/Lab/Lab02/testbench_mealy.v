`timescale 1ns/1ps 
module testbench_mealy();
	wire out;
	wire out_t;
	wire [1:0] state_DUT,state_golden;
	reg [2:0] in;
	reg clk,clear;
mealy_golden golden_inst2(
  .out(out_t),
  .state(state_golden),
  .in(in),
  .clk(clk),
  .clear(clear)
);
mealy mealy_DUT(
  .out(out),
  .outq(state_DUT),
  .in(in),
  .clk(clk),
  .clear(clear)
);
task check;
  input [2:0] in_c;
  input out_c,out_t_c;
  input [1:0] state_DUT_c,state_golden_c;
  begin
    if(state_DUT_c==2'b10 && state_golden_c ==2'b10 && in_c == 3'd3) begin
      if (out_c != out_t_c) begin
      $display("fail");
      end
      else begin
      #60
      $display("da phat hien 0703");   
	    $display("state mealy_DUT = ",state_DUT_c);
      $display("state mealt_golden = ",state_golden_c);
      $display("out_DUT = ",out_c);
      $display("expected out = ",out_t_c);
      $display("=> ----Correct Function!----");
      end
    end
  end
endtask
initial begin
  clear = 1'b1;
  clk = 1'b0;
  $display("-------may trang thai mealy phat hien chuoi ma so sinh vien: 0703");
  $display("chuoi so nhap tu ban phim: ");
  #30
  in = 3'd6;
  #45
  $display(in);
  $display("=> current state: ",state_DUT);
  in = 3'd0; 
  #45
  $display(in);
  $display("=> current state: ",state_DUT);
  in = 3'd7;
  #45
  $display(in);
  $display("=> current state: ",state_DUT);
  in = 3'd0; 
  #60
  $display(in);
  $display("=> current state: ",state_DUT);
  in = 3'd7; 
  #75
  $display(in);
  $display("=> current state: ",state_DUT);
  in = 3'd0; 
  #45
  $display(in);
  $display("=> current state: ",state_DUT);
  in = 3'd3;
  $display(in);
  #1500 $finish;
end
always @(clk) begin
  #30 clk <= ~clk;
end
always@(in or out) begin
  check(in,out,out_t,state_DUT,state_golden);
end
endmodule


