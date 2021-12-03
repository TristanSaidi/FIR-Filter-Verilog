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
add wave -noupdate /testbench/DUT.load_zreg
add wave -noupdate /testbench/DUT.do_w0
add wave -noupdate /testbench/DUT.do_w1
add wave -noupdate /testbench/DUT.do_w2
add wave -noupdate /testbench/DUT.do_w3
add wave -noupdate /testbench/DUT.do_y0
add wave -noupdate /testbench/DUT.do_y1
add wave -noupdate /testbench/DUT.do_f0
add wave -noupdate /testbench/DUT.do_acc
add wave -noupdate /testbench/done
add wave -noupdate -radix decimal /testbench/DUT.ACC
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


