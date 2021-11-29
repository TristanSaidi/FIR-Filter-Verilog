
`define ON 1'b0
`define OFF 1'b1
`define HIZ {20{1'bZ}}

/* 
 * Timing Information:
 * 	Inputs to sram_8blk must arrive before posedge clk.
 *	Outputs from sram_8blk arrive before the next posedge.
 */
module sram(
	output	wire	[19:0]	Q7, Q6, Q5, Q4,
	output	wire	[19:0]	Q3, Q2, Q1, Q0,
	input	wire	[19:0]	D,		/* Limited by Upstream Spec. */
	input	wire	[7:0]	A7, A6, A5, A4,
	input	wire	[7:0]	A3, A2, A1, A0,
	input	wire	[10:0]	CADDR,		/* Only Used when Writing Pre-Computed Sums to Memory. */
	input	wire		WEN, CEN,	/* Active Low */
	input	wire		clk
);

	genvar		i;
	wire		clk_bar;
	reg	[7:0]	AI [7:0];
	reg	[19:0]	DI;
	reg	[10:0]	CADDRI;
	wire	[19:0]	QI [7:0];

	assign	clk_bar	= ~clk;

	always	@(posedge clk) begin
		DI	<= D;
		CADDRI	<= CADDR;
		AI[7]	<= A7;
		AI[6]	<= A6;
		AI[5]	<= A5;
		AI[4]	<= A4;
		AI[3]	<= A3;
		AI[2]	<= A2;
		AI[1]	<= A1;
		AI[0]	<= A0;
	end

	assign	Q7	= QI[7];
	assign	Q6	= QI[6];
	assign	Q5	= QI[5];
	assign	Q4	= QI[4];
	assign	Q3	= QI[3];
	assign	Q2	= QI[2];
	assign	Q1	= QI[1];
	assign	Q0	= QI[0];

	generate
		for (i = 0; i < 8; i = i + 1) begin
			wire		WENIB;
			wire	[7:0]	AIB;
			/* For Correct Waveforms to appear, CADDRI needs to be defined	*/
			/* Despite the fact that ~WENI && ~CENI condition evaluates to	*/
			/* zero. I.e. in testbench have CADDRI set to 0 not Z.		*/
			assign	WENIB	= (~WEN & ~CEN & (CADDRI[10:8]==i)) ? (`ON) : (`OFF);
			assign	AIB	= (~WENIB) ? CADDRI[7:0] : AI[i];

			sram256w20b	SRAM_CORE(
							.Q	(QI[i]),
							.A	(AIB),
							.D	(DI),
							.WEN	(WENIB),
							.CEN	(CEN),
							.CLK	(clk_bar)
			);
		end
	endgenerate

endmodule /* sram */

