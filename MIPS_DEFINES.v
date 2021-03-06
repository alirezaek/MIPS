/*
  MIPS SINGLE CYCLE CPU IMPLEMENTED BY :   
  ARDESHIR  ALIREZA 
  92213118  92213034
*/
 `ifndef MIPS_DEFINES
 `define MIPS_DEFINES
 	
	/**************************** Operation Bits (opcode) in Instruction Set Architecture (ISA) of MIPS ********************************/
	
	`define OP_R_TYPE			6'b000000		
	`define OP_ADDI				6'b001000
	
	`define AND  4'b0000
	`define OR   4'b0001
	`define ADD  4'b0010
	`define SUB  4'b0011
	`define SLT  4'b0100
	`define NOR  4'b0101
	`define XOR  4'b0111
	
	// Write Other Opcodes here:
	`define RTYPE 6'b000000
  `define ADDI  6'b001000
  `define ADDIU 6'b001001
  `define SLTI  6'b001010
  `define SLTIU 6'b001011
  `define ANDI  6'b001100
  `define ORI   6'b001101
	`define XORI  6'b001110
  `define LUI   6'b001111
  //-----------------------------
  `define LB 6'b100000
  `define LH 6'b100001
  `define LW 6'b100011
  `define SB 6'b101000
  `define SH 6'b101001
  `define SW 6'b101011
  //------------------------------
  `define BEQ 6'b000100
  `define BNE 6'b000101
  //------------------------------//funct daran?
  `define JR 6'b000000
  `define BGEZ 6'b000001
  `define BLTZAL 6'b000001
  `define J 6'b000010
  `define JAL 6'b000011
  
  `define NOOP 6'b000000 //funct=0
  
  //----------------------------
		
	/**************************** Function Bits (funct) in Instruction Set Architecture (ISA) of MIPS ********************************/
	 
	`define FUNCT_ADD			6'b100000	
	`define FUNCT_ADDU			6'b100001
  `define FUNCT_AND			6'b100100
  `define FUNCT_OR			6'b100101
  `define FUNCT_NOR			6'b100111
  `define FUNCT_SRA			6'b000011
  `define FUNCT_SRL 		6'b000010
  `define FUNCT_SRLV			6'b000110
  `define FUNCT_SUB			6'b100010
  `define FUNCT_SUBU			6'b100011
  `define FUNCT_XOR			6'b100110
  `define FUNCT_SLT			6'b101010
  `define FUNCT_SLTU			6'b101011
  `define FUNCT_SLL			6'b000000
  `define FUNCT_SLLV			6'b000100
  `define FUNCT_MFHI			6'b010000
  
	// Write other Function codes here:
			
	/**************************************************** ALU Control Bits ****************************************************************/
		 	
 
   
 `endif
 