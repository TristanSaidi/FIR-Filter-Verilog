
`timescale 1ns/1ps

`define HALF_CLK_PERIOD 	#10.000
`define QRTR_CLK_PERIOD		#5.000
`define TOTAL_ROM_SIZE		(256 * 8)
`define ITER			100
`define ON			1'b0
`define OFF			1'b1

module testbench();

	integer		calculated;
	integer		iteration;
	integer		ROM_INDEX;
	integer		i, writing;
	integer		CADDR_INT, CIN_INT;
	integer 	ADDRESS_INDEX;
	wire	[38:0]	ACC_OUT;
	reg	[7:0]	A7, A6, A5, A4;
	reg	[7:0]	A3, A2, A1, A0;
	reg	[19:0]	CIN;
	reg	[10:0]	CADDR;
	reg		WEN, valid_in;
	reg		clk, resetn, reset;

	integer ROM0[255:0];
	integer ROM1[255:0];
	integer ROM2[255:0];
	integer ROM3[255:0];
	integer ROM4[255:0];
	integer ROM5[255:0];
	integer ROM6[255:0];
	integer ROM7[255:0];
		
	always begin
		`HALF_CLK_PERIOD
		clk	= ~clk;
	end

	DA	DA(
			.ACC_OUT	(ACC_OUT),
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
			.WEN		(WEN),
			.CEN		(1'b0),
			.reset		(reset),
			.clk		(clk),
			.resetn		(resetn)
	);



	always	@(posedge clk) begin
		`QRTR_CLK_PERIOD
		if (writing==1) begin
			WEN				= 1'b0;
			CADDR				= i;
			CADDR_INT			= CADDR;
			ROM_INDEX			= CADDR[10:8];
			ADDRESS_INDEX			= CADDR[7:0];
			CIN				= ($urandom%2097152) - 1048576;
			CIN_INT				= $signed(CIN);
			case(ROM_INDEX)
                        	0: begin
					ROM0[ADDRESS_INDEX] = CIN_INT;
				end
				1: begin
					ROM1[ADDRESS_INDEX] = CIN_INT;
				end
				2: begin
					ROM2[ADDRESS_INDEX] = CIN_INT;
				end
				3: begin
					ROM3[ADDRESS_INDEX] = CIN_INT;
				end
				4: begin
					ROM4[ADDRESS_INDEX] = CIN_INT;
				end
				5: begin
					ROM5[ADDRESS_INDEX] = CIN_INT;
				end
				6: begin
					ROM6[ADDRESS_INDEX] = CIN_INT;
				end
				7: begin
					ROM7[ADDRESS_INDEX] = CIN_INT;
				end
			endcase
			
		end
		else if (writing==0) begin
			CADDR				= {11{1'b0}};
			CIN				= 20'b0;
			WEN				= 1'b1;
			A7				= $urandom%2048;
			A6				= $urandom%2048;
			A5				= $urandom%2048;
			A4				= $urandom%2048;
			A3				= $urandom%2048;
			A2				= $urandom%2048;
			A1				= $urandom%2048;
			A0				= $urandom%2048;
		end
	end

	initial	begin
		writing		= 3;
		iteration	= {32{1'bZ}};
		calculated	= 0;
		clk		= 0;
		@(posedge clk);
		resetn		= `ON;
		WEN		= 1;
		@(posedge clk);
		resetn		= `OFF;
		writing		= 1;
		@(posedge clk);
		/* LOAD PRE-COMPUTED-VALUES LOOP */
		for (i = 0; i < `TOTAL_ROM_SIZE; i = i + 1) begin
			@(posedge clk);
		end
		iteration	= 0;
		writing	= 0;
		resetn = 1;
		/* COMPUTE LOOP */
		for (i = 0; calculated < `ITER; i = i + 1) begin
			@(posedge clk);
		end
		@(posedge clk);
		$finish;
	end

endmodule /* testbench */

