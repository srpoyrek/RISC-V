//Project: RISC-V 32 bit Architecture
//Module: Forwarding Unit Test bench(FU_TB)
//Author: Sistla Manojna
//Updated: 05/29/2020
//forwarding from ex/mem register & mem/wb register for data hazard.
//Updates:

`timescale 1ns/1ns
module tb_forwarding_unit();

reg[4:0] ID_EXRs1, ID_EXRs2, EX_MEMRegRd, MEM_WBRegRd;
reg EX_MEMRegWrite, MEM_WBRegWrite;
wire[1:0] Fwd_A, Fwd_B;

forwarding_unit DUT_1(ID_EXRs1, ID_EXRs2, EX_MEMRegRd, EX_MEMRegWrite, MEM_WBRegWrite, MEM_WBRegRd, Fwd_A, Fwd_B);

initial
begin


ID_EXRs1 = 1 ; ID_EXRs2 = 2 ; EX_MEMRegRd = 3 ; MEM_WBRegRd = 4 ; EX_MEMRegWrite = 1 ; MEM_WBRegWrite = 0;#10;
ID_EXRs1 = 1 ; ID_EXRs2 = 2 ; EX_MEMRegRd = 1 ; MEM_WBRegRd = 4 ; EX_MEMRegWrite = 1 ; MEM_WBRegWrite = 0;#10;
ID_EXRs1 = 1 ; ID_EXRs2 = 2 ; EX_MEMRegRd = 2 ; MEM_WBRegRd = 4 ; EX_MEMRegWrite = 1 ; MEM_WBRegWrite = 0;#10;
ID_EXRs1 = 0 ; ID_EXRs2 = 0 ; EX_MEMRegRd = 0 ; MEM_WBRegRd = 0 ; EX_MEMRegWrite = 1 ; MEM_WBRegWrite = 0;#10;
ID_EXRs1 = 1 ; ID_EXRs2 = 2 ; EX_MEMRegRd = 1 ; MEM_WBRegRd = 1 ; EX_MEMRegWrite = 0 ; MEM_WBRegWrite = 0;#10;
ID_EXRs1 = 1 ; ID_EXRs2 = 2 ; EX_MEMRegRd = 2 ; MEM_WBRegRd = 2 ; EX_MEMRegWrite = 0 ; MEM_WBRegWrite = 0;#10;
ID_EXRs1 = 1 ; ID_EXRs2 = 2 ; EX_MEMRegRd = 1 ; MEM_WBRegRd = 1 ; EX_MEMRegWrite = 1 ; MEM_WBRegWrite = 1;#10;
ID_EXRs1 = 1 ; ID_EXRs2 = 2 ; EX_MEMRegRd = 2 ; MEM_WBRegRd = 2 ; EX_MEMRegWrite = 1 ; MEM_WBRegWrite = 1;#10;
ID_EXRs1 = 1 ; ID_EXRs2 = 2 ; EX_MEMRegRd = 3 ; MEM_WBRegRd = 4 ; EX_MEMRegWrite = 1 ; MEM_WBRegWrite = 1;#10;
ID_EXRs1 = 1 ; ID_EXRs2 = 2 ; EX_MEMRegRd = 1 ; MEM_WBRegRd = 1 ; EX_MEMRegWrite = 0 ; MEM_WBRegWrite = 1;#10;
ID_EXRs1 = 1 ; ID_EXRs2 = 2 ; EX_MEMRegRd = 2 ; MEM_WBRegRd = 2 ; EX_MEMRegWrite = 0 ; MEM_WBRegWrite = 1;#10;

end

endmodule