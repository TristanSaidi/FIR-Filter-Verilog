
`timescale 1ns/1ps
`define OUTPUT_FN 		"./output"
`define HALF_CLK_PERIOD 	#10.000
`define QRTR_CLK_PERIOD		#5.000
`define ON 			1'b0
`define OFF 			1'b1
`define HIZ 			{20{1'bZ}}
`define ITER 			256
`define BLKS			8

module testbench();

	integer		i, writing, qsim_out;
	reg		clk, sclk, WEN, CEN;
	wire	[19:0]	Q7, Q6, Q5, Q4;
	wire	[19:0]	Q3, Q2, Q1, Q0;
	reg	[19:0]	D;
	reg	[10:0]	CADDR;
	reg	[7:0]	A7, A6, A5, A4;
	reg	[7:0]	A3, A2, A1, A0;

	sram_8blk	DUT(
				.Q7 (Q7), .Q6(Q6), .Q5(Q5), .Q4(Q4),
				.Q3 (Q3), .Q2(Q2), .Q1(Q1), .Q0(Q0),
				.A7 (A7), .A6 (A6), .A5 (A5), .A4 (A4),
				.A3 (A3), .A2 (A2), .A1 (A1), .A0 (A0),
				.D	(D),
				.CADDR	(CADDR),
				.clk	(clk),
				.sclk	(sclk),
				.WEN	(WEN),
				.CEN	(CEN)
	);

	always	begin
		`HALF_CLK_PERIOD
		clk	= ~clk;
		`QRTR_CLK_PERIOD
		sclk	= clk;
	end

	integer	CADDRI, DI, WENI, CENI;
	integer	AI7, AI6, AI5, AI4, AI3, AI2, AI1, AI0;

	always	@(negedge clk) begin
		`QRTR_CLK_PERIOD
		AI7	= A7; AI6=A6; AI5=A5; AI4=A4; AI3=A3; AI2=A2; AI1=A1; AI0=A0;
		DI	= D;
		WENI	= WEN;
		CADDRI	= CADDR;
		CENI	= CEN;
		CEN	= `ON;
		if (writing) begin
			D	<= (i % 256);
			WEN	<= `ON;
			CADDR	<= i;
			A7	<= {8{1'bZ}};
			A6	<= {8{1'bZ}};
			A5	<= {8{1'bZ}};
			A4	<= {8{1'bZ}};
			A3	<= {8{1'bZ}};
			A2	<= {8{1'bZ}};
			A1	<= {8{1'bZ}};
			A0	<= {8{1'bZ}};
		end
		else begin
			D	<= `HIZ;
			WEN	<= `OFF;
			CADDR	<= {10{1'bZ}};
			A7	<= i;
			A6	<= i;
			A5	<= i;
			A4	<= i;
			A3	<= i;
			A2	<= i;
			A1	<= i;
			A0	<= i;
		end
	end
	always	@(posedge clk) begin
		if (WENI==0) begin
			$fwrite(qsim_out, "WRITE|| CEN: %1b WEN: %1b\tCADDR: %8d\t DATA: %8d\n", CENI, WENI, CADDRI, DI);
			$fwrite(qsim_out, "A7: %8d\t A6: %8d\t A5: %8d\t A4: %8d\n", AI7, AI6, AI5, AI4);
			$fwrite(qsim_out, "A3: %8d\t A2: %8d\t A1: %8d\t A0: %8d\n", AI3, AI2, AI1, AI0);
			$fwrite(qsim_out, "Q7: %8d\t Q6: %8d\t Q5: %8d\t Q4: %8d\n", Q7, Q6, Q5, Q4);
			$fwrite(qsim_out, "Q3: %8d\t Q2: %8d\t Q1: %8d\t Q0: %8d\n\n", Q3, Q2, Q1, Q0);
		end
		else begin
			$fwrite(qsim_out_2, "READ|| CEN: %1b WEN: %1b\tCADDR: %8d\t DATA: %8d\n", CENI, WENI, CADDRI, DI);
			$fwrite(qsim_out_2, "A7: %8d\t A6: %8d\t A5: %8d\t A4: %8d\n", AI7, AI6, AI5, AI4);
			$fwrite(qsim_out_2, "A3: %8d\t A2: %8d\t A1: %8d\t A0: %8d\n", AI3, AI2, AI1, AI0);
			$fwrite(qsim_out_2, "Q7: %8d\t Q6: %8d\t Q5: %8d\t Q4: %8d\n", Q7, Q6, Q5, Q4);
			$fwrite(qsim_out_2, "Q3: %8d\t Q2: %8d\t Q1: %8d\t Q0: %8d\n\n", Q3, Q2, Q1, Q0);
		end
	end

	integer	qsim_out_2;
	initial	begin
		qsim_out	= $fopen("writes", "w");
		qsim_out_2	= $fopen("reads", "w");
		clk	= 0;
		sclk	= 0;
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
		$fclose(qsim_out);
		$fclose(qsim_out_2);
		$finish;
	end

endmodule /* testbench */

