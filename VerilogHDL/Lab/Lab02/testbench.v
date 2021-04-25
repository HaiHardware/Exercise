`timescale 1ns/1ps 
module testbench();
	wire out;
	wire out_t;
	wire [2:0] state_DUT,state_golden;
	reg [2:0] in;
	reg clk,clear;
moore_golden golden_inst(
  .out(out_t),
  .state(state_golden),
  .in(in),
  .clk(clk),
  .clear(clear)
);
moore moore_DUT(
  .out(out),
  .outq(state_DUT),
  .in(in),
  .clk(clk),
  .clear(clear)
);
task check;
  input [2:0] in_c;
  input out_c,out_t_c;
  input [2:0] state_DUT_c,state_golden_c;
  begin
    if(state_DUT_c==3'b100 && state_golden_c ==3'b100) begin
      if (out_c != out_t_c) begin
      $display("fail");
      end
      else begin
      $display("da phat hien 0703");   
	    $display("state moore_DUT = ",state_DUT_c);
      $display("state moore_golden = ",state_golden_c);
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
  $display("-------may trang thai moore phat hien chuoi ma so sinh vien: 0703");
  $display("chuoi so nhap tu ban phim: ");
  #30
  in = 3'd6;
  #60
  $display(in);
  $display("=> current state: ",state_DUT);
  in = 3'd0; 
  #60
  $display(in);
  $display("=> current state: ",state_DUT);
  in = 3'd7;
  #60
  $display(in);
  $display("=> current state: ",state_DUT);
  in = 3'd0; 
  #60
  $display(in);
  $display("=> current state: ",state_DUT);
  in = 3'd7; 
  #60
  $display(in);
  $display("=> current state: ",state_DUT);
  in = 3'd0; 
  #60
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
