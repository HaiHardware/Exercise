module D_latch (  input d,           // 1-bit input pin for data  
                  input en,          // 1-bit input pin for enabling the latch  
                  input rst,       // 1-bit input pin for active-low reset  
                  output reg q);     // 1-bit output pin for data output  
  
   // This always block is "always" triggered whenever en/rstn/d changes  
   // If reset is asserted, then the output will be zero   
   // Else as long as enable is high, output q follows input d  
  
   always @ (en or d or rst)
         if (~rst) begin 
          q = 1'b0;
        end  
      else if (en) begin  
            q = d; 
      end
endmodule  