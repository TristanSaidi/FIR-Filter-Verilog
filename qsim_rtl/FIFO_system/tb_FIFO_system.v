
`timescale 1ns/1ps
`define SD #0.010
`define HALF_CLOCK_PERIOD #5
`define SLOW_HALF_CLOCK_PERIOD #80
`define QSIM_OUT_FN_1	"./reports/output.txt"


module testbench();
	reg 		clk1;
	reg 		clk2;
	reg [15:0]	w;
	reg 		resetn;
	reg 		enable;
	wire	[7:0]	A7,A6,A5,A4,A3,A2,A1,A0;
	integer 	i;
	integer		qsim_out_1;
	

	FIFO_system FIFO_system(
			.resetn	(resetn),
			.enable	(enable),
			.clk	(clk1),
			.clk2	(clk2),
			.w	(w),
			.A7	(A7),
			.A6	(A6),
			.A5	(A5),
			.A4	(A4),
			.A3	(A3),
			.A2	(A2),
			.A1	(A1),
			.A0	(A0)
	);

	
	always begin
		`HALF_CLOCK_PERIOD;
		clk2 =~clk2;
	end
	
	always begin
		`SLOW_HALF_CLOCK_PERIOD;
		clk1 = ~clk1;
	end

	initial begin
		qsim_out_1 = $fopen(`QSIM_OUT_FN_1,"w");
		clk1	= 0;
		clk2	= 0;
		enable	= 0;
		resetn	= 0;
		@(posedge clk1);
		resetn	= 1;
		w	= 0;
		enable	= 1;
		for (i = 0; i < 128; i = i+1) begin
			@(posedge clk1);
			w <= $urandom%256;
			$fwrite(qsim_out_1, "%d\n", w);
		end
		@(negedge clk1);
		resetn <= 0;
		@(posedge clk1);
		resetn <= 1;
		for (i = 0; i < 64; i = i+1) begin
			

			@(negedge clk1);
			
			w <= $urandom%65535;
			
			@(posedge clk1);


		end
		@(negedge clk1);

		@(posedge clk1);


		$finish;
	
	end

endmodule	

							
