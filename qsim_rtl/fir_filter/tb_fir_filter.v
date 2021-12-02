
`timescale 1ns/1ps
`define QSIM_IN_FN_1 		"./reports/golden_block.rpt"
`define QSIM_OUT_FN_1		"./reports/outputs.rpt"
`define HALF_CLK_PERIOD		#1.00
`define FAST_SLOW_CLK_RATIO	100
`define ITER 			10000

module testbench();

	integer	qsim_in_1, qsim_out_1;
	integer	i, j;
	integer	writing;


	wire	[15:0]		y;
	wire			valid_out;
	reg	[15:0]		x;
	reg	[19:0]		CIN;
	reg	[10:0]		CADDR;
	reg			CLOAD;
	reg			valid_in;
	reg			clk_slow, clk_fast;
	reg			resetn;
	integer	CIN_INT	[2047:0];
	integer	X_INT	[`ITER:0];
	integer	Y_INT	[`ITER:0];

	/*fir_filter	DUT(
		.dout		(y),
		.valid_out	(valid_out),
		.din		(x),
		.CIN		(CIN),
		.CADDR		(CADDR),
		.CLOAD		(CLOAD),
		.valid_in	(valid_in),
		.clk_fast	(clk_fast),
		.clk_slow	(clk_slow),
		.resetn		(resetn)
	);*/

	/*always	begin
		`HALF_CLK_PERIOD
		clk_fast	= ~clk_fast;
		if ((i % `FAST_SLOW_CLK_RATIO) == 0) begin
			clk_slow	= ~clk_slow;
		end
	end*/

	integer	ret_value;

	initial begin
		qsim_in_1	= $fopen(`QSIM_IN_FN_1, "r");
		qsim_out_1	= $fopen(`QSIM_OUT_FN_1, "w");
		for (j = 0; j < 2048; j = j + 1) begin
			$fscanf(qsim_in_1, "%d\n", CIN_INT[j]);
			$display(CIN_INT[j]);
		end
		for (j = 0; j < 2048; j = j + 1) begin
			$fwrite(qsim_out_1, "%0d\n", CIN_INT[j]);
			$display(CIN_INT[j]);
		end
		for (j = 0; j < `ITER; j = j + 1) begin
			ret_value	= $fscanf(qsim_in_1, "%d,%d\n", X_INT[j], Y_INT[j]);
		end
		for (j = 0; j < `ITER; j = j + 1) begin
			$fwrite(qsim_out_1, "%0d,%0d\n", X_INT[j], Y_INT[j]);
		end
		$fclose(qsim_in_1);
		$fclose(qsim_out_1);
		$finish;
	end

endmodule /* testbench */

