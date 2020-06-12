//Project: RISC-V 32 bit Architecture
//Module: Program_Counter (FU)
//Author: Sistla Manojna
//Updated: 06/03/2020
//Updates the Program Counter value
//Branch out come is assumed to be known at the end of execution stage
//Updates:


module program_counter(clk, rst, PC_Value, stall, PCWrite, PCSrc);

parameter n_bit = 32; // number of bits for progam counter register

input clk, rst;
input stall, PCWrite; //control signals stall -> for stall, PCWrite -> for indicating branch
input[n_bits-1 :0] PCSrc; //branch address
output reg[n_bits-1:0] PC_Value;

always @(posedge clk) begin
    if(~rst) begin
            PC_Value <= 31'd0;
    end
    else begin
    	if(~stall) begin
            if(PCWrite) begin
            	PC_Value <= PCSrc;
            end
            else begin
                PC_Value <= PC_Value + 4;
            end
        end
    end

end

endmodule
