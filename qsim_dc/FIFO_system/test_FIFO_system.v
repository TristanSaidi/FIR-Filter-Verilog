`timescale 1ns/1ps
`define SD #0.010
`define HALF_CLOCK_PERIOD #5000
`define SLOW_HALF_CLOCK_PERIOD #80000


module testbench();
	reg clk1;
	reg clk2;
	reg [15:0]w;
	reg resetn;
	reg enable;
	reg enable_single;
	wire load_ext;
	wire start_ext;
	wire	[7:0]	A7,A6,A5,A4,A3,A2,A1,A0;
	integer i;
	

	FIFO_system FIFO_system(.load_ext(load_ext), .start_ext(start_ext),.resetn(resetn),.enable(enable),.enable_single(enable_single),.clk(clk1),.clk2(clk2),.w(w),.A7(A7),.A6(A6),.A5(A5),.A4(A4),.A3(A3),.A2(A2),.A1(A1),.A0(A0));

	
	always begin
		`HALF_CLOCK_PERIOD;
		clk2 =~clk2;
	end
	
	always begin
		`SLOW_HALF_CLOCK_PERIOD;
		clk1 = ~clk1;
	end
	initial begin
		$dumpfile("./FIFO_system.vcd");
		$dumpvars(0, FIFO_system);
		clk1 <= 0;
		clk2 <= 1;
		enable <= 0;
		enable_single <= 0;
		resetn <= 0;
		
		@(negedge clk1)
		@(posedge clk1)			
		resetn <= 1;
		w <= 0;	
		enable <= 1;		
		enable_single <= 1;


		for (i = 0; i < 16*128; i = i+1) begin
			

			@(posedge clk2);
			if (i%15 == 0) begin
				w <= $urandom%256;
			end
			@(negedge clk2);


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

		$dumpall;
		$dumpflush;
		$finish;
		$finish;
	
	end

endmodule	

							
