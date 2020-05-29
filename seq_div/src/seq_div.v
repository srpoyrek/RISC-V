//Project: RISC-V 64 bit Architecture
//Module: seq_div(SM)
//Author: Shreyas Poyrekar
//Updated: 05/29/2020
// Division unit 64-bit integer


module seq_div(Clk, Rst, a, b, y);

input [63:0] a, b; // Divisor, Dividend
output reg [64:0] y ;
input Clk, Rst;
reg [6:0] count;
reg [128:0] Remainder = 0; //reg
reg [63:0] divisor; //reg
reg [63:0] quotient;
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
		Remainder[63:0] <= b;
		divisor <= a;
		count <= 7'b000000;
		quotient <= 0;
		StateNext <= S_control;
		end

	S_control: begin
		Remainder[128:64] =  Remainder[128:64] - divisor ;
		if (Remainder[128:64] < 0 ) begin
			Remainder[128:64] = divisor + Remainder[128:64] ;
			quotient = quotient << 1;
			quotient[0] = 1'b0;
		end
		else begin
			quotient = quotient >> 1;
			quotient[0] = 1'b1;
		end
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
