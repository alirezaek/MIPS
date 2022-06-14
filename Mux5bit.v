/*
  MIPS SINGLE CYCLE CPU IMPLEMENTED BY :   
  ARDESHIR  ALIREZA 
  92213118  92213034
*/
module Mux5bit(    
    input [4:0] in1,
    input [4:0] in2,
    input sel,
    output [4:0] out
);	

// Write your code here. You can modify all of the codes

reg [4:0] temp;
  always @(*) begin
    if(sel)
      temp=in2;
    else
      temp=in1;
  end
  assign out=temp;

endmodule
