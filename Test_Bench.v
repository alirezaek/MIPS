/*
  MIPS SINGLE CYCLE CPU IMPLEMENTED BY :   
  ARDESHIR  ALIREZA 
  92213118  92213034
*/
`define CYCLE_TIME 1000

// Write your code here. You can modify all of the codes

module Test_Bench();

reg         clk;
integer     i, j , outfile, counter;
integer file;

always#(`CYCLE_TIME/2) clk = ~clk;

CPU_Core CPU(
             .clk  (clk)
             );

initial begin
//Load instructions into instruction memory
file = $fopen ("input.txt", "r+");

for(j = 0; j< 40; j = j+1) begin
$fscanf(file, "%h", CPU.InsM.memory[j]);
end

for(j = 0; j<100; j = j+1) begin
CPU.DataM.memory[j] = 0;
end

for(j = 0; j<32; j = j+1) begin
CPU.RegF.registers[j] = 0;
end

// Open output file

CPU.pc = 32'h00000000;

outfile = $fopen("output.txt") | 1;

counter = 0;
clk = 0;

#(`CYCLE_TIME/4);

end

always@(posedge clk) begin

// print PC
$fdisplay(outfile, "PC = %d", CPU.pc);

// print Registers
$fdisplay(outfile, "Registers");
$fdisplay(outfile, "R0(r0) =%d, R8 (t0) =%d, R16(s0) =%d, R24(t8) =%d", CPU.RegF.registers[0], CPU.RegF.registers[8] , CPU.RegF.registers[16], CPU.RegF.registers[24]);
$fdisplay(outfile, "R1(at) =%d, R9 (t1) =%d, R17(s1) =%d, R25(t9) =%d", CPU.RegF.registers[1], CPU.RegF.registers[9] , CPU.RegF.registers[17], CPU.RegF.registers[25]);
$fdisplay(outfile, "R2(v0) =%d, R10(t2) =%d, R18(s2) =%d, R26(k0) =%d", CPU.RegF.registers[2], CPU.RegF.registers[10], CPU.RegF.registers[18], CPU.RegF.registers[26]);
$fdisplay(outfile, "R3(v1) =%d, R11(t3) =%d, R19(s3) =%d, R27(k1) =%d", CPU.RegF.registers[3], CPU.RegF.registers[11], CPU.RegF.registers[19], CPU.RegF.registers[27]);
$fdisplay(outfile, "R4(a0) =%d, R12(t4) =%d, R20(s4) =%d, R28(gp) =%d", CPU.RegF.registers[4], CPU.RegF.registers[12], CPU.RegF.registers[20], CPU.RegF.registers[28]);
$fdisplay(outfile, "R5(a1) =%d, R13(t5) =%d, R21(s5) =%d, R29(sp) =%d", CPU.RegF.registers[5], CPU.RegF.registers[13], CPU.RegF.registers[21], CPU.RegF.registers[29]);
$fdisplay(outfile, "R6(a2) =%d, R14(t6) =%d, R22(s6) =%d, R30(s8) =%d", CPU.RegF.registers[6], CPU.RegF.registers[14], CPU.RegF.registers[22], CPU.RegF.registers[30]);
$fdisplay(outfile, "R7(a3) =%d, R15(t7) =%d, R23(s7) =%d, R31(ra) =%d", CPU.RegF.registers[7], CPU.RegF.registers[15], CPU.RegF.registers[23], CPU.RegF.registers[31]);

// print Data Memory
$fdisplay(outfile, "Data Memory: 0x00 =%d", {CPU.DataM.memory[3] , CPU.DataM.memory[2] , CPU.DataM.memory[1] , CPU.DataM.memory[0] });
$fdisplay(outfile, "Data Memory: 0x04 =%d", {CPU.DataM.memory[7] , CPU.DataM.memory[6] , CPU.DataM.memory[5] , CPU.DataM.memory[4] });
$fdisplay(outfile, "Data Memory: 0x08 =%d", {CPU.DataM.memory[11], CPU.DataM.memory[10], CPU.DataM.memory[9] , CPU.DataM.memory[8] });
$fdisplay(outfile, "Data Memory: 0x0c =%d", {CPU.DataM.memory[15], CPU.DataM.memory[14], CPU.DataM.memory[13], CPU.DataM.memory[12]});
$fdisplay(outfile, "Data Memory: 0x10 =%d", {CPU.DataM.memory[19], CPU.DataM.memory[18], CPU.DataM.memory[17], CPU.DataM.memory[16]});
$fdisplay(outfile, "Data Memory: 0x14 =%d", {CPU.DataM.memory[23], CPU.DataM.memory[22], CPU.DataM.memory[21], CPU.DataM.memory[20]});
$fdisplay(outfile, "Data Memory: 0x18 =%d", {CPU.DataM.memory[27], CPU.DataM.memory[26], CPU.DataM.memory[25], CPU.DataM.memory[24]});
$fdisplay(outfile, "Data Memory: 0x1c =%d", {CPU.DataM.memory[31], CPU.DataM.memory[30], CPU.DataM.memory[29], CPU.DataM.memory[28]});

$fdisplay(outfile, "\n");

counter = counter + 1;
end


endmodule




