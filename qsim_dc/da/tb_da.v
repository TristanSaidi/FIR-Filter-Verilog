
`timescale 1ns/1ps
`define QSIM_OUT_FN_1		"./data.rpt"
`define QSIM_OUT_FN_2		"./control.rpt"
`define HALF_CLK_PERIOD 	#10.000
`define QRTR_CLK_PERIOD		#5.000
`define TOTAL_ROM_SIZE		(256 * 8)
`define ITER			100

module testbench();

	integer			i, writing;
	integer			qsim_out_1, qsim_out_2;
	integer			qsim_out_3, qsim_out_4;

	wire signed	[37:0]	ACC;
	wire			done;
	reg unsigned	[7:0]	A7, A6, A5, A4;
	reg unsigned	[7:0]	A3, A2, A1, A0;
	reg signed	[19:0]	CIN;
	reg unsigned	[10:0]	CADDR;
	reg			CLOAD, valid_in;
	reg			start, clk, sclk, resetn;

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

	integer ROM0[255:0];
	integer ROM1[255:0];
	integer ROM2[255:0];
	integer ROM3[255:0];
	integer ROM4[255:0];
	integer ROM5[255:0];
	integer ROM6[255:0];
	integer ROM7[255:0];
	
	
	
	

	integer	CADDR_INT, CIN_INT;
	integer	ROM_INDEX;
	integer ADDRESS_INDEX;
	integer A7_INT, A6_INT, A5_INT, A4_INT;
	integer A3_INT, A2_INT, A1_INT, A0_INT;
	integer	ACC_INT;

	always	@(negedge clk) begin
		A7_INT	= A7;
		A6_INT	= A6;
		A5_INT	= A5;
		A4_INT	= A4;
		A3_INT	= A3;
		A2_INT	= A2;
		A1_INT	= A1;
		A0_INT	= A0;
		if (writing==1) begin
			$fwrite(qsim_out_2, "LOADING|| CLOAD: %1b\t ", CLOAD);
			$fwrite(qsim_out_2, "VALID_IN: %1b\t START: %1b\t ", valid_in, start);
			$fwrite(qsim_out_2, "RESETN: %1b\t DONE: %1b\n", resetn, done);
		end
		else if (writing==0) begin
			$fwrite(qsim_out_2, "COMPUTE|| CLOAD: %1b\t ", CLOAD);
			$fwrite(qsim_out_2, "VALID_IN: %1b\t START: %1b\t ", valid_in, start);
			$fwrite(qsim_out_2, "RESETN: %1b\t DONE: %1b\n", resetn, done);
		end
		`QRTR_CLK_PERIOD
		if (writing==1) begin
			CADDR				<= i;
			CADDR_INT			= CADDR;
			ROM_INDEX			= CADDR[10:8];
			ADDRESS_INDEX			= CADDR[7:0];
			CIN				<= (i % 256);
			CIN_INT				= CIN;
			case(ROM_INDEX)
                        	0: ROM0[ADDRESS_INDEX] = CIN_INT;                   
				1: ROM1[ADDRESS_INDEX] = CIN_INT;
				2: ROM2[ADDRESS_INDEX] = CIN_INT;
				3: ROM3[ADDRESS_INDEX] = CIN_INT;				
				4: ROM4[ADDRESS_INDEX] = CIN_INT;
				5: ROM5[ADDRESS_INDEX] = CIN_INT;
				6: ROM6[ADDRESS_INDEX] = CIN_INT;
				7: ROM7[ADDRESS_INDEX] = CIN_INT;
			endcase
			valid_in			<= 1'b1;
			CLOAD				<= 1'b1;
				
				
		end
		else if (writing==0) begin
			CADDR				<= 11'b0;
			CIN				<= 20'b0;
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
		if (writing==1) begin
			$fwrite(qsim_out_1,
				"LOADING|| ROM[%1d] ADDRESS[%4d] VALUE[%6d]\n",
				ROM_INDEX, ADDRESS_INDEX, CIN_INT);
		end
		else if (writing == 0) begin
			$fwrite(qsim_out_1, "\nCOMPUTE||\n");
			$fwrite(qsim_out_1, "\tA7[%3d] = %6d\n", A7_INT, ROM7[A7_INT]);
			$fwrite(qsim_out_1, "\tA6[%3d] = %6d\n", A6_INT, ROM6[A6_INT]);
			$fwrite(qsim_out_1, "\tA5[%3d] = %6d\n", A5_INT, ROM5[A5_INT]);
			$fwrite(qsim_out_1, "\tA4[%3d] = %6d\n", A4_INT, ROM4[A4_INT]);
			$fwrite(qsim_out_1, "\tA3[%3d] = %6d\n", A3_INT, ROM3[A3_INT]);
			$fwrite(qsim_out_1, "\tA2[%3d] = %6d\n", A2_INT, ROM2[A2_INT]);
			$fwrite(qsim_out_1, "\tA1[%3d] = %6d\n", A1_INT, ROM1[A1_INT]);
			$fwrite(qsim_out_1, "\tA0[%3d] = %6d\n", A0_INT, ROM0[A0_INT]);
			$fwrite(qsim_out_1, "\tACC\t= %12d", ACC_INT);
		end
	end

	initial	begin
		$sdf_annotate("../../dc/da/reports/tt/da.syn.sdf", DUT, , , "maximum");
		$dumpfile("da.vcd");
		$dumpvars(0, DUT);
		writing		= 3;
		qsim_out_1	= $fopen(`QSIM_OUT_FN_1, "w"); /* Data Outputs */
		qsim_out_2	= $fopen(`QSIM_OUT_FN_2, "w"); /* TB Control Signals */
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
		@(negedge clk);
		writing	= 0;
		start	= 1;
		/* COMPUTE LOOP */
		for (i = 0; i < `ITER; i = i + 1) begin
			@(posedge clk);
		end
		@(posedge clk);
		$fclose(qsim_out_1);
		$fclose(qsim_out_2);
		$dumpall;
		$dumpflush;
		$finish;
	end

endmodule /* testbench */

