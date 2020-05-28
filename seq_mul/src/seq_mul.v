//Project: RISC-V 32 bit Architecture
//Module: seq_mul(SM)
//Author: Shreyas Poyrekar
//Updated: 05/27/2020
// Mulitplication unit 64-bit integer
//Updates:
// 

module seq_mul(Clk, Rst, multiplicand, multiplier,product);

input [63:0] multiplicand, multiplier;
input Clk, Rst;

output reg [127:0] product;

parameter S_init=0, S_add = 1,S_pro=2;

reg [5:0] count = 0;
reg [1:0] State  , StateNext;
reg [128:0] pro_intermediate;

always@(State,multiplicand, multiplier) begin
	case(State)
		S_init: begin
			pro_intermediate = pro_intermediate >> 1;
			count = count +1;
			if (count < 64)
				if (pro_intermediate[0]==0) 
					StateNext = S_init;
				else
					StateNext = S_add;
			else
				StateNext = S_pro;
		end
		
		S_add: begin
			pro_intermediate[128:64] = multiplicand + pro_intermediate[127:64] + pro_intermediate[128];
			pro_intermediate = pro_intermediate >> 1;
			count = count +1;
			if (count < 64)
				if (pro_intermediate[0]==0) 
					StateNext = S_init;
				else
					StateNext = S_add;
			else
				StateNext = S_pro;
		end
		
		S_pro: begin
			product=pro_intermediate[127:0];
		end
		
		default:begin
			StateNext = S_init;
			pro_intermediate = multiplicand;
			
		end
		
	endcase
		
end

always@(posedge Clk) begin
	if(Rst==0)
		State <= S_init;
	else
		State <= StateNext;
end 

endmodule
