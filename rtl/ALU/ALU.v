`timescale 1ns/1ps
module ALU(X,B,y,clk);
	
	input [15:0]X,B;
	input clk;

	output reg [38:0] y = 38'b00000000000000000000000000000000000000;

	wire [38:0]multiplier_out;
	wire [38:0]adder_out;
	
	
	multiplier multiplier(X,B,multiplier_out);
	addern adder(multiplier_out,y,adder_out);

	always @(posedge clk) begin
		y <= adder_out;
	end
endmodule
	


module multiplier(A,B,Out);
	
	input [15:0]A,B;
	output [38:0]Out;
	
	assign Out = A * B;

endmodule



module addern(X, Y, S);
	parameter n = 39;
	input [n-1:0] X, Y;
	output wire[n-1:0]S;
	wire [n:0]C;
	
	genvar k;
	assign C[0] = 0;
	generate
		for(k = 0; k < n; k = k+1) begin
			wire z1, z2, z3;
			xor(S[k],X[k],Y[k],C[k]);
			and(z1, X[k], Y[k]);
			and(z2, X[k], C[k]);
			and(z3, Y[k], C[k]);
			or(C[k+1],z1,z2,z3);
		end
	endgenerate
endmodule
