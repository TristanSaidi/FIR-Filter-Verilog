/*
	SRAM_512w16b TIMING INFORMATION (TT)
	ta	= 3.183
	tas	= 0.808
	tah	= 0.028
	tcs	= 0.635
	tch	= 0.000
	tws	= 0.409
	twh	= 0.000
	tds	= 0.247
	tdh	= 0.100

	NOTE: Setup Checks used 1ns?
*/

`define ON 1'b0
`define OFF 1'b1
`define HIZ {20{1'bZ}}


/*
 *	At the Negative Edge of clk, the transmitter sends inputs.
 *	At the same Negative Edge of clk, Combinational Logic begins
 *		to determine CEN for each Block SRAM. This should be finished
 *		before 1.5n.
 *	On the next Negative Edge of clk, after 0.683ns, the outputs should be
 *		ready, T_contamination = 0.817ns.
 */


/*
 *	Inputs Latched on the negedge of CLK. Outputs arrive 3.183
 *	after the following posedge of CLK.
 */
module sram_8blk(
	output	wire	[19:0]	Q7, Q6, Q5, Q4,
	output	wire	[19:0]	Q3, Q2, Q1, Q0,
	input	wire	[19:0]	D,		/* Limited by Upstream Spec. */
	input	wire	[7:0]	A7, A6, A5, A4,
	input	wire	[7:0]	A3, A2, A1, A0,
	input	wire	[10:0]	CADDR,		/* Only Used when Writing Pre-Computed Sums to Memory. */
	input	wire		WEN, CEN,	/* Active Low */
	input	wire		clk, sclk
);

	genvar		i;
	reg	[7:0]	AI [7:0];
	reg	[19:0]	DI;
	reg	[10:0]	CADDRI;
	reg		WENI, CENI;
	wire	[19:0]	QI [7:0];

	always	@(posedge clk) begin
		DI	<= D;
		WENI	<= WEN;
		CENI	<= CEN;
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

			assign	WENIB	= (~WENI && ~CENI && (CADDRI[10:8]==i)) ? (`ON) : (`OFF);
			assign	AIB	= (~WENIB) ? CADDRI[7:0] : AI[i];

			sram256w20b	SRAM_CORE(
							.Q	(QI[i]),
							.A	(AIB),
							.D	(DI),
							.WEN	(WENIB),
							.CEN	(CENI),
							.CLK	(sclk)
			);
		end
	endgenerate

endmodule /* sram_32blk */

