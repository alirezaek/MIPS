/*
  MIPS SINGLE CYCLE CPU IMPLEMENTED BY :   
  ARDESHIR  ALIREZA 
  92213118  92213034
*/
module Mux32bit(    
    input [31:0] in1,
    input [31:0] in2,
    input sel,
    output [31:0] out
);

// Write your code here. You can modify all of the codes
  reg [31:0] temp;
  always @(*) begin
    if(sel)
      temp=in2;
    else
      temp=in1;
  end
  assign out=temp;

endmodule
