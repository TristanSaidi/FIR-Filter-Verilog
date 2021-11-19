`timescale 1ns/1ps

module FIFO(Addr,R,E,w,clk,Q);
	parameter n = 64;
	input R,E,clk;
	input [15:0]w;
	output reg [15:0]Q;
	integer k;
	input [5:0]Addr;
	reg [15:0]array[0:63];
	wire [15:0]muxwires[0:3];
	genvar i;

	generate
		for (i = 0; i < 4; i = i+1) begin
			sixteento1mux mux(array[i*16],array[(i*16)+1],array[(i*16)+2],array[(i*16)+3],array[(i*16)+4],array[(i*16)+5],array[(i*16)+6],array[(i*16)+7],array[(i*16)+8],array[(i*16)+9],array[(i*16)+10],array[(i*16)+11],array[(i*16)+12],array[(i*16)+13],array[(i*16)+14],array[(i*16)+15], Addr[3:0],muxwires[i]);
		end
	endgenerate

	always @(posedge clk) begin
		
		if (R) begin
			for (k = 63; k >= 0; k = k-1) begin
				array[k] <= 16'b0;
			end
		end
		else if(E) begin
			
			for (k = 63; k >= 1; k = k-1) begin
				array[k] <= array[k-1];
			end
			
			array[0] <= w;
			
		end
		
	end
	
	always @(array[0],array[1],array[2],array[3],array[4],array[5],array[6],array[7],array[8],array[9],array[10],array[11],array[12],array[13],array[14],array[15],Addr) begin

		case (Addr[5:4])
			0: Q <=muxwires[0];
			1: Q <=muxwires[1];
			2: Q <=muxwires[2];
			3: Q <=muxwires[3];
		endcase
	end

endmodule


module sixteento1mux(in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15, select, out);

	input [15:0]in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15;
	input [3:0]select;
	output reg [15:0]out;	

	always @(in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,select) begin		
		case(select)
			0: out = in0;
			1: out = in1;
			2: out = in2;
			3: out = in3;
			4: out = in4;
			5: out = in5;
			6: out = in6;
			7: out = in7;
			8: out = in8;
			9: out = in9;
			10: out = in10;
			11: out = in11;
			12: out = in12;
			13: out = in13;
			14: out = in14;
			15: out = in15;
		endcase
	end
endmodule

