`timescale 1ns/1ps
`define SD #0.010
`define HALF_CLOCK_PERIOD #5


module testbench();
	reg	[37:0]	acc,
	wire		done,
	wire	[7:0]	A
7, A6, A5, A4,
	wire	[7:0]	A3, A2, A1, A0,
	wire	[19:0]	CIN,
	wire	[10:0]	CADDR,
	wire		CLOAD, valid_in,
	wire		start, clk, sclk, resetn
	

	da da(.acc(acc), .done(done), .A7(A7), .A6(A6), .A5(A5), .A4(A4), .A3(A3), .A2(A2), .A1(A1), .A0(A0),.CIN(CIN),.CADDR(.CADDR), .CLOAD(.CLOAD), .valid_in(valid_in), .start(start), .clk(clk), .sclk(sclk), .resetn(resetn));
	
	integer [255:0]ROM[7:0];


		
	always begin
		`HALF_CLOCK_PERIOD;
		clk =~clk;
		sclk = ~sclk;
	end
	
	initial begin
		clk <= 0;
		sclk <= 0;
		
		@(posedge clk);

		@(negedge clk);		

		@(posedge clk);

		for (i = 0; i < 1000; i = i+1) begin
			X <= $urandom%100-50;
			B <= $urandom%100-50;

			@(negedge clk);

			
			@(posedge clk);


		end


		$finish;
	
	end

endmodule	

							

