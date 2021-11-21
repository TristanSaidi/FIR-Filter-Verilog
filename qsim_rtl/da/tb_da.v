
`timescale 1ns/1ps
`define OUTPUT_FN 		"./output"
`define HALF_CLK_PERIOD 	#10.000
`define QRTR_CLK_PERIOD		#5.000
`define TOTAL_ROM_SIZE		(256 * 8)
`define ITER			100

module testbench();

	integer	i, qsim_out, writing;
	wire	[37:0]	ACC;
	wire		done;
	reg	[7:0]	A7, A6, A5, A4;
	reg	[7:0]	A3, A2, A1, A0;
	reg	[19:0]	CIN;
	reg	[10:0]	CADDR;
	reg		CLOAD, valid_in;
	reg		start, clk, sclk, resetn;

	always begin
		`HALF_CLK_PERIOD
		clk	= ~clk;
		`QRTR_CLK_PERIOD
		sclk	= clk;
	end

	da	DUT(
			.ACC		(ACC),
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
			.valid_in	(valid_in),
			.start		(start),
			.clk		(clk),
			.sclk		(sclk),
			.resetn		(resetn)
	);

	integer	[255:0]	ROM [7:0];

	integer	CADDR_INT, CIN_INT;
	integer	ROM_INDEX;
	integer ADDRESS_INDEX;
	integer A7_INT, A6_INT, A5_INT, A4_INT;
	integer A3_INT, A2_INT, A1_INT, A0_INT;
	integer	ACC_INT;

	/* Control Signals Arrive Just before the posedge to ensure latched. */
	always	@(negedge clk) begin
		A7_INT	= A7;
		A6_INT	= A6;
		A5_INT	= A5;
		A4_INT	= A4;
		A3_INT	= A3;
		A2_INT	= A2;
		A1_INT	= A1;
		A0_INT	= A0;
		`QRTR_CLK_PERIOD
		if (writing) begin
			CADDR				<= i;
			CADDR_INT			= CADDR;
			ROM_INDEX			= CADDR[10:8];
			ADDRESS_INDEX			= CADDR[7:0];
			CIN				<= i;
			CIN_INT				= CIN;
			ROM[ROM_INDEX][ADDRESS_INDEX]	= CIN_INT;
			valid_in			<= 1'b1;
			CLOAD				<= 1'b1;
		end
		else begin
			CADDR				<= {11{1'bZ}};
			CIN				<= {20{1'bZ}};
			CLOAD				<= 1'b0;
			valid_in			<= 1'b0;
			A7				<= i; // $urandom%2048;
			A6				<= i; // $urandom%2048;
			A5				<= i; // $urandom%2048;
			A4				<= i; // $urandom%2048;
			A3				<= i; // $urandom%2048;
			A2				<= i; // $urandom%2048;
			A1				<= i; // $urandom%2048;
			A0				<= i; // $urandom%2048;
		end
	end

	/* This Block is Just for Writing Outputs to File */
	always	@(posedge clk) begin
		if (writing) begin
			$fwrite(qsim_out,
				"LOADING|| ROM[%1d] ADDRESS[%4d] VALUE[%6d]\n",
				ROM_INDEX, ADDRESS_INDEX, CIN_INT);
		end
		else begin
			$fwrite(qsim_out, "\nCOMPUTE||\n");
			$fwrite(qsim_out, "\tA7[%3d] = %6d\n", A7_INT, ROM[7][A7_INT]);
			$fwrite(qsim_out, "\tA6[%3d] = %6d\n", A6_INT, ROM[6][A6_INT]);
			$fwrite(qsim_out, "\tA5[%3d] = %6d\n", A5_INT, ROM[5][A5_INT]);
			$fwrite(qsim_out, "\tA4[%3d] = %6d\n", A4_INT, ROM[4][A4_INT]);
			$fwrite(qsim_out, "\tA3[%3d] = %6d\n", A3_INT, ROM[3][A3_INT]);
			$fwrite(qsim_out, "\tA2[%3d] = %6d\n", A2_INT, ROM[2][A2_INT]);
			$fwrite(qsim_out, "\tA1[%3d] = %6d\n", A1_INT, ROM[1][A1_INT]);
			$fwrite(qsim_out, "\tA0[%3d] = %6d\n", A0_INT, ROM[0][A0_INT]);
			$fwrite(qsim_out, "\tACC\t= %12d", ACC_INT);
		end
	end

	initial	begin
		clk		= 0;
		sclk		= 0;
		@(posedge clk);
		resetn		= 0;
		start		= 0;
		CLOAD		= 0;
		valid_in	= 0;
		@(posedge clk);
		resetn	= 1;
		writing	= 1;
		/* LOAD PRE-COMPUTED-VALUES LOOP */
		for (i = 0; i < `TOTAL_ROM_SIZE; i = i + 1) begin
			@(posedge clk);
		end
		writing	= 0;
		@(negedge clk);
		start	= 1;
		/* COMPUTE LOOP */
		for (i = 0; i < `ITER; i = i + 1) begin
			@(posedge clk);
		end
		@(posedge clk);
		$fclose(qsim_out);
		$finish;
	end

endmodule /* testbench */

