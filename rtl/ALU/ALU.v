
`timescale 1ns/1ps
module ALU(X,B,R,y,clk);
	
	input [15:0]X,B;
	input clk;
	input R;
	output reg [38:0] y;

	wire signed [38:0]multiplier_out;
	wire signed [38:0]adder_out;

	
	
	multiplier multiplier(.A(X),.B(B),.Out(multiplier_out));
	addern adder(.X(multiplier_out),.Y(y),.S(adder_out));

	always @(posedge clk) begin
		if(R)
			y <= 16'b0;
		else		
			y <= adder_out;
	end
endmodule
	


module multiplier(A,B,Out);
	
	input wire signed [15:0]A,B;
	output wire signed [38:0]Out;
	
	assign Out[31:0] = A * B;
	assign Out[38:32] = {7{Out[31]}};


endmodule



module addern(X, Y, S);
	parameter n = 39;
	input wire signed [n-1:0] X, Y;
	output wire signed [n:0]S;
	assign	S	= X + Y;
endmodule

