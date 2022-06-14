/*
  MIPS SINGLE CYCLE CPU IMPLEMENTED BY :   
  ARDESHIR  ALIREZA 
  92213118  92213034
*/
`include "MIPS_DEFINES.v"

module Instruction_Memory(
	input [31:0] addr,
	output [31:0] out
);

  // Write your code here. You can modify all of the codes
	reg [31:0] memory [0:200];
	
	 /*initial begin
	  $readmemh("inputi.hex", memory);
	  end*/
	 
	 assign out = memory [addr/4];
	  
	
	
endmodule	
	