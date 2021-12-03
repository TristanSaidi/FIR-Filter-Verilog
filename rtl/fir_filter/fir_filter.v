`include "../da/da.v"
`include "../FIFO_system/FIFO_system.v"
`include "../Control/Control.v"
module fir_filter(
	output	wire	[38:0]	dout,
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
	wire		done, start_DA, reset_DA, reset_FIFO;
	wire		resetn_FIFO, resetn_DA, enable_FIFO; 
	wire	[7:0]	A7, A6, A5, A4;
	wire	[7:0]	A3, A2, A1, A0;

	da	da(
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
			.start		(start_DA),
			.clk		(clk_fast),
			.reset		(reset_DA),
			.resetn		(resetn_DA)
	);

	FIFO_system	FIFO_system(
			.A7		(A7),
			.A6		(A6),
			.A5		(A5),
			.A4		(A4),
			.A3		(A3),
			.A2		(A2),
			.A1		(A1),
			.A0		(A0),
			.w		(din),
			.enable		(enable_FIFO),
			.clk		(clk_slow),
			.clk2		(clk_fast),
			.resetn		(resetn_FIFO)
	);

	Control		Control(
			.clk		(clk_slow),
			.valid_in	(valid_in),
			.resetn		(resetn),
			.CLOAD		(CLOAD),
			.enable_FIFO	(enable_FIFO),
			.resetn_FIFO	(resetn_FIFO),
			.reset_DA	(reset_DA),
			.resetn_DA	(resetn_DA),
			.start_DA	(start_DA),
			.global_valid_out (valid_out)
	);

	assign	dout = ACC_OUT;

endmodule /* fir_filter */

