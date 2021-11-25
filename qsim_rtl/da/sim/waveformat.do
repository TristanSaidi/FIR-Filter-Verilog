onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate -radix decimal /testbench/cycle
add wave -noupdate -radix decimal /testbench/iteration
add wave -noupdate /testbench/reset
add wave -noupdate /testbench/CLOAD
add wave -noupdate /testbench/valid_in
add wave -noupdate /testbench/resetn
add wave -noupdate /testbench/start
<<<<<<< HEAD
add wave -noupdate /testbench/DUT.load_zreg
add wave -noupdate /testbench/DUT.do_w0
add wave -noupdate /testbench/DUT.do_w1
add wave -noupdate /testbench/DUT.do_w2
add wave -noupdate /testbench/DUT.do_w3
add wave -noupdate /testbench/DUT.do_y0
add wave -noupdate /testbench/DUT.do_y1
add wave -noupdate /testbench/DUT.do_f0
add wave -noupdate /testbench/DUT.do_acc
add wave -noupdate /testbench/valid_out
add wave -noupdate /testbench/DUT.i
add wave -noupdate -radix decimal /testbench/DUT.Z7
add wave -noupdate -radix decimal /testbench/DUT.Z6
add wave -noupdate -radix decimal /testbench/DUT.Z5
add wave -noupdate -radix decimal /testbench/DUT.Z4
add wave -noupdate -radix decimal /testbench/DUT.Z3
add wave -noupdate -radix decimal /testbench/DUT.Z2
add wave -noupdate -radix decimal /testbench/DUT.Z1
add wave -noupdate -radix decimal /testbench/DUT.Z0
add wave -noupdate -radix decimal /testbench/DUT.ADDER_RESULT
add wave -noupdate -radix decimal /testbench/DUT.W3
add wave -noupdate -radix decimal /testbench/DUT.W2
add wave -noupdate -radix decimal /testbench/DUT.W1
add wave -noupdate -radix decimal /testbench/DUT.W0
add wave -noupdate -radix decimal /testbench/DUT.Y0
add wave -noupdate -radix decimal /testbench/DUT.F0
add wave -noupdate -radix decimal /testbench/DUT.ACC
=======
add wave -noupdate /testbench/DUT/ROM_BANK/genblk1[7]/WENIB
add wave -noupdate /testbench/DUT/ROM_BANK/genblk1[6]/WENIB
add wave -noupdate /testbench/DUT/ROM_BANK/genblk1[5]/WENIB
add wave -noupdate /testbench/DUT/ROM_BANK/genblk1[4]/WENIB
add wave -noupdate /testbench/DUT/ROM_BANK/genblk1[3]/WENIB
add wave -noupdate /testbench/DUT/ROM_BANK/genblk1[2]/WENIB
add wave -noupdate /testbench/DUT/ROM_BANK/genblk1[1]/WENIB
add wave -noupdate /testbench/DUT/ROM_BANK/genblk1[0]/WENIB
add wave -noupdate /testbench/DUT/ROM_BANK/CENI
add wave -noupdate -radix unsigned /testbench/DUT/ROM_BANK/genblk1[7]/AIB
add wave -noupdate -radix unsigned /testbench/DUT/ROM_BANK/genblk1[6]/AIB
add wave -noupdate -radix unsigned /testbench/DUT/ROM_BANK/genblk1[5]/AIB
add wave -noupdate -radix unsigned /testbench/DUT/ROM_BANK/genblk1[4]/AIB
add wave -noupdate -radix unsigned /testbench/DUT/ROM_BANK/genblk1[3]/AIB
add wave -noupdate -radix unsigned /testbench/DUT/ROM_BANK/genblk1[2]/AIB
add wave -noupdate -radix unsigned /testbench/DUT/ROM_BANK/genblk1[1]/AIB
add wave -noupdate -radix unsigned /testbench/DUT/ROM_BANK/genblk1[0]/AIB
add wave -noupdate -radix unsigned /testbench/A7
add wave -noupdate -radix unsigned /testbench/A6
add wave -noupdate -radix unsigned /testbench/A5
add wave -noupdate -radix unsigned /testbench/A4
add wave -noupdate -radix unsigned /testbench/A3
add wave -noupdate -radix unsigned /testbench/A2
add wave -noupdate -radix unsigned /testbench/A1
add wave -noupdate -radix unsigned /testbench/A0
add wave -noupdate -radix decimal /testbench/DUT/Z7
add wave -noupdate -radix decimal /testbench/DUT/Z6
add wave -noupdate -radix decimal /testbench/DUT/Z5
add wave -noupdate -radix decimal /testbench/DUT/Z4
add wave -noupdate -radix decimal /testbench/DUT/Z3
add wave -noupdate -radix decimal /testbench/DUT/Z2
add wave -noupdate -radix decimal /testbench/DUT/Z1
add wave -noupdate -radix decimal /testbench/DUT/Z0
>>>>>>> ce7a782fd9519626104be539f3fd7ff10a831f1b
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 223
configure wave -valuecolwidth 89
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {12 ns}


