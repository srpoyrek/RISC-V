/*Project: RISC-V 32 bit Architecture
Module: Control Unit
Author: Ayesha S. Ahmad
Updated: 06/24/2020
RV32I Base Integer Instructions RISC-V 
//Input: 32 bit machine code is obtained as input to (ID)
//Output: Based on the type of instruction, decided by decoding opcode i.e last 7 bits of 
machine code, ID divides 32 bits into opcode, rd, funct3, rs1, rs2, funct7 and imm */

module control_unit(opcode, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, JumpReg, ALUOP);

input [6:0] opcode; //from Instruction Decoder module

output reg ALUSrc; //select line of MUX with inputs from Register Bank and imm generator 
output reg MemtoReg; //select line of MUX with inputs from Data Memory and ALU
output reg RegWrite; //goes to register bank
output reg MemRead; //goes to Data Memory
output reg MemWrite; //goes to Data Memory
output reg Branch; //input of AND gate whose output is select line of MUX with inputs from shift adder and PC adder
output reg JumpReg; // ***New Hardware
output reg [1:0] ALUOP; //input to ALU Control unit

always @ (opcode)

   begin
	if (opcode[6:0] == 7'b0110011) //R-type
	   begin
		ALUSrc = 1'b0;
		MemtoReg = 1'b0;
		RegWrite = 1'b1;
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b0;
		JumpReg = 1'b0;
		ALUOP = 2'b10;
	   end
	else if (opcode[6:0] == 7'b0010011) //I-type
	   begin
		ALUSrc = 1'b1;
		MemtoReg = 1'b0;
		RegWrite = 1'b1;
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b0;
		JumpReg = 1'b0;
		ALUOP = 2'b10;
	   end
	else if (opcode[6:0] == 7'b0000011) //LD
	   begin
		ALUSrc = 1'b1;
		MemtoReg = 1'b1;
		RegWrite = 1'b1;
		MemRead = 1'b1;
		MemWrite = 1'b0;
		Branch = 1'b0;
		JumpReg = 1'b0;
		ALUOP = 2'b00;
	   end
	else if (opcode[6:0] == 7'b0100011) //SD
	   begin
		ALUSrc = 1'b1;
		MemtoReg = 1'bx;
		RegWrite = 1'b0;
		MemRead = 1'b0;
		MemWrite = 1'b1;
		Branch = 1'b0;
		JumpReg = 1'b0;
		ALUOP = 2'b00;
	   end
	else if (opcode[6:0] == 7'b1100011) //Branch
	   begin
		ALUSrc = 1'b0;
		MemtoReg = 1'bx;
		RegWrite = 1'b0;
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b1;
		JumpReg = 1'b0;
		ALUOP = 2'b01;
	   end
	else if (opcode[6:0] == 7'b1101111) //jal
	   begin
		ALUSrc = 1'b0;
		MemtoReg = 1'b0;
		RegWrite = 1'b1;
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b1;
		JumpReg = 1'b0;
		ALUOP = 2'b11;
	   end
	else if (opcode[6:0] == 7'b1100111) //jalr
	   begin
		ALUSrc = 1'b0;
		MemtoReg = 1'b0;
		RegWrite = 1'b1;
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b1;
		JumpReg = 1'b1;
		ALUOP = 2'b10;
	   end
	else if (opcode[6:0] == 7'b0110111) //lui
	   begin
		ALUSrc = 1'b1;
		MemtoReg = 1'b0;
		RegWrite = 1'b1;
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b0;
		JumpReg = 1'b0;
		ALUOP = 2'b11;
	   end
	else if (opcode[6:0] == 7'b0010111) //auipc
	   begin
		ALUSrc = 1'b1;
		MemtoReg = 1'b0;
		RegWrite = 1'b1;
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b0;
		JumpReg = 1'b0;
		ALUOP = 2'b11;
	   end
	else if (opcode[6:0] == 7'b1110011) //***en
	   begin
	
	   end
	else 
	   begin
		ALUSrc = ALUSrc;
		MemtoReg = MemtoReg;
		RegWrite = RegWrite;
		MemRead = MemRead;
		MemWrite = MemWrite;
		Branch = Branch;
		JumpReg = JumpReg;
		ALUOP = ALUOP;
	   end
   end
endmodule
