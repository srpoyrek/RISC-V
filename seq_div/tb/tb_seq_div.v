//Project: RISC-V 32 bit Architecture
//Module: tb_seq_mul
//Author: Shreyas Poyrekar
//Updated: 05/29/2020
// test bench got Mulitplication unit 64-bit integer

`timescale 10 ns/100 ps  // time-unit = 10 ns, precision = 100 ps

module tb_seq_mul;
	reg Clk, Rst;
	reg [63:0] multiplicand, multiplier;
	wire [64:0] product;

    // duration for each bit = 10 * timescale = 10 * 10 ns  = 200ns
    localparam period = 10;  

    seq_mul U1 (Clk, Rst, multiplicand, multiplier,product); // instatitate the seq_mul

always begin
	Clk = 0;
	#period;
	Clk=1;
	#period;
end
    
    initial // initial block executes only once
        begin
	Rst = 1'b0;
	#period;
	multiplicand = 64'h0000000000000078;	//120
	multiplier = 64'h000000000000001D;		// 29
	Rst = 1'b1;
	repeat (192) begin
		@(posedge Clk);
	end
	multiplicand = 64'h0000000000000078;	//120
	multiplier = 64'h000000000000001C;      //
	repeat (192) begin
		@(posedge Clk);
	end
	#period;
	multiplicand = 64'h0000000000000054;	// 84
	multiplier = 64'h000000000000001E ;		//30
	Rst = 1'b1;
	repeat (192) begin
		@(posedge Clk);
	end
	#period;
	multiplicand =  64'h000000000000001E ;	//30
	multiplier =  64'h000000000000001D ;	//29
	Rst = 1'b1;
	repeat (192) begin
		@(posedge Clk);
	end
	#period;
	multiplicand =  64'h0000000000000078 ;	//120
	multiplier =  64'h0000000000000054;	//84
	Rst = 1'b1;
	repeat (192) begin
		@(posedge Clk);
	end
        #period;
        end
	
endmodule
