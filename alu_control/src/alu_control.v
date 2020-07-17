//Project: RISC-V 32 bit Architecture
//Module: ALU_control
//Author: Sistla Manojna
//Updated: 06/29/2020
//takes the ALU OP, func3 and func7 to select the operation performed by ALU
//NOTE: Please change jump opcode as 11 for both jal and jalr 

module ALU_control(alu_opcode, func3, func7_signbit, alu_op_selected);

input[1:0] alu_opcode;
input[2:0] func3;
input func7_signbit;//bit 30 in machine code, if it is one then func7 is 0x20
output reg[4:0] alu_op_selected;

always @(alu_opcode, func3, func7_signbit) begin

    case(alu_opcode)

        2'b00: begin
           alu_op_selected = 0; 
        end

        2'b01: begin
           case(func3)
               3'h0: begin alu_op_selected = 10; end
               3'h1: begin alu_op_selected = 11; end
               3'h4: begin alu_op_selected = 12; end
               3'h5: begin alu_op_selected = 13; end
               3'h6: begin alu_op_selected = 14; end
               3'h7: begin alu_op_selected = 15; end
               default: begin alu_op_selected = 5'bxxxxx; end
           endcase 
        end

        2'b10: begin
           case(func3)
               3'h0: begin 
                   if(func7_signbit) begin
                       alu_op_selected = 1;
                   end
                   else begin
                       alu_op_selected = 0;
                   end
               end
               3'h1: begin alu_op_selected = 5; end
               3'h2: begin alu_op_selected = 8; end
               3'h3: begin alu_op_selected = 9; end
               3'h4: begin alu_op_selected = 2; end
               3'h5: begin 
                   if(func7_signbit) begin
                       alu_op_selected = 7;
                   end
                   else begin
                       alu_op_selected = 6;
                   end
               end
               3'h6: begin alu_op_selected = 3; end
               3'h7: begin alu_op_selected = 4; end
               default: begin alu_op_selected = 5'bxxxxx; end
           endcase 
        end

        2'b11: begin
           alu_op_selected = 16; //for jump condition
        end

        default: begin
           alu_op_selected = 5'bxxxxx; //for jump condition
        end
    endcase
end
endmodule