
module fir_filter(
	output	wire	[15:0]	dout,
	output	wire		valid_out,
	input	wire	[15:0]	din,
	input	wire	[19:0]	CIN,
	input	wire	[10:0]	CADDR,
	input	wire		CLOAD,
	input	wire		valid_in,
	input	wire		clk_fast,
	input	wire		clk_slow,
	input	wire		resetn
);

	wire	[38:0]	ACC_OUT;
	wire		done, start, reset;
	wire	[7:0]	A7, A6, A5, A4;
	wire	[7:0]	A3, A2, A1, A0;

	da	UDA(
			.ACC_OUT	(ACC_OUT),
			.done		(done),
			.A7		(A7),
			.A6		(A6),
			.A5		(A5),
			.A4		(A4),
			.A3		(A3),
			.A2		(A2),
			.A1		(A1),
			.A0		(A0),
			.CIN		(CIN),
			.CADDR		(CADDR),
			.CLOAD		(CLOAD),
			.valid_in	(valid_in),
			.start		(start),
			.clk		(clk),
			.reset		(reset),
			.resetn		(resetn)
	);

	FIFO_SYSTEM	UFIFO_SYSTEM(
			.A7		(A7),
			.A6		(A6),
			.A5		(A5),
			.A4		(A4),
			.A3		(A3),
			.A2		(A2),
			.A1		(A1),
			.A0		(A0),
			.w		(din),
			.enable		(done),
			.clk		(clk_slow),
			.clk2		(clk_fast),
			.resetn		(resetn)
	);

	fir_filter_control	CONTROLLER(
			.valid_out	(valid_out),
			.start		(start),
			.reset		(reset),
			.valid_in	(valid_in),
			.clk_slow	(clk_slow)
	);

endmodule /* fir_filter */

