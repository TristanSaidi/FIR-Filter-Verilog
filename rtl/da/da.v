
`include "../sram/sram.v"
`include "../da/da_control.v"

/*
 *  CEN and WEN are evaluated on the posedge, but are not latched internally
 *  inside of the SRAM. This is so that we can shut the sram on/off
 *  dynamically. da_control guarantees that it does not cause HOLD/SETUP
 *  Time violations.
 */

module	da(
	output	wire	[37:0]	ACC_OUT,
	output	wire		done,
	input	wire	[7:0]	A7, A6, A5, A4,
	input	wire	[7:0]	A3, A2, A1, A0,
	input	wire	[18:0]	CIN,
	input	wire	[10:0]	CADDR,
	input	wire		CLOAD,
	input	wire		start, clk, reset, resetn
);
	reg		NEGATE;
	reg	[38:0]	ACC;
	reg		C_ADDER_REG;
	reg	[37:0]	X_ADDER_REG, Y_ADDER_REG;
	wire	[38:0]	ADDER_RESULT;

	assign	ACC_OUT	= ACC[37:0];
	wire	load_zreg;
	wire	do_w0, do_w1, do_w2, do_w3;
	wire	do_y0, do_y1;
	wire	do_f0;
	wire	do_acc;
	wire	CEN, WEN;

	assign	ADDER_RESULT	= X_ADDER_REG + Y_ADDER_REG + C_ADDER_REG;

	da_control	CONTROL(
			.done	(done),
			.load_zreg	(load_zreg),
			.do_w0		(do_w0),
			.do_w1		(do_w1),
			.do_w2		(do_w2),
			.do_w3		(do_w3),
			.do_y0		(do_y0),
			.do_y1		(do_y1),
			.do_f0		(do_f0),
			.do_acc		(do_acc),
			.CEN		(CEN),
			.WEN		(WEN),
			.resetn		(resetn),
			.start		(start),
			.clk		(clk),
			.CLOAD		(CLOAD)
	);

	wire	[19:0]	Q0, Q1, Q2, Q3;
	wire	[19:0]	Q4, Q5, Q6, Q7;

	reg	[18:0]	Z0, Z1, Z2, Z3;
	reg	[18:0]	Z4, Z5, Z6, Z7;

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
					.D	({1'b0, CIN}),
					.CADDR	(CADDR),
					.WEN	(WEN),
					.CEN	(CEN),
					.clk	(clk)
);

	reg	[19:0]	W3, W2, W1, W0;
	reg	[20:0]	Y0;
	reg		prev_doacc;

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
			W3		<= 0;
			W2		<= 0;
			W1		<= 0;
			W0		<= 0;
			Y0		<= 0;
			ACC		<= 0;
			X_ADDER_REG	<= 0;
			Y_ADDER_REG	<= 0;
			C_ADDER_REG	<= 0;
			NEGATE		<= 1;
		end
		else if (load_zreg) begin
			Z7		<= Q7[18:0];
			Z6		<= Q6[18:0];
			Z5		<= Q5[18:0];
			Z4		<= Q4[18:0];
			Z3		<= Q3[18:0];
			Z2		<= Q2[18:0];
			Z1		<= Q1[18:0];
			Z0		<= Q0[18:0];
		end
		else if (do_w0) begin
			X_ADDER_REG	<= {{19{Z0[18]}}, Z0};
			Y_ADDER_REG	<= {{19{Z1[18]}}, Z1};
			C_ADDER_REG	<= 1'b0;
		end
		else if (do_w1) begin
			X_ADDER_REG	<= {{19{Z2[18]}}, Z2};
			Y_ADDER_REG	<= {{19{Z3[18]}}, Z3};
			C_ADDER_REG	<= 1'b0;
			W0		<= ADDER_RESULT[19:0];
		end
		else if (do_w2) begin
			X_ADDER_REG	<= {{19{Z4[18]}}, Z4};
			Y_ADDER_REG	<= {{19{Z5[18]}}, Z5};
			C_ADDER_REG	<= 1'b0;
			W1		<= ADDER_RESULT[19:0];
		end
		else if (do_w3) begin
			X_ADDER_REG	<= {{19{Z6[18]}}, Z6};
			Y_ADDER_REG	<= {{19{Z7[18]}}, Z7};
			C_ADDER_REG	<= 1'b0;
			W2		<= ADDER_RESULT[19:0];
		end
		else if (do_y0) begin
			X_ADDER_REG	<= {{18{W0[19]}}, W0};
			Y_ADDER_REG	<= {{18{W1[19]}}, W1};
			C_ADDER_REG	<= 1'b0;
			W3		<= ADDER_RESULT[19:0];
		end
		else if (do_y1) begin
			X_ADDER_REG	<= {{18{W2[19]}}, W2};
			Y_ADDER_REG	<= {{18{W3[19]}}, W3};
			C_ADDER_REG	<= 1'b0;
			Y0		<= ADDER_RESULT[20:0];
		end
		else if (do_f0) begin
			X_ADDER_REG	<= {{17{Y0[20]}}, Y0};
			Y_ADDER_REG	<= {{17{ADDER_RESULT[20]}}, ADDER_RESULT[20:0]};
			C_ADDER_REG	<= 1'b0;
		end
		else if (do_acc) begin
			X_ADDER_REG	<= {ACC[37:0], 1'b0};
			if (NEGATE == 1) begin
				Y_ADDER_REG	<= ~{{16{ADDER_RESULT[21]}}, ADDER_RESULT[21:0]};
				C_ADDER_REG	<= 1'b1;
			end
			else begin
				Y_ADDER_REG	<= {{16{ADDER_RESULT[21]}}, ADDER_RESULT[21:0]};
				C_ADDER_REG	<= 1'b0;
			end
			prev_doacc	<= 1'b1;
		end
		else if (prev_doacc & ~reset) begin
			ACC		<= ADDER_RESULT;
			prev_doacc	<= 1'b0;
			NEGATE		<= 1'b0;
		end
		else begin
		end

		if (reset) begin
			NEGATE		<= 1'b1;
			ACC		<= 0;
		end
	end
endmodule /* da */



