//Project: RISC-V 32 bit Architecture
//Module: data_memory.v
//Author: Shreyas Poyrekar
//Updated: 06/05/2020
//test bench data memory 256 memory locations each storing 32-bit data i.e 1KB size

`timescale 10 ns/100 ps  // time-unit = 10 ns, precision = 100 ps

module tb_data_memory;
	
	parameter n_addr = 8;  //number of address bits for a registers 
	parameter size = 2**n_addr; // data bits stored in each registers 
	parameter n_bit = 32; // number of bits to stored in each location

	reg Clk, Rst;
	reg MemWrite, MemRead; // signal from the control unit to read and write on mem
	reg [n_addr-1:0] Addr; // address to read or write
	reg [n_bit-1:0] Wr_data; // 32-bit data to be written on the register
	wire [n_bit-1:0] Rd_data; // 32-bit datat at given register address.

    // duration for each bit = 10 * timescale = 10 * 10 ns
    localparam period = 10;  

    data_memory U1(Clk, Rst, Rd_data, Addr, Wr_data, MemWrite, MemRead);// instatitate the data memory module

initial
	Clk = 0; //set clk to 0
always
	#period Clk = ~Clk;
    
initial // initial block executes only once
        begin
	Rst <= 0;
	MemWrite <= 1;
	MemRead <= 0;
	Addr <= 8'h9;
	Wr_data <= 32'h2453e;
	@(posedge Clk);
	#10; Rst <= 1;
	@(negedge Clk);
	MemWrite <= 0;
	MemRead <= 1;
	Addr <= 8'h9;
	@(negedge Clk);
	MemWrite <= 1;
	MemRead <= 1;
	Addr <= 8'h9;
	Wr_data <= 32'h1453e;
	@(negedge Clk);
	MemWrite <= 0;
	MemRead <= 1;
	Addr <= 8'h10;
	@(negedge Clk);
	$stop;
end

initial
	$monitor($time," Read Data output %h", Rd_data); 

endmodule