
`timescale 1ns/1ps
`define OUTPUT_FN "./output"
`define HALF_CLK_PERIOD #2.125

module testbench();

	integer		i, writing, qsim_out;
	reg		clk, WEN;
	wire	[15:0]	Q;
	reg	[15:0]	D;
	reg	[12:0]	A;

	sram_16blk	DUT(
				.Q	(Q),
				.D	(D),
				.A	(A),
				.clk	(clk),
				.WEN	(WEN)
	);

	always	begin
		`HALF_CLK_PERIOD
		clk	= ~clk;
	end

	integer	DI, AI, WENI;

	always	@(posedge clk) begin
		DI	= D;
		AI	= A;
		WENI	= WEN;
		if (writing) begin
			D	<= i;
			WEN	<= 0;
		end
		else begin
			D	<= {16{1'bZ}};
			WEN	<= 1;
		end
		A <= i;
		#1.5;
		if (writing) begin
			$fwrite(qsim_out, "WRITE|| WEN: %1b\tADDRESS: %8d\tDATA: %8d\tQ: %8d\n", WENI, AI, DI, Q);
		end
		else begin
			$fwrite(qsim_out, "READ|| WEN: %1b\tADDRESS: %8d\tDATA: %8d\tQ: %8d\n", WENI, AI, DI, Q);
		end
	end

	initial	begin
		qsim_out	= $fopen(`OUTPUT_FN, "w");
		clk	= 0;
		writing = 1;
		@(posedge clk);
		for (i = 0; i < 8192; i = i + 1) begin
			@(posedge clk);
		end
		writing	= 0;
		for (i = 0; i < 8192; i = i + 1) begin
			@(posedge clk);
		end
		@(posedge clk);
		$fclose(qsim_out);
		$finish;
	end

endmodule /* testbench */

