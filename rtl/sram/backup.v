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
	output	reg	[31:0]	Q,
	input	wire	[31:0]	D,
	input	wire	[15:0]	A,		/* A[15:13] Encode Block. A[12:0] Encode Word.*/
	input	wire		WEN, CEN,	/* Active Low */
	input	wire		clk, sclk
);

	genvar		i;
	reg	[15:0]	AI, AIP;
	reg	[31:0]	DI;
	reg		WENI;
	wire	[31:0]	QI [127:0];

	always	@(negedge clk) begin
		DI	<= D;
		WENI	<= WEN;
		AI	= A;
	end
	always	@(posedge clk) begin
		AIP	= AI;
	end

	always	@(clk==0) begin
		case (AIP[15:9])
			0: Q <= QI[0];
			1: Q <= QI[1];
			2: Q <= QI[2];
			3: Q <= QI[3];
			4: Q <= QI[4];
			5: Q <= QI[5];
			6: Q <= QI[6];
			7: Q <= QI[7];
			8: Q <= QI[8];
			9: Q <= QI[9];
			10: Q <= QI[10];
			11: Q <= QI[11];
			12: Q <= QI[12];
			13: Q <= QI[13];
			14: Q <= QI[14];
			15: Q <= QI[15];
			16: Q <= QI[16];
			17: Q <= QI[17];
			18: Q <= QI[18];
			19: Q <= QI[19];
			20: Q <= QI[20];
			21: Q <= QI[21];
			22: Q <= QI[22];
			23: Q <= QI[23];
			24: Q <= QI[24];
			25: Q <= QI[25];
			26: Q <= QI[26];
			27: Q <= QI[27];
			28: Q <= QI[28];
			29: Q <= QI[29];
			30: Q <= QI[30];
			31: Q <= QI[31];
			32: Q <= QI[32];
			33: Q <= QI[33];
			34: Q <= QI[34];
			35: Q <= QI[35];
			36: Q <= QI[36];
			37: Q <= QI[37];
			38: Q <= QI[38];
			39: Q <= QI[39];
			40: Q <= QI[40];
			41: Q <= QI[41];
			42: Q <= QI[42];
			43: Q <= QI[43];
			44: Q <= QI[44];
			45: Q <= QI[45];
			46: Q <= QI[46];
			47: Q <= QI[47];
			48: Q <= QI[48];
			49: Q <= QI[49];
			50: Q <= QI[50];
			51: Q <= QI[51];
			52: Q <= QI[52];
			53: Q <= QI[53];
			54: Q <= QI[54];
			55: Q <= QI[55];
			56: Q <= QI[56];
			57: Q <= QI[57];
			58: Q <= QI[58];
			59: Q <= QI[59];
			60: Q <= QI[60];
			61: Q <= QI[61];
			62: Q <= QI[62];
			63: Q <= QI[63];
			64: Q <= QI[64];
			65: Q <= QI[65];
			66: Q <= QI[66];
			67: Q <= QI[67];
			68: Q <= QI[68];
			69: Q <= QI[69];
			70: Q <= QI[70];
			71: Q <= QI[71];
			72: Q <= QI[72];
			73: Q <= QI[73];
			74: Q <= QI[74];
			75: Q <= QI[75];
			76: Q <= QI[76];
			77: Q <= QI[77];
			78: Q <= QI[78];
			79: Q <= QI[79];
			80: Q <= QI[80];
			81: Q <= QI[81];
			82: Q <= QI[82];
			83: Q <= QI[83];
			84: Q <= QI[84];
			85: Q <= QI[85];
			86: Q <= QI[86];
			87: Q <= QI[87];
			88: Q <= QI[88];
			89: Q <= QI[89];
			90: Q <= QI[90];
			91: Q <= QI[91];
			92: Q <= QI[92];
			93: Q <= QI[93];
			94: Q <= QI[94];
			95: Q <= QI[95];
			96: Q <= QI[96];
			97: Q <= QI[97];
			98: Q <= QI[98];
			99: Q <= QI[99];
			100: Q <= QI[100];
			101: Q <= QI[101];
			102: Q <= QI[102];
			103: Q <= QI[103];
			104: Q <= QI[104];
			105: Q <= QI[105];
			106: Q <= QI[106];
			107: Q <= QI[107];
			108: Q <= QI[108];
			109: Q <= QI[109];
			110: Q <= QI[110];
			111: Q <= QI[111];
			112: Q <= QI[112];
			113: Q <= QI[113];
			114: Q <= QI[114];
			115: Q <= QI[115];
			116: Q <= QI[116];
			117: Q <= QI[117];
			118: Q <= QI[118];
			119: Q <= QI[119];
			120: Q <= QI[120];
			121: Q <= QI[121];
			122: Q <= QI[122];
			123: Q <= QI[123];
			124: Q <= QI[124];
			125: Q <= QI[125];
			126: Q <= QI[126];
			127: Q <= QI[127];
			default:
			    Q	<= {32{1'bZ}};
		endcase
	end

	generate
		for (i = 0; i < 128; i = i + 1) begin
			wire	CENI;
			assign	CENI	= (~CEN & (AI[15:9] == i)) ? `ON:`OFF;

			sram512w32b	SRAM_CORE(
							.Q	(QI[i]),
							.A	(AI[8:0]),
							.D	(DI),
							.WEN	(WENI),
							.CEN	(CENI),
							.CLK	(sclk)
			);
		end
	endgenerate

endmodule /* sram_32blk */

