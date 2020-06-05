//Project: RISC-V 32 bit Architecture
//Module: data_memory.v
//Author: Shreyas Poyrekar
//Updated: 06/05/2020
//data memory 256 memory locations each storing 32-bit data i.e 1KB size


module data_memory(Clk, Rst, Rd_data, Addr, Wr_data, MemWrite, MemRead);

parameter n_addr = 8;  //number of address bits for a registers 
parameter size = 2**n_addr; // data bits stored in each registers 
parameter n_bit = 32; // number of bits to stored in each location

input Clk, Rst;
input MemWrite, MemRead; // signal from the control unit to read and write on mem
input [n_addr-1:0] Addr; // address to read or write
input [n_bit-1:0] Wr_data; // 32-bit data to be written on the register
output reg[n_bit-1:0] Rd_data; // 32-bit datat at given register address.

reg [n_bit-1:0] MEM [size-1:0];  // register bank of n_bit's having n_reg's


always @ (posedge Clk) begin
	if (~Rst) begin
		Rd_data<= 32'dx;
	end 
	else begin
		if (MemWrite) begin
			MEM[Addr] <= Wr_data;  // write the data on location at mem write signal
			Rd_data<= 32'dx;
		end
		else begin 
			if (MemRead) Rd_data <= MEM[Addr];  // read the data on location at mem write signal
			else Rd_data<= 32'dx;
		end
	end
	 
end

endmodule
