/*
  MIPS SINGLE CYCLE CPU IMPLEMENTED BY :   
  ARDESHIR  ALIREZA 
  92213118  92213034
*/
module SignExtend_tb;
  
  reg [15:0] in;
  wire [31:0] out;
  SignExtend se (
    .in (in),
    .out(out)
    );
    
    initial begin
      in=16'b0000101011001000;

      #300
      
      in=16'b1110111011001000;      
    end
    
  endmodule
  