//Project: RISC-V 32 bit Architecture
//Module: seq_mul(SM)
//Author: Shreyas Poyrekar
//Updated: 05/29/2020
// Mulitplication unit 64-bit integer
//Updates: Fixed the code FSM
// needed 128 cycles to give the output
// unsigned 64-bit multiplier
// output is [64:0] bit of the product register. 

module seq_mul(Clk, Rst, a, b, y);

input [63:0] a, b; // multiplicand, multiplier
output reg [64:0] y ;
input Clk, Rst;
reg [6:0] count;
reg [128:0] product = 0; //reg
reg [63:0] mutliplicand; //reg

reg [1:0] State , StateNext;
parameter S_init = 0, S_control = 1, S_pro = 2;

always@(posedge Clk) begin  // always block to change the state
	if(Rst==0)
		State <= S_init;
	else
		State <= StateNext;
end

always@(a,b) begin  // always block to change the state
	StateNext <= S_init;
end

always@(State) begin
	case(State)

	S_init: begin
		product[63:0] <= b;
		mutliplicand <= a;
		count <= 7'b000000;
		StateNext <= S_control;
		end

	S_control: begin
		if (product[0] == 1'b1) begin
			product[128:64] = product[128:64] + mutliplicand;
		end
		product <= product >> 1;
		StateNext <= S_pro;
		end

	S_pro: begin 
		if (count < 63) begin
			count <= count + 6'b000001;
			StateNext <= S_control;
		end
		else
			y <= product[64:0];
		end
	endcase
end
endmodule
