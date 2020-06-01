//Project: RISC-V 32 bit Architecture
//Module: tb_seq_mul
//Author: Shreyas Poyrekar
//Updated: 05/29/2020
// test bench got Mulitplication unit 64-bit integer

`timescale 10 ns/100 ps  // time-unit = 10 ns, precision = 100 ps

module tb_seq_mul;
	reg Clk, Rst,L;
	reg [63:0] multiplicand, multiplier;
	wire [64:0] product;

    // duration for each bit = 10 * timescale = 10 * 10 ns
    localparam period = 10;  

    seq_mul U1 (Clk, Rst, multiplicand, multiplier,product,L); // instatitate the seq_mul

initial
	Clk = l'bO; //set clk to 0
always
	#period Clk = -Clk;

  initial // initial block executes only once
        begin
	multiplicand = 64'h0000000000000078;	//120
	multiplier = 64'h000000000000001D;		// 29
	Rst = 1'b0;
	@(posedge Clk);
	@(posedge Clk);
	Rst = 1'b1;
	L = 1'b0;
	repeat (65) begin
		@(posedge Clk);
	end
	multiplicand = 64'h0000000000000078;	//120
	multiplier = 64'h000000000000001C;      //
	L = 1'b1;
	@(posedge Clk);
	@(posedge Clk);
	L = 1'b0;
	repeat (65) begin
		@(posedge Clk);
	end
	#period;
	multiplicand = 64'h0000000000000054;	// 84
	multiplier = 64'h000000000000001E ;		//30
	L = 1'b1;
	@(posedge Clk);
	@(posedge Clk);
	L = 1'b0;
	repeat (65) begin
		@(posedge Clk);
	end
	#period;
	multiplicand =  64'h000000000000001E ;	//30
	multiplier =  64'h000000000000001D ;	//29
	L = 1'b1;
	@(posedge Clk);
	@(posedge Clk);
	L = 1'b0;
	repeat (65)begin
		@(posedge Clk);
	end
	#period;
	multiplicand =  64'h0000000000000078 ;	//120
	multiplier =  64'h0000000000000054;	//84
	L = 1'b1;
	@(posedge Clk);
	@(posedge Clk);
	L = 1'b0;
	repeat (65) begin
		@(posedge Clk);
	end
	L = 1'b1;
        
        end

// Monitor the outputs
initial
$monitor ($time, " Output q = %d" , product) ; 
	
endmodule
