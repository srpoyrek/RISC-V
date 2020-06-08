`timescale 1ns/100ps

module tb_instruction_decoder();

reg [31:0] machine_code; //instruction32

wire[6:0] opcode; // goes to control unit
wire[4:0] rd,rs1,rs2; //to the register bank
wire[2:0] funct3;
wire[6:0] funct7;
wire[31:0] imm = 20'h00000; // jump address to be calculated

instruction_decoder M1(machine_code, opcode, rd, funct3, rs1, rs2, funct7, imm);

initial begin
machine_code = 32'b00000000000100011111000110110011;
machine_code = 32'b00000000000100011111000110010011;
machine_code = 32'b00010000000100011111000110000011;
machine_code = 32'b00000000000100011111000110100011;
machine_code = 32'b00000000000100011111000111100011;
machine_code = 32'b00000000000100011111000111101111;
machine_code = 32'b00000000000100011111000111100111;
machine_code = 32'b00000000000100011111000111100111;
end

endmodule




