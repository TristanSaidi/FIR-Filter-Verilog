
`timescale 1ns/1ps
`define QSIM_OUT_FN_1		"./reports/output.rpt"
`define QSIM_OUT_FN_2		"./reports/control.rpt"
`define HALF_CLK_PERIOD 	#10.000
`define QRTR_CLK_PERIOD		#5.000
`define TOTAL_ROM_SIZE		(256 * 8)
`define ITER			500
`define ON			1'b0
`define OFF			1'b1

module testbench();

	integer			i, writing;
	integer			qsim_out_1, qsim_out_2;
	integer			qsim_out_3, qsim_out_4;
	integer			rom0, rom1, rom2, rom3;
	integer			rom4, rom5, rom6, rom7;
	integer			cycle, iteration;

	wire signed	[38:0]	ACC_OUT;
	wire			valid_out;
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
			.ACC_OUT		(ACC_OUT),
			.valid_out	(valid_out),
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
	integer	ACC_OUT_INT;

	always	@(posedge clk) begin
		A7_INT	= A7;
		A6_INT	= A6;
		A5_INT	= A5;
		A4_INT	= A4;
		A3_INT	= A3;
		A2_INT	= A2;
		A1_INT	= A1;
		A0_INT	= A0;
		`QRTR_CLK_PERIOD
		if (writing==1) begin
			CADDR				= i;
			CADDR_INT			= CADDR;
			ROM_INDEX			= CADDR[10:8];
			ADDRESS_INDEX			= CADDR[7:0];
			CIN				= $urandom%20-10;
			CIN_INT				= CIN;
			case(ROM_INDEX)
                        	0: begin
					ROM0[ADDRESS_INDEX] = CIN_INT;
					$fwrite(rom0, "%d\n", CIN_INT);
				end
				1: begin
					ROM1[ADDRESS_INDEX] = CIN_INT;
					$fwrite(rom1, "%d\n", CIN_INT);
				end
				2: begin
					ROM2[ADDRESS_INDEX] = CIN_INT;
					$fwrite(rom2, "%d\n", CIN_INT);
				end
				3: begin
					ROM3[ADDRESS_INDEX] = CIN_INT;
					$fwrite(rom3, "%d\n", CIN_INT);
				end
				4: begin
					ROM4[ADDRESS_INDEX] = CIN_INT;
					$fwrite(rom4, "%d\n", CIN_INT);
				end
				5: begin
					ROM5[ADDRESS_INDEX] = CIN_INT;
					$fwrite(rom5, "%d\n", CIN_INT);
				end
				6: begin
					ROM6[ADDRESS_INDEX] = CIN_INT;
					$fwrite(rom6, "%d\n", CIN_INT);
				end
				7: begin
					ROM7[ADDRESS_INDEX] = CIN_INT;
					$fwrite(rom7, "%d\n", CIN_INT);
				end
			endcase
			valid_in			<= 1'b1;
			CLOAD				<= 1'b1;
		end
		else if (writing==0) begin
			if ((cycle == 0) && (iteration == 0)) begin
				resetn	= `ON;
				start	= 0;
			end
			else if (cycle == 2) begin
				start	= 1;
				resetn	= `OFF;
			end
			else begin
				resetn	= `OFF;
			end
			if (cycle == 15) begin
				if (iteration == 15) begin
					iteration	= 0;
					$fwrite(qsim_out_1, "%d\n", ACC_OUT);
				end
				else begin
					iteration	= iteration + 1;
				end
			end
			CADDR				= 11'b0;
			CIN				= 20'b0;
			CLOAD				= 1'b0;
			valid_in			= 1'b0;
			A7				= i; // $urandom%2048;
			A6				= i; // $urandom%2048;
			A5				= i; // $urandom%2048;
			A4				= i; // $urandom%2048;
			A3				= i; // $urandom%2048;
			A2				= i; // $urandom%2048;
			A1				= i; // $urandom%2048;
			A0				= i; // $urandom%2048;
			if (cycle == 15) begin
				cycle	= 0;
			end
			else begin
				cycle	= cycle + 1;
			end
		end
	end

	initial	begin
		qsim_out_1	= $fopen(`QSIM_OUT_FN_1, "w");
		qsim_out_2	= $fopen(`QSIM_OUT_FN_2, "w");
		writing		= 3;
		cycle		= 0;
		iteration	= 0;
		rom7		= $fopen("./rom/rom7", "w");
		rom6		= $fopen("./rom/rom6", "w");
		rom5		= $fopen("./rom/rom5", "w");
		rom4		= $fopen("./rom/rom4", "w");
		rom3		= $fopen("./rom/rom3", "w");
		rom2		= $fopen("./rom/rom2", "w");
		rom1		= $fopen("./rom/rom1", "w");
		rom0		= $fopen("./rom/rom0", "w");
		clk		= 0;
		sclk		= 0;
		@(posedge clk);
		resetn		= `ON;
		start		= 0;
		CLOAD		= 0;
		valid_in	= 0;
		@(posedge clk);
		resetn		= `OFF;
		writing		= 1;
		/* LOAD PRE-COMPUTED-VALUES LOOP */
		for (i = 0; i < `TOTAL_ROM_SIZE; i = i + 1) begin
			@(posedge clk);
		end
		writing	= 0;
		/* COMPUTE LOOP */
		for (i = 0; i < `ITER; i = i + 1) begin
			@(posedge clk);
		end
		@(posedge clk);
		$fclose(qsim_out_1);
		$fclose(qsim_out_2);
		$fclose(rom7);
		$fclose(rom6);
		$fclose(rom5);
		$fclose(rom4);
		$fclose(rom3);
		$fclose(rom2);
		$fclose(rom1);
		$fclose(rom0);
		$finish;
	end

endmodule /* testbench */

