//Project: RISC-V 32 bit Architecture
//Module: tb_Program_Counter (FU)
//Author: Sistla Manojna
//Updated: 06/03/2020
//Updates the Program Counter value
//Updates:

<<<<<<< HEAD
module tb_Program_Counter();

reg clk, rst;
reg stall, PCWrite;//control signals stall -> for stall, PCWrite -> for indicating branch
reg[31:0] PCSrc;//branch address
wire[31:0] PC_Value;

Program_Counter  PC_DUT(PC_Value, clk, rst, stall, PCWrite, PCSrc);

always begin
    clk <= 1; #10;
    clk <= 0; #10;
end

initial begin
    
    rst <= 0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    rst <= 1;
    stall <= 0; PCWrite <= 0; PCSrc <= 0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    stall <= 1; PCWrite <= 0; PCSrc <= 0;
    @(posedge clk);
    @(posedge clk);
    stall <= 1; PCWrite <= 1; PCSrc <= 4;
    @(posedge clk);
    @(posedge clk);
    stall <= 0; PCWrite <= 1; PCSrc <= 4;
    @(posedge clk);
    stall <= 0; PCWrite <= 0; PCSrc <= 4;
    @(posedge clk);


end

=======
module tb_program_counter();
>>>>>>> 7591e019793463fe27de9ca90834d0a425748db3
endmodule
