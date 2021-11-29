`timescale 1ns/1ps
`define SD #0.010
`define HALF_CLOCK_PERIOD #5


module testbench();
	reg clk;
	reg [15:0]w;
	reg [5:0]Addr;
	reg R;
	
	reg E;

		
	wire [15:0]Q;
	
	

	integer i;
	

	shiftlne FIFO(.Addr(Addr),.R(R),.E(E),.w(w),.clk(clk),.Q(Q));

	
	always begin
		`HALF_CLOCK_PERIOD;
		clk =~clk;
	end
	
	initial begin
		Addr <= 6'b0;
		clk <= 0;
		E <= 0;
		R <= 1;
		
		@(posedge clk)
		@(negedge clk)
		@(posedge clk)			
		R <= 0;
		w <= 0;	
		E <= 1;		

		@(posedge clk);

		for (i = 0; i < 64; i = i+1) begin
			

			@(negedge clk);
			Addr <= i;
			w <= i;
			if (i == 32) begin
				#1.5;
				Addr <= 1;
			end

			@(posedge clk);


		end
		@(negedge clk);
		R <= 1;
		@(posedge clk);
		R <= 0;
		for (i = 0; i < 64; i = i+1) begin
			

			@(negedge clk);
			Addr <= i;
			if (i == 32)
				E <= 0;
			
			w <= 10;
			
			@(posedge clk);


		end
		@(negedge clk);

		@(posedge clk);


		$finish;
	
	end

endmodule	

							
