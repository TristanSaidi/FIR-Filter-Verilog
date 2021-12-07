`timescale 1ns/1ps

module Control(
	input wire	clk,
	input wire	valid_in,
	input wire	resetn, CLOAD,
	output reg	enable_FIFO, resetn_FIFO, reset_DA, resetn_DA, start_DA, global_valid_out
); 

	reg 		[1:0]	CS,NS;
	
	parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

	always @(valid_in, resetn, CS) begin
		if(~resetn) begin		
			NS = S0;
		end		
		case(CS)
			S0: begin
				if(CLOAD)
					NS	= S1; 
				else
					NS	= S0;
			end
			S1: begin
				if(valid_in) begin
					NS 	= S2;
				end
				else begin
					NS	= S1;
				end			
			end
			S2: begin
			
			end
			default: begin				
				NS	= S0;
			end
		endcase
	end
	
	always @(posedge clk) begin
		if (!resetn) begin
			CS	<= 0;
			global_valid_out <= 0;
		end
		else begin
			CS <= NS;
			global_valid_out <= valid_in;			
		end
	end
	
	always @(posedge clk) begin
		case(CS)
			S0: begin
				enable_FIFO 	= 0;
				resetn_FIFO	= 0;
				reset_DA 	= 1;
				resetn_DA	= 0;
				start_DA 	= 0;
			end
			S1: begin
				enable_FIFO 	= 0;
				resetn_FIFO	= 0;
				reset_DA 	= 1;
				resetn_DA	= 1;
				start_DA 	= 0;
			end
			S2: begin
				enable_FIFO	= 1;
				resetn_FIFO	= 1;
				reset_DA	= 0;
				resetn_DA	= 1;
				start_DA	= 1;
			end
			default: begin
				enable_FIFO 	= 0;
				resetn_FIFO	= 0;
				reset_DA 	= 1;
				resetn_DA	= 0;
				start_DA 	= 0;
			end
		endcase
	end
	
endmodule

				
