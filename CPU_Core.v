/*
  MIPS SINGLE CYCLE CPU IMPLEMENTED BY :   
  ARDESHIR  ALIREZA 
  92213118  92213034
*/
module CPU_Core( // Datapath of CPU  
	input clk
);

// Write your code here. You can modify all of the codes
wire [31:0] pc_in;
wire [31:0] pc_out;

wire [31:0] insout;

wire [4:0] rg1;
wire [4:0] rg2;
wire [4:0] dst;
wire [5:0] opc;
wire [5:0] funct;
wire [15:0] addr;
wire [4:0] out_write;

assign rg1 = insout[25:21];
assign rg2=insout[20:16];
assign dst=insout[15:11];
assign addr=insout[15:0];
assign opc=insout[31:26];
assign funct=insout[5:0];

//---------------------
wire c_RgDst;
wire c_Branch;
wire c_MemRead;
wire c_MemtoReg;
wire [3:0] c_ALUop;
wire c_MemWrite;
wire c_ALUSrc;
wire c_RegWrite;
wire c_jump;
//----------------------
wire [31:0] out_sign;
wire [31:0] readdata1;
wire [31:0] readdata2;
wire [31:0] out_mux;
wire c_zero;
wire [31:0] c_result;
wire [31:0] datatowrite;
wire [31:0] datareaded;
//----------------------
wire [31:0] bala;
wire [25:0] in_exceptopc;
wire [31:0] jaddress;
wire [31:0] out_shift;
wire [31:0] myout;
wire [31:0] realout;


///////////////////////////////////

reg [31:0] pc;



//always@(*)begin
  assign in_exceptopc=insout[25:0];
  assign jaddress = {in_exceptopc,2'b00};
  assign jaddress = {in_exceptopc,bala[31:28]};
//end

reg sel1;
always @(*) begin
  sel1 <= c_Branch & c_zero;  
end
//-----------------------
		
/*PC pc (
    .in (pc_in),
    .out (pc_out)
    );	*/	
		
Instruction_Memory InsM (
     .addr (pc),
     //.addr (pc),
      .out (insout)
);

Mux5bit muxins (
      .in1 (rg2),
      .in2 (dst),
      .sel (c_RegDst),
      .out (out_write)
      );	
      
Register_File RegF (
      .clk (clk),
      .rd1_addr (rg1),
      .rd1_data (readdata1),
      .rd2_addr (rg2),
      .rd2_data (readdata2),
      .wr_en (c_RegWrite),
      .wr_addr (out_write),
      .wr_data (datatowrite)
      );
      
SignExtend SignE (
      .in (addr),
      .out(out_sign)
      );
            
Mux32bit muxalu (
      .in1 (readdata2),
      .in2 (out_sign),
      .sel (c_ALUSrc),
      .out (out_mux)
      );	
      
ALU alu(
			.in1  (readdata1),
			.in2		(out_mux),
			.control (c_ALUop),
			.out(c_result),
			.zero(c_zero)
			);
			
Data_Memory DataM (
      .clk (clk),
      .addr (c_result),
      .rd_en (c_MemRead),
      .out (datareaded),
      .wr_en (c_MemWrite),
      .wr_data (readdata2)
      );
      
Mux32bit muxmem (
      .in1 (c_result),
      .in2 (datareaded),
      .sel (MemtoReg),
      .out (datatowrite)
      );	
      		
Controller controller(
			.Regdst  (c_RegDst),
			.ALUSrc		(c_ALUSrc),
			.MemtoReg (c_MemtoReg),
			.RegWrite(c_RegWrite),
			.MemRead(c_MemRead),
			.MemWrite (c_MemWrite),
			.Branch (c_Branch),
			.ALUop (c_ALUop),
			.Jump (c_jump),
			.opcode (opc),
			.funct (funct)
			);

ALU pcadd(
			//.in1  (pc_out),
			.in1  (pc),
			.in2		(32'b00000000000000000000000000000100),//4
			.control (4'b0010),//add
			.out(bala),
			.zero()
			);

//always@(*)begin
  assign out_shift = out_sign<<2;
//end

ALU outshiftadd(
			.in1  (bala),
			.in2		(out_shift),
			.control (4'b0010),//add
			.out(myout),
			.zero()
			);
			

Mux32bit muxmem2 (
      .in1 (bala),
      .in2 (myout),
      .sel (sel1),
      .out (realout)
      );	
wire [31:0] temp;
Mux32bit muxmem3 (
      .in1 (realout),
      .in2 (jaddress),
      .sel (c_jump),
      .out (temp)
      );	
always@(posedge clk) begin
  pc <= temp;
end			
			
			
															
endmodule