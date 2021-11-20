
`timescale 1ns/1ps
`define OUTPUT_FN 	"./output"
`define HALF_CLK_PERIOD #10.000
`define QRTR_CLK_PERIOD	#5.000
`define ON 1'b0
`define OFF 1'b1
`define HIZ {20{1'bZ}}
`define ITER 600

module testbench();

	integer		i, writing, qsim_out;
	reg		clk, sclk, WEN;
	wire	[19:0]	Q;
	reg	[19:0]	D;
	reg	[10:0]	A;

	sram_8blk	DUT(
				.Q	(Q),
				.D	(D),
				.A	(A),
				.clk	(clk),
				.sclk	(sclk),
				.WEN	(WEN),
				.CEN	(`ON)
	);

	always	begin
		`HALF_CLK_PERIOD
		clk	= ~clk;
		`QRTR_CLK_PERIOD
		sclk	= clk;
	end

	integer	AI, DI, WENI;

	always	@(negedge clk) begin
		AI	= A;
		DI	= D;
		WENI	= WENI;
		if (writing) begin
			D	<= i;
			WEN	<= `ON;
		end
		else begin
			D	<= `HIZ;
			WEN	<= `OFF;
		end
		A <= i;
	end
	always	@(posedge clk) begin
		if (writing) begin
			$fwrite(qsim_out, "WRITE|| WEN: %1b\tADDRESS: %8d\tDATA: %8d\tQ: %8d\n", WENI, AI, DI, Q);
		end
		else begin
			$fwrite(qsim_out, "READ|| WEN: %1b\tADDRESS: %8d\tDATA: %8d\tQ: %8d\n", WENI, AI, DI, Q);
		end
	end

	initial	begin
		$sdf_annotate("../../dc/sram/reports/tt/sram_8blk.syn.sdf", DUT, , , "maximum");
		$dumpfile("sram.vcd");
		$dumpvars(0, DUT);
		qsim_out	= $fopen(`OUTPUT_FN, "w");
		clk	= 0;
		sclk	= 0;
		writing = 1;
		@(posedge clk);
		for (i = 0; i < `ITER; i = i + 1) begin
			@(posedge clk);
		end
		writing	= 0;
		for (i = 0; i < `ITER; i = i + 1) begin
			@(posedge clk);
		end
		@(posedge clk);
		$fclose(qsim_out);
		$dumpall;
		$dumpflush;
		$finish;
	end

endmodule /* testbench */

