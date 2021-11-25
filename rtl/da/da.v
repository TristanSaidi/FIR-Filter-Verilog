
`include "../sram/sram_8blk.v"
`include "./da_control.v"

module addern(X, Y, S);
	parameter n = 38;
	input wire [n:0] X, Y;
	output wire [n:0]S;
	assign	S	= X + Y;
endmodule

module	da(
	output	wire	[38:0]	ACC_OUT,
	output	wire		valid_out,
	input	wire	[7:0]	A7, A6, A5, A4,
	input	wire	[7:0]	A3, A2, A1, A0,
	input	wire	[19:0]	CIN,
	input	wire	[10:0]	CADDR,
	input	wire		CLOAD, valid_in,
	input	wire		start, clk, sclk, resetn
);
	reg	[38:0]	ACC;
	reg	[38:0]	X_ADDER_REG, Y_ADDER_REG;
	wire	[38:0]	ADDER_RESULT;

	assign	ACC_OUT	= ACC;
	wire	load_zreg;
	wire	do_w0, do_w1, do_w2, do_w3;
	wire	do_y0, do_y1;
	wire	do_f0;
	wire	do_acc;
	wire	CEN, WEN;

	da_control	CONTROL(
			.valid_out	(valid_out),
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
			.CLOAD		(CLOAD),
			.valid_in	(valid_in)
	);

	addern		ADDER(
				.X	(X_ADDER_REG),
				.Y	(Y_ADDER_REG),
				.S	(ADDER_RESULT)
	);


	wire	[19:0]	Q0, Q1, Q2, Q3;
	wire	[19:0]	Q4, Q5, Q6, Q7;

	reg	[19:0]	Z0, Z1, Z2, Z3;
	reg	[19:0]	Z4, Z5, Z6, Z7;

	sram_8blk	ROM_BANK(
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
					.clk	(clk),
					.sclk	(sclk)
);

	reg	[20:0]	W3, W2, W1, W0;
	reg	[21:0]	Y0;
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
		end
		else if (load_zreg) begin
			Z7		<= Q7;
			Z6		<= Q6;
			Z5		<= Q5;
			Z4		<= Q4;
			Z3		<= Q3;
			Z2		<= Q2;
			Z1		<= Q1;
			Z0		<= Q0;
			W3		<= 0;
			W2		<= 0;
			W1		<= 0;
			W0		<= 0;
			Y0		<= 0;
		end
		else if (do_w0) begin
			X_ADDER_REG	<= {{19{Z0[19]}}, Z0};
			Y_ADDER_REG	<= {{19{Z1[19]}}, Z1};
		end
		else if (do_w1) begin
			X_ADDER_REG	<= {{19{Z2[19]}}, Z2};
			Y_ADDER_REG	<= {{19{Z3[19]}}, Z3};
			W0		<= ADDER_RESULT[20:0];
		end
		else if (do_w2) begin
			X_ADDER_REG	<= {{19{Z4[19]}}, Z4};
			Y_ADDER_REG	<= {{19{Z5[19]}}, Z5};
			W1		<= ADDER_RESULT[20:0];
		end
		else if (do_w3) begin
			X_ADDER_REG	<= {{19{Z6[19]}}, Z6};
			Y_ADDER_REG	<= {{19{Z7[19]}}, Z7};
			W2		<= ADDER_RESULT[20:0];
		end
		else if (do_y0) begin
			X_ADDER_REG	<= {{18{W0[20]}}, W0};
			Y_ADDER_REG	<= {{18{W1[20]}}, W1};
			W3		<= ADDER_RESULT[20:0];
		end
		else if (do_y1) begin
			X_ADDER_REG	<= {{18{W2[20]}}, W2};
			Y_ADDER_REG	<= {{18{W3[20]}}, W3};
			Y0		<= ADDER_RESULT[21:0];
		end
		else if (do_f0) begin
			X_ADDER_REG	<= {{17{Y0[21]}}, Y0};
			Y_ADDER_REG	<= ADDER_RESULT;//[38:0]; // Clock Cycle After do_y1 => y1 is on this line.
		end
		else if (do_acc) begin
			X_ADDER_REG	<= (ACC << 1); // CHECK THIS LATER
			Y_ADDER_REG	<= ADDER_RESULT;//[38:0]; // Clock Cycle After do_f0 => f0 is on this line.
			prev_doacc	<= 1'b1;
		end
		else if (prev_doacc) begin
			ACC		<= ADDER_RESULT;
			prev_doacc	<= 1'b0;
		end
	end
endmodule /* da */



