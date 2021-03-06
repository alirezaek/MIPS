/*
  MIPS SINGLE CYCLE CPU IMPLEMENTED BY :   
  ARDESHIR  ALIREZA 
  92213118  92213034
*/
module Mux32bit_tb ; 
   
   reg [31:0] in1;
  reg [31:0] in2;
    reg sel;
    wire [31:0] out;
  
  Mux32bit mux1(
			.in1  (in1),
			.in2		(in2),
			.sel (sel),
			.out(out)
			); 
   
   
  initial begin     
   
   sel=1'b1;
   in1=8'b00001110;
   in2=8'b11110000;
   #100 sel=1'b0;
   
    
  end
 endmodule