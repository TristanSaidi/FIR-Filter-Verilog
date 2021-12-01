
`timescale 1ns/1ps
`define QSIM_OUT_FN_1 		"./reports/inputs.rpt"
`define QSIM_OUT_FN_2 		"./reports/outputs.rpt"
`define HALF_CLK_PERIOD 	#10.000
`define QRTR_CLK_PERIOD		#5.000
`define ON 			1'b0
`define OFF 			1'b1
`define HIZ 			{20{1'bZ}}
`define ITER 			256

module testbench();

	integer				i, writing;
	integer				qsim_out_1, qsim_out_2;
	reg				clk, WEN, CEN;
	reg			[19:0]	D;
	reg	unsigned	[10:0]	CADDR;
	reg	unsigned	[7:0]	A7, A6, A5, A4;
	reg	unsigned	[7:0]	A3, A2, A1, A0;

	sram	DUT(
	);

	always	begin
		`HALF_CLK_PERIOD
		clk	= ~clk;
	end

	integer	ROM_INDEX, ADDRESS_INDEX, D_INT;
	integer	rom7, rom6, rom5, rom4, rom3, rom2, rom1, rom0;

	always	@(negedge clk) begin
		`QRTR_CLK_PERIOD
		if (writing == 1) begin
			CEN		= `ON;
			WEN		= `ON;
			CADDR		= i;
			CADDR_INT	= CADDR;
			ROM_INDEX	= CADDR[10:8];
			ADDRESS_INDEX	= CADDR[7:0];
			D		= $urandom%1048576;
			case(ROM_INDEX)
                        	0: begin
					$fwrite(rom0, "%d\n", D);
				end
				1: begin
					$fwrite(rom1, "%d\n", D);
				end
				2: begin
					$fwrite(rom2, "%d\n", D);
				end
				3: begin
					$fwrite(rom3, "%d\n", D);
				end
				4: begin
					$fwrite(rom4, "%d\n", D);
				end
				5: begin
					$fwrite(rom5, "%d\n", D);
				end
				6: begin
					$fwrite(rom6, "%d\n", D);
				end
				7: begin
					$fwrite(rom7, "%d\n", D);
				end
			endcase
		end
		else if (writing == 0) begin
			WEN	= `OFF;
			CEN	= `ON;
			D	= `HIZ;
			CADDR	= {11{1'bZ}};
			A7	= $urandom%2048;
			A6	= $urandom%2048;
			A5	= $urandom%2048;
			A4	= $urandom%2048;
			A3	= $urandom%2048;
			A2	= $urandom%2048;
			A1	= $urandom%2048;
			A0	= $urandom%2048;
			$fwrite(qsim_out_1, "%d,%d,%d,%d,%d,%d,%d,%d\n",
				A7, A6, A5, A4, A3, A2, A1, A0);
		end
		else begin
		end
	end

	always	@(posedge clk) begin
		if (writing == 0) begin
			$fwrite(qsim_out_2, "%d,%d,%d,%d,%d,%d,%d,%d\n",
				Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0);
		end
	end

	initial	begin
		qsim_out_1	= $fopen(`QSIM_OUT_FN_1, "w");
		qsim_out_2	= $fopen(`QSIM_OUT_FN_2, "w");
		rom7		= $fopen("./rom/rom7", "w");
		rom6		= $fopen("./rom/rom6", "w");
		rom5		= $fopen("./rom/rom5", "w");
		rom4		= $fopen("./rom/rom4", "w");
		rom3		= $fopen("./rom/rom3", "w");
		rom2		= $fopen("./rom/rom2", "w");
		rom1		= $fopen("./rom/rom1", "w");
		rom0		= $fopen("./rom/rom0", "w");
		clk	= 0;
		writing = 1;
		@(posedge clk);
		for (i = 0; i < (`BLKS * `ITER); i = i + 1) begin
			@(posedge clk);
		end
		writing	= 0;
		@(posedge clk);
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

