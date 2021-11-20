`timescale 1ns/1ps
`define SD #0.010
`define HALF_CLOCK_PERIOD #5


module testbench();
	reg clk;
	reg [15:0]X;
	reg [15:0]B;

	reg R;
	wire [38:0] y;

	integer i;
	

	ALU ALU(.X(X), .B(B),.R(R), .y(y), .clk(clk));
	
	always begin
		`HALF_CLOCK_PERIOD;
		clk =~clk;
	end
	
	initial begin
		$dumpfile("./ALU.vcd");
		$dumpvars(0, testbench.ALU);
		clk <= 0;
		X <= 2;
		B <= 1;
		R <= 1;
		@(posedge clk);

		@(negedge clk);		
		R <= 0;
		@(posedge clk);

		for (i = 0; i < 1000; i = i+1) begin
			X <= $urandom%100-50;
			B <= $urandom%100-50;

			@(negedge clk);

			
			@(posedge clk);


		end


		$finish;
	
	end

endmodule	

							

