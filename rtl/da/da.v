
`include "../ALU/ALU.v"
`include "../sram/sram_8blk.v"
`include "./da_control.v"

module	da(
	output	reg	[37:0]	acc,
	output	wire		done,
	input	wire	[7:0]	A7, A6, A5, A4,
	input	wire	[7:0]	A3, A2, A1, A0,
	input	wire	[19:0]	CIN,
	input	wire	[10:0]	CADDR,
	input	wire		CLOAD, valid_in,
	input	wire		start, clk, sclk, resetn
);

	reg	[37:0]	X_ADDER_REG, Y_ADDER_REG;

	wire	reset, valid_out;
	wire	load_sreg, load_zreg, shift_sreg;
	wire	do_w0, do_w1, do_w2, do_w3;
	wire	do_y0, do_y1;
	wire	do_f0;
	wire	do_acc;
	wire	done;
	wire	CEN, WEN;

	da_control	CONTROL(
			.reset		(reset),
			.valid_out	(valid_out),
			.load_sreg	(load_sreg),
			.load_zreg	(load_zreg),
			.shift_sreg	(shift_sreg),
			.do_w0		(do_w0),
			.do_w1		(do_w1),
			.do_w2		(do_w2),
			.do_w3		(do_w3),
			.do_y0		(do_y0),
			.do_y1		(do_y1),
			.do_f0		(do_f0),
			.do_acc		(do_acc),
			.done		(done),
			.CEN		(CEN),
			.WEN		(WEN),
			.resetn		(resetn),
			.start		(start),
			.clk		(clk),
			.CLOAD		(CLOAD),
			.valid_in	(valid_in)
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

	always	@(posedge clk) begin
		if (~resetn) begin
			Z7	<= 0;
			Z6	<= 0;
			Z5	<= 0;
			Z4	<= 0;
			Z3	<= 0;
			Z2	<= 0;
			Z1	<= 0;
			Z0	<= 0;
		end
		else begin
			if (load_zreg) begin
				Z7	<= Q7;
				Z6	<= Q6;
				Z5	<= Q5;
				Z4	<= Q4;
				Z3	<= Q3;
				Z2	<= Q2;
				Z1	<= Q1;
				Z0	<= Q0;
			end
		end
	end

	reg	[20:0]	W3, W2, W1, W0;

	always	@(posedge clk) begin
		if (~resetn) begin
			W3	<= 0;
			W2	<= 0;
			W1	<= 0;
			W0	<= 0;
		end
		else begin
			if (do_w0) begin
				X_ADDER_REG	<= {{18{Z0[19]}}, Z0};
				Y_ADDER_REG	<= {{18{Z1[19]}}, Z1};
			end
			else if (do_w1) begin
				X_ADDER_REG	<= {{18{Z2[19]}}, Z2};
				Y_ADDER_REG	<= {{18{Z3[19]}}, Z3};

			end
			else if (do_w2) begin
				X_ADDER_REG	<= {{18{Z4[19]}}, Z4};
				Y_ADDER_REG	<= {{18{Z5[19]}}, Z5};

			end
			else if (do_w3) begin
				X_ADDER_REG	<= {{18{Z6[19]}}, Z6};
				Y_ADDER_REG	<= {{18{Z7[19]}}, Z7};
			end
			else begin
			end
		end
	end

	reg	[21:0]	Y0, Y1;

	always	@(posedge clk) begin
		if (~resetn) begin
			Y0	<= 0;
			Y1	<= 0;
		end
		else begin
			if (do_y0) begin

			end
			else if (do_y1) begin

			end
		end
	end
endmodule /* da */

