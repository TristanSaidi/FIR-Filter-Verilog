
`timescale 1ns/1ps

`define HALF_CLK_PERIOD	#1.000
`define	QRTR_CLK_PERIOD #0.500
`define QSIM_OUT_FN 	"output"
`define ITER		25
`define ALTER_1		20'b1010_1010_1010_1010_1010
`define ALTER_2		20'b0101_0101_0101_0101_0101

module testbench();

	integer		i, qsim_out;
	reg		clk, resetn, load, enable;
	reg	[19:0]	X;
	wire		Q;

	rshiftregne	DUT(
				.Q		(Q),
				.X		(X),
				.load		(load),
				.enable		(enable),
				.shift_in	(1'b0),
				.clk		(clk),
				.resetn		(resetn)
	);
	defparam	DUT.n=20;

	always	begin
		`HALF_CLK_PERIOD
		clk	= ~clk;
	end

	always	@(negedge clk) begin
		`QRTR_CLK_PERIOD
		enable	= $urandom%2;
	end

	initial	begin
		//qsim_out	= $fopen(`QSIM_OUT_FN, "w");
		clk		= 0;
		@(posedge clk);
		resetn		= 0;
		@(posedge clk);
		resetn		= 1;
		load		= 1;
		X		= `ALTER_1;
		@(posedge clk);
		load		= 0;
		X		= 0;
		for (i = 0; i < `ITER; i = i + 1) begin
			@(posedge clk);
		end
		load 		= 1;
		X		= `ALTER_2;
		for (i = 0; i < `ITER; i = i + 1) begin
			@(posedge clk);
		end
		//$fclose(qsim_out);
		$finish;
	end
endmodule
