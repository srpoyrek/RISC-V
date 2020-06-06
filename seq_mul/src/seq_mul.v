//Project: RISC-V 32 bit Architecture
//Module: seq_mul(SM)
//Author: Shreyas Poyrekar
//Updated: 05/29/2020
// Mulitplication unit 64-bit integer
//Updates: Fixed the code FSM
// needed 64 cycles to give the output
// unsigned 64-bit multiplier
// output is [64:0] bit of the product register. 

module seq_mul(Clk, Rst, a, b, y, L);

input [63:0] a, b; // multiplicand, multiplier
output reg [64:0] y ;
<<<<<<< HEAD
input Clk, Rst,L;
=======
input Clk, Rst, L;
>>>>>>> 4b5cb43826eefecaef925b59da43e6aa0057cc10
reg [6:0] count;
reg [128:0] product = 0; //reg
reg [63:0] mutliplicand; //reg

always@(posedge Clk) begin  // always block to change the state
<<<<<<< HEAD
	if(Rst==1'b0) begin
		product[63:0] <= b;
		mutliplicand <= a;
		count <= 7'b000000;
	end
	else begin
	if (L ==1'b1) begin 
		product[63:0] <= b;
		mutliplicand <= a;
		count <= 7'b000000;
	end
	else begin
		if (product[0] == 1'b1) begin
=======
	if(Rst==1'b0 || L==1'b1) begin
		product[63:0] <= b;
		mutliplicand <= a;
		count <= 7'b000000;
		y <= y;
	end
	else begin
		if (product[0]) begin
>>>>>>> 4b5cb43826eefecaef925b59da43e6aa0057cc10
			product[128:64] = product[128:64] + mutliplicand;
		end
		product = product >> 1;
		if (count < 63) begin
			count <= count + 7'b000001;
		end
		else begin
			y <= product[64:0];
			count <= 7'b000000;
		end
<<<<<<< HEAD
	 end 
=======
>>>>>>> 4b5cb43826eefecaef925b59da43e6aa0057cc10
	end
	
end

endmodule
