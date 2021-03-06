/*
  MIPS SINGLE CYCLE CPU IMPLEMENTED BY :   
  ARDESHIR  ALIREZA 
  92213118  92213034
*/
`include "MIPS_DEFINES.v"

module Data_Memory(
	input clk,
	input [31:0] addr,
	input rd_en,	
	output [31:0] out,	
	input  wr_en,	
	input [31:0] wr_data		
);	

// Write your code here. You can modify all of the codes

  reg [31:0] memory [0:200];
  reg [31:0] temp ;
  
  
	always@(*) begin
	  if (rd_en) 
	   temp <= memory[addr];	   
	end  
  	
  	assign out = temp;
  	
	always @(posedge clk) 
	 begin
	   if(wr_en)
	     memory[addr]<= wr_data;	       	   
  end
endmodule	