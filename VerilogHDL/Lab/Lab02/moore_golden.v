module moore_golden(out,state,in,clk,clear);
//Input and Output Declarations
  input	[2:0]	in;
  input clk;
  input clear;
  output out;
  output reg [2:0] 	state;

//DataInternal Variables
  
  reg [2:0] 	next_state;
//State Declarations
  parameter s0=3'b000;
  parameter s1=3'b001;
  parameter s2=3'b010;
  parameter s3=3'b011;
  parameter s4=3'b100;
//Combinational Next State Logic
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
      if (in == 3'd3)
		next_state = s4;
      else if (in==3'd0)
    next_state = s1;
      else if (in==3'd7)
    next_state = s2;
      else
		next_state = s0;
		
		s4:
		  if (in==3'd0)
		next_state = s1;
		  else 
		next_state = s0;
		
		
    default:
      next_state = s0;
  endcase // case(state)
  //State FF Transition
  end
always @(posedge clk) begin
  if (clear == 0)
    state <= s0;
  else
    state <= next_state;
  end
//Combinational Output Logic
assign out = (state == s4) ? 1: 0;

endmodule