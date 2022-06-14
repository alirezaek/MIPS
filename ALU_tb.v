/*
  MIPS SINGLE CYCLE CPU IMPLEMENTED BY :   
  ARDESHIR  ALIREZA 
  92213118  92213034
*/
module ALU_tb ; 
   
  reg [31:0] in1 , in2 ,control ; 
  wire [31:0] out;
  wire zero;
  
  ALU alu(
			.in1  (in1),
			.in2		(in2),
			.control (control),
			.out(out),
			.zero(zero)
			); 
   
  initial begin     
    in1 = 6'b000000;
    in2 = 6'b000001;    
    control  = 6'b000000;
    
    #100 
    
    in1=6'b000001;
    
    #100
    in1 = 6'b001010;
    control= 6'b000001;
  end
 endmodule