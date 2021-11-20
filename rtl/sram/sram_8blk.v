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
	output	reg	[19:0]	Q,		/* Only used to read <20'b Pre-Calculated Values. */
	input	wire	[19:0]	D,		/* Only used to load <20'b Pre-Calculated Values. */
	input	wire	[10:0]	A,		/* A[10:8] Encode Block. A[7:0] Encode Word.*/
	input	wire		WEN, CEN,	/* Active Low */
	input	wire		clk, sclk
);

	genvar		i;
	reg	[10:0]	AI;
	reg	[19:0]	DI;
	reg		WENI;
	wire	[19:0]	QI [7:0];

	always	@(posedge clk) begin
		DI	<= D;
		WENI	<= WEN;
		AI	= A;
	end

	always	@(clk==0) begin
		case (AI[10:8])
			0: Q <= QI[0];
			1: Q <= QI[1];
			2: Q <= QI[2];
			3: Q <= QI[3];
			4: Q <= QI[4];
			5: Q <= QI[5];
			6: Q <= QI[6];
			7: Q <= QI[7];
			default:
			    Q	<= `HIZ;
		endcase
	end

	generate
		for (i = 0; i < 8; i = i + 1) begin
			wire	CENI;
			assign	CENI	= (~CEN & (AI[10:8] == i)) ? `ON:`OFF;

			sram256w20b	SRAM_CORE(
							.Q	(QI[i]),
							.A	(AI[7:0]),
							.D	(DI),
							.WEN	(WENI),
							.CEN	(CENI),
							.CLK	(sclk)
			);
		end
	endgenerate

endmodule /* sram_32blk */

