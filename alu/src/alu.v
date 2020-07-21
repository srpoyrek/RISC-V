//Project: RISC-V 32 bit Architecture
//Module: ALU 
//Author: Sistla Manojna
//Updated: 06/27/2020
//Performs ALU operations
//zero flag will be set whenever the branching condition is true/ there is jmp condition 
//meaning it says branch is taken/jmp this wil go to end gate
//Updates:


module ALU(in1, in2, op_select, out, zero_flag);

input[31:0] in1, in2;// inputs that ALU recieves
input[4:0] op_select;//to select alu operation
output reg[31:0] out;//output from ALU
output reg zero_flag;//flag zero for branch

always @(in1, in2, op_select) begin

    case(op_select)
        //for r and i instructions
        0: begin out = in1 + in2; zero_flag = 0; end
        1: begin out = in1 - in2; zero_flag = 0; end
        2: begin out = in1 ^ in2; zero_flag = 0; end
        3: begin out = in1 | in2; zero_flag = 0; end
        4: begin out = in1 & in2; zero_flag = 0; end
        5: begin out = in1 << in2; zero_flag = 0; end
        6: begin out = in1 >> in2; zero_flag = 0; end
        7: begin out = in1 >>> in2; zero_flag = 0; end ///arithmatic shift test this 
        8: begin out = ($signed(in1) < $signed(in2))?1:0; zero_flag = 0; end
        9: begin out = (in1 < in2)?1:0; zero_flag = 0; end
        //for branching instructions
        10: begin out = 0; zero_flag = (in1 == in2)?1:0; end
        11: begin out = 0; zero_flag = (in1 != in2)?1:0; end
        12: begin out = 0; zero_flag = ($signed(in1) < $signed(in2))?1:0; end
        13: begin out = 0; zero_flag = ($signed(in1) >= $signed(in2))?1:0; end
        14: begin out = 0; zero_flag = (in1 < in2)?1:0; end
        15: begin out = 0; zero_flag = (in1 >= in2)?1:0; end
        16: begin out = 0; zero_flag = 1; end//for jump
        default: begin out = 0; zero_flag = 0; end
    endcase
end
endmodule