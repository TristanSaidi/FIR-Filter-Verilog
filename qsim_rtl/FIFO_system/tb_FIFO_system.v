
`timescale 1ns/1ps
`define SD #0.010
`define HALF_CLOCK_PERIOD #5
`define SLOW_HALF_CLOCK_PERIOD #80
`define QSIM_OUT_FN_1	"./reports/output.txt"
`define MATLAB_0	"./reports/outputA0.txt"
`define MATLAB_1	"./reports/outputA1.txt"
`define MATLAB_2	"./reports/outputA2.txt"
`define MATLAB_3	"./reports/outputA3.txt"
`define MATLAB_4	"./reports/outputA4.txt"
`define MATLAB_5	"./reports/outputA5.txt"
`define MATLAB_6	"./reports/outputA6.txt"
`define MATLAB_7	"./reports/outputA7.txt"
module testbench();
	reg 		clk1;
	reg 		clk2;
	reg [15:0]	w;
	reg 		resetn;
	reg 		enable;
	wire	[7:0]	A7,A6,A5,A4,A3,A2,A1,A0;
	integer 	i;
	integer		qsim_out_1;
	integer		a0,a1,a2,a3,a4,a5,a6,a7;
	reg		[15:0]val0,val1,val2,val3,val4,val5,val6,val7;
	integer 	error_count;

	FIFO_system FIFO_system(
			.resetn	(resetn),
			.enable	(enable),
			.clk	(clk1),
			.clk2	(clk2),
			.w	(w),
			.A7	(A7),
			.A6	(A6),
			.A5	(A5),
			.A4	(A4),
			.A3	(A3),
			.A2	(A2),
			.A1	(A1),
			.A0	(A0)
	);

	
	always begin
		`HALF_CLOCK_PERIOD;
		clk2 =~clk2;
	end
	
	always begin
		`SLOW_HALF_CLOCK_PERIOD;
		clk1 = ~clk1;
	end

	initial begin
		qsim_out_1 = $fopen(`QSIM_OUT_FN_1,"w");
		a0 = $fopen(`MATLAB_0,"w");
		a1 = $fopen(`MATLAB_1,"w");
		a2 = $fopen(`MATLAB_2,"w");
		a3 = $fopen(`MATLAB_3,"w");
		a4 = $fopen(`MATLAB_4,"w");
		a5 = $fopen(`MATLAB_5,"w");
		a6 = $fopen(`MATLAB_6,"w");
		a7 = $fopen(`MATLAB_7,"w");
		error_count = 0;
		clk1	= 0;
		clk2	= 0;
		enable	= 0;
		resetn	= 0;
		@(posedge clk1);
		resetn	= 1;
		w	= 0;
		enable	= 1;
		for (i = 0; i < 128*16; i = i+1) begin
			@(posedge clk2);
			if (i%16 == 0) begin
				w <= $urandom%256;
				$fwrite(qsim_out_1, "%d\n", w);
			end
			@(negedge clk2);
			$fwrite(a0,"%d\n",A0);
			$fwrite(a1,"%d\n",A1);
			$fwrite(a2,"%d\n",A2);
			$fwrite(a3,"%d\n",A3);
			$fwrite(a4,"%d\n",A4);
			$fwrite(a5,"%d\n",A5);
			$fwrite(a6,"%d\n",A6);
			$fwrite(a7,"%d\n",A7);
			
		end
		@(negedge clk1);
		resetn <= 0;
		@(posedge clk1);
		resetn <= 1;
		for (i = 0; i < 64; i = i+1) begin
			

			@(negedge clk1);
			
			w <= $urandom%65535;
			
			@(posedge clk1);


		end
		@(negedge clk1);

		@(posedge clk1);

		$fclose(qsim_out_1);
		$fclose(a0);
		$fclose(a1);
		$fclose(a3);
		$fclose(a3);
		$fclose(a4);
		$fclose(a5);
		$fclose(a6);
		$fclose(a7);

		$finish;
	
	end

endmodule	

							
