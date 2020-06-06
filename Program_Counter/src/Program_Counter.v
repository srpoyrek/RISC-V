//Project: RISC-V 32 bit Architecture
//Module: Program_Counter (FU)
//Author: Sistla Manojna
//Updated: 06/03/2020
//Updates the Program Counter value
//Branch out come is assumed to be known at the end of execution stage
//Updates:


module program_counter(PC_Value, clk, rst, stall, PCWrite, PCSrc);

input clk, rst;
input stall, PCWrite;//control signals stall -> for stall, PCWrite -> for indicating branch
input[31:0] PCSrc;//branch address
output reg[31:0] PC_Value;

always @(posedge clk)
begin

    if(rst == 0)
        begin
            PC_Value <= 0;
        end
    else
        begin
            if(stall == 0)
                begin
                    if(PCWrite == 1)
                        begin
                            PC_Value <= PCSrc;
                        end
                    else
                        begin
                            PC_Value <= PC_Value + 4;
                        end
                end
            else
                begin 
                    PC_Value <= PC_Value;     
                end
        end

end

endmodule
