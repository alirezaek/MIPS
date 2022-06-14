/*
  MIPS SINGLE CYCLE CPU IMPLEMENTED BY :   
  ARDESHIR  ALIREZA 
  92213118  92213034
*/
`include "MIPS_DEFINES.v"
// Write your code here. You can modify all of the codes

module ALU(
	input [31:0] 		in1,
	input [31:0] 		in2,
	input [3:0]			control,
	output reg [31:0]	out,
	output	zero		
);

	assign zero = (out == 0);
	
	always @(control, in1, in2) begin 
		case (control) 
			`AND: out <= in1 & in2;
			`OR: out <= in1 | in2;
			`ADD: out <= in1 + in2;
			`SUB: out <= in1 - in2;
			`SLT: out <= $signed(in1) < $signed(in2) ? 1 : 0; // Signed comparison in Verilog with key word  $signed(x) !
			`NOR: out <= ~(in1 | in2); // result is nor
			`XOR: out <= in1 ^ in2;
			default: out <= 0;
		endcase			
	end

endmodule	

