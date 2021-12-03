`timescale 1ns/1ps

module Control(
	input wire	clk,
	input wire	valid_in,
	input wire	resetn,
	output reg	enable_FIFO, resetn_FIFO, reset_DA, resetn_DA, start_DA, global_valid_out
); 

	reg 		CS,NS;
	
	parameter S0 = 1'b0, S1 = 1'b1;

	always @(valid_in, resetn, CS) begin
		case(CS)
			S0: begin
				if(valid_in)
					NS	= S1; 
				else
					NS	= S0;
			end
			S1: begin
				if(!resetn)
					NS 	= S0;
				else
					NS	= S1;			
			end
			default: begin				
				NS	= S0;
			end
		endcase
	end
	
	always @(posedge clk) begin
		if (!resetn) begin
			CS	<= S0;
			global_valid_out <= 0;
		end
		else
			CS <= NS;
			global_valid_out <= valid_in;			
	end
	
	always @(CS, posedge clk) begin
		case(CS)
			S0: begin
				enable_FIFO 	= 0;
				resetn_FIFO	= 0;
				reset_DA 	= 1;
				resetn_DA	= 0;
				start_DA 	= 0;
			end
			S1: begin
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

				
