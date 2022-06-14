/*
  MIPS SINGLE CYCLE CPU IMPLEMENTED BY :   
  ARDESHIR  ALIREZA 
  92213118  92213034
*/
module Register_File (
	input clk,
	
	input [4:0] rd1_addr,
	output [31:0] rd1_data,
	
	input [4:0] rd2_addr,	
	output [31:0] rd2_data,	
	
	input wr_en, 
	input [4:0] wr_addr,
	input [31:0] wr_data 	
);

// Write your code here. You can modify all of the codes	
	
  reg [31:0] registers [0:31];
  assign rd1_data = registers[rd1_addr];
	assign rd2_data = registers[rd2_addr];
	
	always @(posedge clk) 
	 begin
	  if (wr_en) 
      registers[wr_addr] <= wr_data; 
 end
	
endmodule