module ALU(X,B,y,clk)
	
	input [15:0]X,B;
	input clk;

	output reg [38:0] y;

	wire [31:0]multiplier_out;
	wire [38:0]adder_out;
	reg [38:0]adder_in;
	

	multiplier multiplier(X,B,multiplier_out);
	addern(0,multiplier_out,adder_in,adder_out);

	always @(posedge clk) begin
		adder_in <= adder_out;
	end
endmodule;
	


module multiplier(A,B,Out);
	
	input [15:0]A,B;
	output [31:0]Out;
	
	assign Out = A * B;

endmodule



module addern(carryin, X, Y, S);
	parameter n = 32;
	input carryin;
	input [n-1:0] X, Y;
	output[n-1:0]S;
	wire [n:0]C;
	
	genvar k;
	assign C[0] = carryin;
	generate
		for(k = 0; k < n; k = k+1) begin
			wire z1, z2, z3;
			xor(S[k],X[k],Y[k],C[k]);
			and(z1, X[k], Y[k]);
			and(z2, X[k], C[k]);
			and(z3, Y[k], C[k]);
			or(C[k+1],z1,z2,z3);
		end
	end generate
endmodule
