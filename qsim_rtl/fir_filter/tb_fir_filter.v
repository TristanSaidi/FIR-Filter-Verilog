
`timescale 1ns/1ps
`define QSIM_IN_FN_1 		"./reports/golden_block.rpt"
`define QSIM_OUT_FN_1		"./reports/outputs.rpt"
`define HALF_FAST_CLK_CYCLE	#2.00
`define HALF_SLOW_CLK_CYCLE	#20.00
`define FAST_SLOW_CLK_RATIO	10
`define QRTR_FAST_CLK_CYCLE	#1.00
`define QRTR_SLOW_CLK_CYCLE	#10.00
`define ITER 			10
`define PRECOMP			2048

module testbench();

	integer	qsim_in_1, qsim_out_1;
	integer	i;
	integer	writing;


	wire	[15:0]		Y;
	wire			valid_out;
	reg	[15:0]		X;
	reg	[19:0]		CIN;
	reg	[10:0]		CADDR;
	reg			CLOAD;
	reg			valid_in;
	reg			clk_slow, clk_fast;
	reg			resetn;
	integer	CIN_INT;
	integer	X_INT;
	integer	Y_INT;

	fir_filter	DUT(
		.dout		(Y),
		.valid_out	(valid_out),
		.din		(X),
		.CIN		(CIN),
		.CADDR		(CADDR),
		.CLOAD		(CLOAD),
		.valid_in	(valid_in),
		.clk_fast	(clk_fast),
		.clk_slow	(clk_slow),
		.resetn		(resetn)
	);

	always begin
		`HALF_FAST_CLK_CYCLE
		clk_fast	= ~clk_fast;
	end
	always begin
		`HALF_SLOW_CLK_CYCLE;
		clk_slow	= ~clk_slow;
	end

	integer	j;
	always	@(posedge clk_fast) begin
		j = j + 1;
	end
	always	@(negedge clk_fast) begin
		`QRTR_FAST_CLK_CYCLE;
		if (((j + 1) % `FAST_SLOW_CLK_RATIO) == 0) begin
			if (writing == 1) begin
				CIN_INT		= i;
				CIN		= CIN_INT;
				CADDR		= i;
				CLOAD		= 1'b1;
				valid_in	= 1'b1;
				$fwrite(qsim_out_1, "%0d\n", CIN_INT);
				`HALF_FAST_CLK_CYCLE;
				valid_in	= 1'b0;
				CLOAD		= 1'b0;
			end
			else if (writing == 0) begin
				$fwrite(qsim_out_1, "%0d,%0d\n", X_INT, Y_INT);
				X		= i;
				X_INT		= X;
				valid_in	= 1'b1;
				`HALF_FAST_CLK_CYCLE;
				valid_in	= 1'b0;
			end
		end
	end

	initial begin
		writing		= 3;
		qsim_out_1	= $fopen(`QSIM_OUT_FN_1, "w");
		clk_slow	= 0;
		clk_fast	= 0;
		@(posedge clk_slow);
		clk_fast	= 1;
		resetn		= 0;
		@(posedge clk_slow);
		resetn		= 1;
		writing		= 1;
		j		= 0;
		for (i = 0; i < `PRECOMP; i = i + 1) begin
			@(posedge clk_slow);
		end
		writing		= 0;
		j		= 0;
		for (i = 0; i < `ITER; i = i + 1) begin
			@(posedge clk_slow);
		end
		$fclose(qsim_in_1);
		$fclose(qsim_out_1);
		$finish;
	end

endmodule /* testbench */

