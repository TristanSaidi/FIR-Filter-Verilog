onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /testbench/i
add wave -noupdate -radix unsigned /testbench/j
add wave -noupdate /testbench/clk_fast
add wave -noupdate /testbench/clk_slow
add wave -noupdate /testbench/DUT.FIFO_system.load
add wave -noupdate /testbench/DUT.da.start
add wave -noupdate /testbench/DUT.da.reset
add wave -noupdate /testbench/DUT.da.load_zreg
add wave -noupdate /testbench/DUT.da.do_w0
add wave -noupdate /testbench/DUT.da.do_w1
add wave -noupdate /testbench/DUT.da.do_w2
add wave -noupdate /testbench/DUT.da.do_w3
add wave -noupdate /testbench/DUT.da.do_y0
add wave -noupdate /testbench/DUT.da.do_y1
add wave -noupdate /testbench/DUT.da.do_f0
add wave -noupdate /testbench/DUT.da.do_acc
add wave -noupdate /testbench/DUT.da.done
add wave -noupdate /testbench/DUT.FIFO_system.enable
add wave -noupdate /testbench/DUT.FIFO_system.enable_single
add wave -noupdate /testbench/DUT.da.CEN
add wave -noupdate /testbench/DUT.da.WEN

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
WaveRestoreZoom {0 ns} {60 ns}


