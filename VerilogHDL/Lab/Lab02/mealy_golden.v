module mealy_golden(out,state,in,clk,clear);
  input	[2:0]	in;
  input clk;
  input clear;
  output out;
  output reg [1:0] 	state;
  reg [1:0] 	next_state;

  parameter s0=2'b00;
  parameter s1=2'b01;
  parameter s2=2'b11;
  parameter s3=2'b10;

always @(state or in) begin
  case (state)
    s0:
      if (in==3'd0)
		next_state = s1;
      else
		next_state = s0;
		
    s1:
      if (in==3'd7)
		next_state = s2;
      else if (in==3'd0)
		next_state = s1;
		  else
		next_state = s0;
		
    s2:
      if (in==3'd0)
		next_state = s3;
      else
		next_state = s0;
		
    s3:
      if (in==3'd0)
    next_state = s1;
      else if (in==3'd7)
    next_state = s2;
      else
		next_state = s0;
    default:
      next_state = s0;
  endcase 
  end
always @(posedge clk) begin
  if (clear == 0)
    state <= s0;
  else
    state <= next_state;
  end
assign out = (state == s3 && in == 3) ? 1: 0;

endmodule

