
`timescale 1ns/1ps
`define QSIM_IN_FN_1 		"./reports/golden_block.rpt"
`define QSIM_OUT_FN_1		"./reports/coefficients.rpt"
`define QSIM_OUT_FN_2		"./reports/inputs.rpt"
`define QSIM_OUT_FN_3		"./reports/outputs.rpt"
`define HALF_FAST_CLK_CYCLE	#260.00
`define HALF_SLOW_CLK_CYCLE	#49920.00
`define FAST_SLOW_CLK_RATIO	192
`define QRTR_FAST_CLK_CYCLE	#130.00
`define QRTR_SLOW_CLK_CYCLE	#24960.00
`define ITER 			10000
`define PRECOMP			2048

module testbench();

	integer	qsim_out_1, qsim_out_2,qsim_out_3;
	integer	i;
	integer	writing;


	wire	signed		[15:0]		Y;

	wire			valid_out;
	reg	signed		[15:0]		X;
	reg	[18:0]		CIN;
	reg	unsigned	[10:0]		CADDR;
	reg			CLOAD;
	reg			valid_in;
	reg			clk_slow, clk_fast;
	reg			resetn;
	integer 		COEF_ARRAY		[63:0];
	integer 		COMP_ARRAY		[2047:0];
	integer 		COUNT_REG;
	integer	CIN_INT;
	integer	X_INT;
	integer	Y_INT;
	integer k;
	integer CURRENT;
	fir_filter	DUT(
		.dout		(Y),
		.valid_out	(valid_out),
		.din		(X),
		.CIN		(CIN),
		.CADDR		(CADDR),
		.CLOAD		(CLOAD),
		.valid_in	(valid_in),
		.clk_fast	(clk_fast),
		.clk_slow	(clk_slow),
		.resetn		(resetn)
	);

	always begin
		`HALF_FAST_CLK_CYCLE
		clk_fast	= ~clk_fast;
	end
	always begin
		`HALF_SLOW_CLK_CYCLE;
		clk_slow	= ~clk_slow;
	end

	integer	j;
	always	@(posedge clk_fast) begin
		j = j + 1;
	end
	always	@(negedge clk_fast) begin
		`QRTR_FAST_CLK_CYCLE;
		if (((j + 96) % `FAST_SLOW_CLK_RATIO) == 0) begin
			if (writing == 1) begin
				CIN_INT		= COMP_ARRAY[i];
				CIN		= CIN_INT;
				CADDR		= i;

			end
			else if (writing == 0) begin
				Y_INT 		= Y;

				$fwrite(qsim_out_3, "%d\n",Y);

				if (i == 0) begin
					X = 0;
				end
				else begin
					X		= ($urandom%65536)-32768;
					X_INT		= X;
					$fwrite(qsim_out_2, "%0d\n", X_INT);
				end
			end
		end
	end

	initial begin
		$sdf_annotate("../../syn/fir_filter/fir_filter.syn.sdf", DUT, , , "maximum");
		$dumpfile("fir_filter.vcd");
		$dumpvars(0, DUT);
		writing		= 3;
		qsim_out_1	= $fopen(`QSIM_OUT_FN_1, "w");
		qsim_out_2	= $fopen(`QSIM_OUT_FN_2, "w");
		qsim_out_3	= $fopen(`QSIM_OUT_FN_3, "w");
		clk_slow	= 0;
		clk_fast	= 0;
		resetn 		= 0;
		valid_in	= 0;
		for (k = 0; k < 2048; k = k+1) begin
			COMP_ARRAY[k] = 0;		
		end
		for (k = 0; k < 64; k = k+1) begin
			COEF_ARRAY[k] = ($urandom%65536)-32768;
			$fwrite(qsim_out_1, "%d\n", COEF_ARRAY[k]);		
		end
		for (k = 0; k < 8; k = k+1) begin
			for (COUNT_REG = 0; COUNT_REG < 256; COUNT_REG = COUNT_REG+1) begin
				CURRENT = COUNT_REG>>1 & 8'b00000001;
				if((COUNT_REG & 8'b00000001) == 1)begin
					COMP_ARRAY[k*256+COUNT_REG] = COMP_ARRAY[k*256+COUNT_REG] + COEF_ARRAY[k*8];
				end
				if((COUNT_REG>>1)&(8'b00000001) == 1)begin
					COMP_ARRAY[k*256+COUNT_REG] = COMP_ARRAY[k*256+COUNT_REG] + COEF_ARRAY[k*8+1];
				end
				if((COUNT_REG>>2)&(8'b00000001) == 1)begin
					COMP_ARRAY[k*256+COUNT_REG] = COMP_ARRAY[k*256+COUNT_REG] + COEF_ARRAY[k*8+2];
				end
				if((COUNT_REG>>3)&(8'b00000001) == 1)begin
					COMP_ARRAY[k*256+COUNT_REG] = COMP_ARRAY[k*256+COUNT_REG] + COEF_ARRAY[k*8+3];
				end
				if((COUNT_REG>>4)&(8'b00000001) == 1)begin
					COMP_ARRAY[k*256+COUNT_REG] = COMP_ARRAY[k*256+COUNT_REG] + COEF_ARRAY[k*8+4];
				end
				if((COUNT_REG>>5)&(8'b00000001) == 1)begin
					COMP_ARRAY[k*256+COUNT_REG] = COMP_ARRAY[k*256+COUNT_REG] + COEF_ARRAY[k*8+5];
				end
				if((COUNT_REG>>6)&(8'b00000001) == 1)begin
					COMP_ARRAY[k*256+COUNT_REG] = COMP_ARRAY[k*256+COUNT_REG] + COEF_ARRAY[k*8+6];
				end
				if((COUNT_REG>>7)&(8'b00000001) == 1)begin
					COMP_ARRAY[k*256+COUNT_REG] = COMP_ARRAY[k*256+COUNT_REG] + COEF_ARRAY[k*8+7];
				end

			end
		end
		@(posedge clk_slow);
		clk_fast	= 1;
		@(negedge clk_slow);
		resetn 		= 1;
		@(posedge clk_slow);
		CLOAD		= 1;
		writing		= 1;
		j		= 0;
		for (i = 0; i < `PRECOMP; i = i + 1) begin
			@(posedge clk_slow);
		end
		@(negedge clk_slow);
		CLOAD		= 0;
		@(posedge clk_slow);
		valid_in 	= 1;
		resetn		= 1;
		writing		= 0;
		for (i = 0; i < `ITER; i = i + 1) begin
			@(posedge clk_slow);
		end
		$fclose(qsim_out_1);
		$fclose(qsim_out_2);
		$fclose(qsim_out_3);
		$dumpall;
		$dumpflush;
		$finish;
	end

endmodule /* testbench */

