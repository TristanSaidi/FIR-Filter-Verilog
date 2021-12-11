`timescale 1ns/1ps
`define HALF_CLOCK_PERIOD #10000


module testbench();
	reg clk;
	reg valid_in;
	reg resetn;
	reg CLOAD;
	wire enable_FIFO, resetn_FIFO, reset_DA, resetn_DA, start_DA, global_valid_out;

	integer i;
	

	Control Control(
				.clk(clk), 
				.valid_in(valid_in),
				.resetn(resetn),
				.CLOAD(CLOAD),
				.enable_FIFO(enable_FIFO),
				.resetn_FIFO(resetn_FIFO),
				.reset_DA(reset_DA),
				.resetn_DA(resetn_DA),
				.start_DA(start_DA),
				.global_valid_out(global_valid_out)
	);
	
	always begin
		`HALF_CLOCK_PERIOD;
		clk =~clk;
	end
	
	initial begin
		clk 		<= 0;
		valid_in 	<= 0;
		resetn 		<= 0;
		
		CLOAD 		<= 0;		

		@(posedge clk);
		@(negedge clk);	
		resetn 		<= 1;		
		@(posedge clk);
		@(negedge clk);	
		@(posedge clk);
		@(negedge clk);
		
		CLOAD 		<= 1;			
		
		@(posedge clk);
		@(posedge clk);
		CLOAD 		<= 0;
		
		@(posedge clk);
		valid_in 	<= 1;
		
		@(posedge clk);
		@(posedge clk);	
		
		valid_in 	<= 0;

		@(posedge clk);
		@(negedge clk);	
		@(posedge clk);
		@(negedge clk);
		
		resetn 		<= 0;	

		@(posedge clk);
		@(negedge clk);	
		@(posedge clk);
		@(negedge clk);

		$finish;
	
	end

endmodule	

							

