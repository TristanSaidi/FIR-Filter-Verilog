
module rshiftregne#(
	parameter			n=20
)
(
	output	wire			Q,
	input	wire	[(n-1):0]	X,
	input	wire			shift_in,
	input	wire			load,
	input	wire			enable,
	input	wire			clk,
	input	wire			resetn
);


	reg	[(n-1):0]	Y;
	assign	Q	= Y[0];

	always	@(posedge clk) begin
		if (~resetn) begin
			Y	<= 0;
		end
		else if (load) begin
			Y	<= X;
		end
		else if (enable) begin
			Y 		<= Y >> 1;
			Y[(n-1)]	<= shift_in;
		end
		else begin
		end
	end
endmodule /* rshiftregne */

