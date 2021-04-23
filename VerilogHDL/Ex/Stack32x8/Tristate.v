module Tristate (out,in,oe);

	 output  out;
    tri     out;
    input wire   in, oe;
    

    bufif1  b1(out,in,oe);

endmodule