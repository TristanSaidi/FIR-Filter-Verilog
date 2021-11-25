`include "fifo_interface.v" 
`timescale 1ns/1ps

module FIFO_system(
	input			resetn,enable,clk1,clk2,
	input		[15:0]	w,
	output	wire	[7:0]	A7,A6,A5,A4,A3,A2,A1,A0
);	
	reg		[15:0]	array	[0:63];
	reg			load;
	integer 	k;

	fifo_interface		fifo_interface(
				.A7		(A7),
				.A6		(A6),
				.A5		(A5),
				.A4		(A4),
				.A3		(A3),
				.A2		(A2),
				.A1		(A1),
				.A0		(A0),
				.X63		(array[63]),
				.X62		(array[62]),
				.X61		(array[61]),
				.X60		(array[60]),
				.X59		(array[59]),
				.X58		(array[58]),
				.X57		(array[57]),
				.X56		(array[56]),
				.X55		(array[55]),
				.X54		(array[54]),
				.X53		(array[53]),
				.X52		(array[52]),
				.X51		(array[51]),
				.X50		(array[50]),
				.X49		(array[49]),
				.X48		(array[48]),
				.X47		(array[47]),
				.X46		(array[46]),
				.X45		(array[45]),
				.X44		(array[44]),
				.X43		(array[43]),
				.X42		(array[42]),
				.X41		(array[41]),
				.X40		(array[40]),
				.X39		(array[39]),
				.X38		(array[38]),
				.X37		(array[37]),
				.X36		(array[36]),
				.X35		(array[35]),
				.X34		(array[34]),
				.X33		(array[33]),
				.X32		(array[32]),
				.X31		(array[31]),
				.X30		(array[30]),
				.X29		(array[29]),
				.X28		(array[28]),
				.X27		(array[27]),
				.X26		(array[26]),
				.X25		(array[25]),
				.X24		(array[24]),
				.X23		(array[23]),
				.X22		(array[22]),
				.X21		(array[21]),
				.X20		(array[20]),
				.X19		(array[19]),
				.X18		(array[18]),
				.X17		(array[17]),
				.X16		(array[16]),
				.X15		(array[15]),
				.X14		(array[14]),
				.X13		(array[13]),
				.X12		(array[12]),
				.X11		(array[11]),
				.X10		(array[10]),
				.X9		(array[9]),
				.X8		(array[8]),
				.X7		(array[7]),
				.X6		(array[6]),
				.X5		(array[5]),
				.X4		(array[4]),
				.X3		(array[3]),
				.X2		(array[2]),
				.X1		(array[1]),
				.X0		(array[0]),
				.clk		(clk2),
				.resetn		(resetn),
				.enable		(enable),
				.load		(load)
				);
				
	
	always @(posedge clk1) begin
		
		if (!resetn) begin
			for (k = 63; k >= 0; k = k-1) begin
				array[k] <= 16'b0;
			end
		end
		else if(enable) begin
			
			for (k = 63; k >= 1; k = k-1) begin
				array[k] <= array[k-1];
			end
			
			array[0] <= w;
			load <= 1;
			@(negedge clk2);
			load <= 0;
			
		end
		
	end

endmodule

