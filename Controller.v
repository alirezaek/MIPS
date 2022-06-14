/*
  MIPS SINGLE CYCLE CPU IMPLEMENTED BY :   
  ARDESHIR  ALIREZA 
  92213118  92213034
*/
/********************************** Controller Unit for MIPS CPU (You Can Use Bit-Map Method) ********************************/  
`include "MIPS_DEFINES.v"	

module Controller(		
// Write input and output signals

output reg Regdst,
output reg ALUSrc,
output reg MemtoReg,
output reg RegWrite,
output reg MemRead,
output reg MemWrite,
output reg Branch,
output reg [3:0] ALUop,
output reg Jump,

input [5:0] opcode,
input [5:0] funct

);	
reg temp;
always @(*) begin 
		
		if (opcode==6'b000000) begin //----R-Type----
		  case (funct) 
			`FUNCT_ADD: begin			   
			   Regdst=1'b1;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b1;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`ADD;
			  end
			  
			  /*`FUNCT_ADDU: begin		   
			   Regdst=1'b1;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b0;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   ALUop=4'b0000;
			  end*/
        
        `FUNCT_AND: begin		   
			   Regdst=1'b1;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b1;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`AND;
			  end
			   `FUNCT_OR: begin		   
			   Regdst=1'b1;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b1;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`OR;
			  end
			  `FUNCT_NOR: begin		   
			   Regdst=1'b1;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b1;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`NOR;
			  end
			  /* `FUNCT_SRA: begin		   
			   Regdst=1'b1;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b0;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   ALUop=4'b0000;
			  end
			  `FUNCT_SRL: begin		   
			   Regdst=1'b1;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b0;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   ALUop=4'b0000;
			  end	
			  `FUNCT_SRLV: begin		   
			   Regdst=1'b1;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b0;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   ALUop=4'b0000;
			  end		
			  */	 
			  `FUNCT_SUB: begin		   
			   Regdst=1'b1;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b1;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`SUB;
			  end
			 /* `FUNCT_SUBU: begin		   
			   Regdst=1'b1;
			   ALUSrc=1'b1;
			   MemtoReg=1'b0;
			   RegWrite=1'b0;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   ALUop=`OR;
			  end
			  */
			  `FUNCT_XOR: begin		   
			   Regdst=1'b1;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b1;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`XOR;
			  end
			  `FUNCT_SLT: begin		   
			   Regdst=1'b1;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b1;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`SLT;
			  end 
			  default: begin    
			   Regdst=1'b0;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b0;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`ADD;
			   end
		  endcase
		  end	
		else begin
		   case(opcode)
		      `LW: begin		   
			   Regdst=1'b0;
			   ALUSrc=1'b1;
			   MemtoReg=1'b1;
			   RegWrite=1'b1;
			   MemRead=1'b1;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`ADD;
			  end 
			  `SW: begin		   
			   Regdst=1'b0;
			   ALUSrc=1'b1;
			   MemtoReg=1'b0;
			   RegWrite=1'b0;
			   MemRead=1'b0;
			   MemWrite=1'b1;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`ADD;
			  end 
			  `BEQ: begin		   
			   Regdst=1'b0;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b0;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b1;
			   Jump=1'b0;
			   ALUop=`SUB;
			  end
			  `BNE: begin		// control signal bne ro nemidanestim ! hamoon beq ro gozashtim   
			   Regdst=1'b0;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b0;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b1;
			   Jump=1'b0;
			   ALUop=`SUB;
			  end  
			  `ADDI: begin		   
			   Regdst=1'b0;
			   ALUSrc=1'b1;
			   MemtoReg=1'b0;
			   RegWrite=1'b1;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`ADD;
			  end
			  `ANDI: begin		   
			   Regdst=1'b1;
			   ALUSrc=1'b1;
			   MemtoReg=1'b0;
			   RegWrite=1'b1;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`AND;
			  end
			  `ORI: begin		   
			   Regdst=1'b1;
			   ALUSrc=1'b1;
			   MemtoReg=1'b0;
			   RegWrite=1'b0;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`OR;
			  end
			  `SLTI: begin
			    Regdst=1'b1;
			   ALUSrc=1'b1;
			   MemtoReg=1'b0;
			   RegWrite=1'b1;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`SLT;
			   end
			  `J: begin		   
			   Regdst=1'b0;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b0;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b1;
			   ALUop=`ADD;
			  end
	   	  default: begin
			   Regdst=1'b0;
			   ALUSrc=1'b0;
			   MemtoReg=1'b0;
			   RegWrite=1'b0;
			   MemRead=1'b0;
			   MemWrite=1'b0;
			   Branch=1'b0;
			   Jump=1'b0;
			   ALUop=`ADD;
			   end			       
	   	  endcase
		end
			  
			  		
	end
// Write your code here. You can modify all of the codes

endmodule	

