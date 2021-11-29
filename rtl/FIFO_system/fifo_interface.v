`include "rshiftregne.v"
module fifo_interface(
	output	wire	[7:0]	A7, A6, A5, A4, 
	output	wire	[7:0]	A3, A2, A1, A0, 
	input	wire	[15:0]	X63, X62, X61, X60, 
	input	wire	[15:0]	X59, X58, X57, X56, 
	input	wire	[15:0]	X55, X54, X53, X52, 
	input	wire	[15:0]	X51, X50, X49, X48, 
	input	wire	[15:0]	X47, X46, X45, X44, 
	input	wire	[15:0]	X43, X42, X41, X40, 
	input	wire	[15:0]	X39, X38, X37, X36, 
	input	wire	[15:0]	X35, X34, X33, X32, 
	input	wire	[15:0]	X31, X30, X29, X28, 
	input	wire	[15:0]	X27, X26, X25, X24, 
	input	wire	[15:0]	X23, X22, X21, X20, 
	input	wire	[15:0]	X19, X18, X17, X16, 
	input	wire	[15:0]	X15, X14, X13, X12, 
	input	wire	[15:0]	X11, X10, X9, X8, 
	input	wire	[15:0]	X7, X6, X5, X4, 
	input	wire	[15:0]	X3, X2, X1, X0,
	input	wire	clk, resetn, enable,load
);

	rshiftregne	SREG_0(
			.Q		(A0[0]),
			.X		(X0),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_0.n	= 16;

	rshiftregne	SREG_1(
			.Q		(A0[1]),
			.X		(X1),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_1.n	= 16;

	rshiftregne	SREG_2(
			.Q		(A0[2]),
			.X		(X2),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_2.n	= 16;

	rshiftregne	SREG_3(
			.Q		(A0[3]),
			.X		(X3),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_3.n	= 16;

	rshiftregne	SREG_4(
			.Q		(A0[4]),
			.X		(X4),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_4.n	= 16;

	rshiftregne	SREG_5(
			.Q		(A0[5]),
			.X		(X5),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_5.n	= 16;

	rshiftregne	SREG_6(
			.Q		(A0[6]),
			.X		(X6),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_6.n	= 16;

	rshiftregne	SREG_7(
			.Q		(A0[7]),
			.X		(X7),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_7.n	= 16;

	rshiftregne	SREG_8(
			.Q		(A1[0]),
			.X		(X8),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_8.n	= 16;

	rshiftregne	SREG_9(
			.Q		(A1[1]),
			.X		(X9),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_9.n	= 16;

	rshiftregne	SREG_10(
			.Q		(A1[2]),
			.X		(X10),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_10.n	= 16;

	rshiftregne	SREG_11(
			.Q		(A1[3]),
			.X		(X11),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_11.n	= 16;

	rshiftregne	SREG_12(
			.Q		(A1[4]),
			.X		(X12),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_12.n	= 16;

	rshiftregne	SREG_13(
			.Q		(A1[5]),
			.X		(X13),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_13.n	= 16;

	rshiftregne	SREG_14(
			.Q		(A1[6]),
			.X		(X14),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_14.n	= 16;

	rshiftregne	SREG_15(
			.Q		(A1[7]),
			.X		(X15),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_15.n	= 16;

	rshiftregne	SREG_16(
			.Q		(A2[0]),
			.X		(X16),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_16.n	= 16;

	rshiftregne	SREG_17(
			.Q		(A2[1]),
			.X		(X17),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_17.n	= 16;

	rshiftregne	SREG_18(
			.Q		(A2[2]),
			.X		(X18),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_18.n	= 16;

	rshiftregne	SREG_19(
			.Q		(A2[3]),
			.X		(X19),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_19.n	= 16;

	rshiftregne	SREG_20(
			.Q		(A2[4]),
			.X		(X20),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_20.n	= 16;

	rshiftregne	SREG_21(
			.Q		(A2[5]),
			.X		(X21),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_21.n	= 16;

	rshiftregne	SREG_22(
			.Q		(A2[6]),
			.X		(X22),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_22.n	= 16;

	rshiftregne	SREG_23(
			.Q		(A2[7]),
			.X		(X23),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_23.n	= 16;

	rshiftregne	SREG_24(
			.Q		(A3[0]),
			.X		(X24),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_24.n	= 16;

	rshiftregne	SREG_25(
			.Q		(A3[1]),
			.X		(X25),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_25.n	= 16;

	rshiftregne	SREG_26(
			.Q		(A3[2]),
			.X		(X26),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_26.n	= 16;

	rshiftregne	SREG_27(
			.Q		(A3[3]),
			.X		(X27),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_27.n	= 16;

	rshiftregne	SREG_28(
			.Q		(A3[4]),
			.X		(X28),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_28.n	= 16;

	rshiftregne	SREG_29(
			.Q		(A3[5]),
			.X		(X29),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_29.n	= 16;

	rshiftregne	SREG_30(
			.Q		(A3[6]),
			.X		(X30),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_30.n	= 16;

	rshiftregne	SREG_31(
			.Q		(A3[7]),
			.X		(X31),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_31.n	= 16;

	rshiftregne	SREG_32(
			.Q		(A4[0]),
			.X		(X32),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_32.n	= 16;

	rshiftregne	SREG_33(
			.Q		(A4[1]),
			.X		(X33),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_33.n	= 16;

	rshiftregne	SREG_34(
			.Q		(A4[2]),
			.X		(X34),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_34.n	= 16;

	rshiftregne	SREG_35(
			.Q		(A4[3]),
			.X		(X35),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_35.n	= 16;

	rshiftregne	SREG_36(
			.Q		(A4[4]),
			.X		(X36),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_36.n	= 16;

	rshiftregne	SREG_37(
			.Q		(A4[5]),
			.X		(X37),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_37.n	= 16;

	rshiftregne	SREG_38(
			.Q		(A4[6]),
			.X		(X38),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_38.n	= 16;

	rshiftregne	SREG_39(
			.Q		(A4[7]),
			.X		(X39),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_39.n	= 16;

	rshiftregne	SREG_40(
			.Q		(A5[0]),
			.X		(X40),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_40.n	= 16;

	rshiftregne	SREG_41(
			.Q		(A5[1]),
			.X		(X41),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_41.n	= 16;

	rshiftregne	SREG_42(
			.Q		(A5[2]),
			.X		(X42),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_42.n	= 16;

	rshiftregne	SREG_43(
			.Q		(A5[3]),
			.X		(X43),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_43.n	= 16;

	rshiftregne	SREG_44(
			.Q		(A5[4]),
			.X		(X44),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_44.n	= 16;

	rshiftregne	SREG_45(
			.Q		(A5[5]),
			.X		(X45),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_45.n	= 16;

	rshiftregne	SREG_46(
			.Q		(A5[6]),
			.X		(X46),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_46.n	= 16;

	rshiftregne	SREG_47(
			.Q		(A5[7]),
			.X		(X47),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_47.n	= 16;

	rshiftregne	SREG_48(
			.Q		(A6[0]),
			.X		(X48),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_48.n	= 16;

	rshiftregne	SREG_49(
			.Q		(A6[1]),
			.X		(X49),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_49.n	= 16;

	rshiftregne	SREG_50(
			.Q		(A6[2]),
			.X		(X50),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_50.n	= 16;

	rshiftregne	SREG_51(
			.Q		(A6[3]),
			.X		(X51),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_51.n	= 16;

	rshiftregne	SREG_52(
			.Q		(A6[4]),
			.X		(X52),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_52.n	= 16;

	rshiftregne	SREG_53(
			.Q		(A6[5]),
			.X		(X53),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_53.n	= 16;

	rshiftregne	SREG_54(
			.Q		(A6[6]),
			.X		(X54),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_54.n	= 16;

	rshiftregne	SREG_55(
			.Q		(A6[7]),
			.X		(X55),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_55.n	= 16;

	rshiftregne	SREG_56(
			.Q		(A7[0]),
			.X		(X56),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_56.n	= 16;

	rshiftregne	SREG_57(
			.Q		(A7[1]),
			.X		(X57),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_57.n	= 16;

	rshiftregne	SREG_58(
			.Q		(A7[2]),
			.X		(X58),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_58.n	= 16;

	rshiftregne	SREG_59(
			.Q		(A7[3]),
			.X		(X59),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_59.n	= 16;

	rshiftregne	SREG_60(
			.Q		(A7[4]),
			.X		(X60),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_60.n	= 16;

	rshiftregne	SREG_61(
			.Q		(A7[5]),
			.X		(X61),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_61.n	= 16;

	rshiftregne	SREG_62(
			.Q		(A7[6]),
			.X		(X62),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_62.n	= 16;

	rshiftregne	SREG_63(
			.Q		(A7[7]),
			.X		(X63),
			.shift_in	(1'b0),
			.load		(load),
			.enable		(enable),
			.clk		(clk),
			.resetn		(resetn)
			);
			defparam SREG_63.n	= 16;

endmodule /* fifo_interface */
