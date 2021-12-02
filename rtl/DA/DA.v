
`include "../sram/sram.v"

/*
 *  CEN and WEN are evaluated on the posedge, but are not latched internally
 *  inside of the SRAM. This is so that we can shut the sram on/off
 *  dynamically. da_control guarantees that it does not cause HOLD/SETUP
 *  Time violations.
 */

module	DA(
	output	reg	[38:0]	ACC_OUT,
	input	wire	[7:0]	A7, A6, A5, A4,
	input	wire	[7:0]	A3, A2, A1, A0,
	input	wire	[19:0]	CIN,
	input	wire	[10:0]	CADDR,
	input	wire		WEN,CEN,
	input	wire		reset, clk, resetn
);
	wire	[38:0]	ACC;

	wire	[19:0]	Q0, Q1, Q2, Q3;
	wire	[19:0]	Q4, Q5, Q6, Q7;

	reg	[19:0]	Z0, Z1, Z2, Z3;
	reg	[19:0]	Z4, Z5, Z6, Z7;
	wire	[20:0]	W3, W2, W1, W0;
	wire	[21:0]	Y0,Y1;
	assign W0 = Z0 + Z1;
	assign W1 = Z2 + Z3;
	assign W2 = Z4 + Z5;
	assign W3 = Z6 + Z7;
	assign Y0 = W0 + W1;
	assign Y1 = W2 + W3;
	assign ACC = Y0+Y1;
	sram	ROM_BANK(
					.Q7	(Q7),
					.Q6	(Q6),
					.Q5	(Q5),
					.Q4	(Q4),
					.Q3	(Q3),
					.Q2	(Q2),
					.Q1	(Q1),
					.Q0	(Q0),
					.A7	(A7),
					.A6	(A6),
					.A5	(A5),
					.A4	(A4),
					.A3	(A3),
					.A2	(A2),
					.A1	(A1),
					.A0	(A0),
					.D	(CIN),
					.CADDR	(CADDR),
					.WEN	(WEN),
					.CEN	(CEN),
					.clk	(clk)
);



	always	@(posedge clk) begin
		if (~resetn) begin
			Z7		<= 0;
			Z6		<= 0;
			Z5		<= 0;
			Z4		<= 0;
			Z3		<= 0;
			Z2		<= 0;
			Z1		<= 0;
			Z0		<= 0;

		end
		else begin
			Z7		<= Q7;
			Z6		<= Q6;
			Z5		<= Q5;
			Z4		<= Q4;
			Z3		<= Q3;
			Z2		<= Q2;
			Z1		<= Q1;
			Z0		<= Q0;
			ACC_OUT		<= ACC;
			
			
		end

		if (reset) begin
			ACC_OUT		<= 0;
		end
	end
endmodule /* da */



