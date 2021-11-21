
`include "../ALU/ALU.v"

`define ON	1'b0
`define OFF	1'b1

/*
 *	Assumptions Made:
 	(We checked if these assumptions were okay to make with Ashish)

	1. We assume that instead of pure coefficients being read-in, that the
		precomputed-values needed for the ROM are streamed-in instead.
	2. We assume that the design is only 'started' once all of the
		precomputed-values needed to run are streamed-in. The values of
		the coefficients can only be changed by asserting resetn
		(asserting resetn does not empty the ROM, only the intermediate
		registers).
 */
module da_control(
	output	reg	reset, valid_out,
	output	reg	load_sreg, load_zreg, shift_sreg,
	output	reg	do_w0, do_w1, do_w2, do_w3,
	output	reg	do_y0, do_y1,
	output	reg	do_f0,
	output	reg	do_acc,
	output	reg	done,
	output	reg	CEN, WEN, 
	input	wire	resetn, start, clk, CLOAD, valid_in
);

	reg	[3:0]	i;
	reg	[3:0]	NS;
	wire	[3:0]	CS;
	assign	CS	= NS;

	/* STATE TABLE [BEGIN] */
	localparam S0	= 4'b0000, S1 	= 4'b0001, S2 	= 4'b0010, S3 	= 4'b0011;
	localparam S4	= 4'b0100, S5 	= 4'b0101, S6 	= 4'b0110, S7 	= 4'b0111;
	localparam S8	= 4'b1000, S9 	= 4'b1001, S10 	= 4'b1010, S11 	= 4'b1011;
	localparam S12	= 4'b1100, S13	= 4'b1101, S14	= 4'b1110, S15	= 4'b1111;
	/* STATE TABLE [END] */

	always	@(negedge clk) begin
		if (~resetn) begin
			NS		<= S0;
			do_acc		<= 0;
			reset		<= 0;
			load_sreg	<= 0;
			do_w0		<= 0;
			do_w1		<= 0;
			do_w2		<= 0;
			do_w3		<= 0;
			do_y0		<= 0;
			do_y1		<= 0;
			do_f0		<= 0;
			done		<= 0;
			CEN		<= `OFF;
			WEN		<= `OFF;
			i		<= 0;
		end
		else begin
			case (CS):
				S0:
					if (start) begin
						NS		<= S1;
						do_acc		<= 0;
						reset		<= 1;
						load_sreg	<= 1;
						shift_sreg	<= 0;
						do_w0		<= 0;
						do_w1		<= 0;
						do_w2		<= 0;
						do_w3		<= 0;
						do_y0		<= 0;
						do_y1		<= 0;
						do_f0		<= 0;
						done		<= 0;
						i		<= 0;
						CEN		<= `ON;
						WEN		<= `OFF;
					end
					else begin
						NS		<= S0;
						do_acc		<= 0;
						reset		<= 0;
						load_sreg	<= 0;
						shift_sreg	<= 0;
						do_w0		<= 0;
						do_w1		<= 0;
						do_w2		<= 0;
						do_w3		<= 0;
						do_y0		<= 0;
						do_y1		<= 0;
						do_f0		<= 0;
						i		<= 0;
						done		<= 0;
						if (CLOAD & valid_in) begin
							CEN	<= `ON;
							WEN	<= `ON;
						end
						else begin
							CEN	<= `OFF;
							WEN	<= `OFF;
						end
					end
				S1:
					NS		<= S2;
					do_acc		<= 0;
					reset		<= 1;
					load_sreg	<= 1;
					shift_sreg	<= 0;
					load_zreg	<= 0;
					do_w0		<= 0;
					do_w1		<= 0;
					do_w2		<= 0;
					do_w3		<= 0;
					do_y0		<= 0;
					do_y1		<= 0;
					do_f0		<= 0;
					done		<= 0;
					i		<= 0;
					CEN		<= `ON;
					WEN		<= `OFF;
				S2:
					NS		<= S3;
					do_acc		<= 0;
					reset		<= 0;
					load_sreg	<= 0;
					load_zreg	<= 1;
					shift_sreg	<= 0;
					do_w0		<= 0;
					do_w1		<= 0;
					do_w2		<= 0;
					do_w3		<= 0;
					do_y0		<= 0;
					do_y1		<= 0;
					do_f0		<= 0;
					done		<= 0;
					CEN		<= `OFF;
					WEN		<= `OFF;
				S3:
					NS		<= S4;
					do_acc		<= 0;
					reset		<= 0;
					load_sreg	<= 0;
					load_zreg	<= 0;
					shift_sreg	<= 0;
					do_w0		<= 1;
					do_w1		<= 0;
					do_w2		<= 0;
					do_w3		<= 0;
					do_y0		<= 0;
					do_y1		<= 0;
					do_f0		<= 0;
					done		<= 0;
					CEN		<= `OFF;
					WEN		<= `OFF;
				S4:
					NS		<= S5;
					do_acc		<= 0;
					reset		<= 0;
					load_sreg	<= 0;
					load_zreg	<= 0;
					shift_sreg	<= 0;
					do_w0		<= 0;
					do_w1		<= 1;
					do_w2		<= 0;
					do_w3		<= 0;
					do_y0		<= 0;
					do_y1		<= 0;
					do_f0		<= 0;
					done		<= 0;
					CEN		<= `OFF;
					WEN		<= `OFF;
				S5:
					NS		<= S6;
					do_acc		<= 0;
					reset		<= 0;
					load_sreg	<= 0;
					load_zreg	<= 0;
					shift_sreg	<= 0;
					do_w0		<= 0;
					do_w1		<= 0;
					do_w2		<= 1;
					do_w3		<= 0;
					do_y0		<= 0;
					do_y1		<= 0;
					do_f0		<= 0;
					done		<= 0;
					CEN		<= `OFF;
					WEN		<= `OFF;
				S6:
					NS		<= S7;
					do_acc		<= 0;
					reset		<= 0;
					load_sreg	<= 0;
					load_zreg	<= 0;
					shift_sreg	<= 0;
					do_w0		<= 0;
					do_w1		<= 0;
					do_w2		<= 0;
					do_w3		<= 1;
					do_y0		<= 0;
					do_y1		<= 0;
					do_f0		<= 0;
					done		<= 0;
					CEN		<= `OFF;
					WEN		<= `OFF;
				S7:
					NS		<= S8;
					do_acc		<= 0;
					reset		<= 0;
					load_sreg	<= 0;
					load_zreg	<= 0;
					shift_sreg	<= 0;
					do_w0		<= 0;
					do_w1		<= 0;
					do_w2		<= 0;
					do_w3		<= 0;
					do_y0		<= 1;
					do_y1		<= 0;
					do_f0		<= 0;
					done		<= 0;
					CEN		<= `OFF;
					WEN		<= `OFF;
				S8:
					NS		<= S9;
					do_acc		<= 0;
					reset		<= 0;
					load_sreg	<= 0;
					load_zreg	<= 0;
					shift_sreg	<= 0;
					do_w0		<= 0;
					do_w1		<= 0;
					do_w2		<= 0;
					do_w3		<= 0;
					do_y0		<= 0;
					do_y1		<= 1;
					do_f0		<= 0;
					done		<= 0;
					CEN		<= `OFF;
					WEN		<= `OFF;
				S9:
					NS		<= S10;
					do_acc		<= 1;
					reset		<= 0;
					load_sreg	<= 0;
					load_zreg	<= 0;
					shift_sreg	<= 0;
					do_w0		<= 0;
					do_w1		<= 0;
					do_w2		<= 0;
					do_w3		<= 0;
					do_y0		<= 0;
					do_y1		<= 0;
					do_f0		<= 1;
					i		<= i + 1;
					done		<= 0;
					CEN		<= `OFF;
					WEN		<= `OFF;
				S10:
					do_acc		<= 1;
					reset		<= 0;
					load_sreg	<= 0;
					load_zreg	<= 0;
					shift_sreg	<= 0;
					do_w0		<= 0;
					do_w1		<= 0;
					do_w2		<= 0;
					do_w3		<= 0;
					do_y0		<= 0;
					do_y1		<= 0;
					do_f0		<= 0;
					done		<= 0;
					CEN		<= `OFF;
					WEN		<= `OFF;
					if (i == 4'b1111) begin
						NS	<= S11;
					end
					else begin
						NS	<= S12;
					end
				S11:
					do_acc		<= 0;
					load_sreg	<= 0;
					load_zreg	<= 0;
					shift_sreg	<= 0;
					do_w0		<= 0;
					do_w1		<= 0;
					do_w2		<= 0;
					do_w3		<= 0;
					do_y0		<= 0;
					do_y1		<= 0;
					do_f0		<= 0;
					done		<= 1;
					CEN		<= `OFF;
					WEN		<= `OFF;
					if (start) begin
						NS		<= S1;
					end
					else begin
						NS		<= S11;
					end
				S12:
					NS		<= S2;
					do_acc		<= 0;
					reset		<= 0;
					load_sreg	<= 0;
					load_zreg	<= 0;
					shift_sreg	<= 1;
					do_w0		<= 0;
					do_w1		<= 0;
					do_w2		<= 0;
					do_w3		<= 0;
					do_y0		<= 0;
					do_y1		<= 0;
					do_f0		<= 0;
					done		<= 0;
					i		<= 0;
					CEN		<= `OFF;
					WEN		<= `OFF;
				default:
					NS		<= S0;
					do_acc		<= 0;
					reset		<= 1;
					load_sreg	<= 0;
					load_zreg	<= 0;
					shift_sreg	<= 0;
					do_w0		<= 0;
					do_w1		<= 0;
					do_w2		<= 0;
					do_w3		<= 0;
					do_y0		<= 0;
					do_y1		<= 0;
					do_f0		<= 0;
					done		<= 0;
					i		<= 0;
					CEN		<= `OFF;
					WEN		<= `OFF;
			endcase
		end
	end

endmodule /* da_control */
