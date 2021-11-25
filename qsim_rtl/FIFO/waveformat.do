onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /testbench/clk1
add wave -noupdate -radix unsigned /testbench/clk2
add wave -noupdate -radix unsigned /testbench/w
add wave -noupdate -radix unsigned /testbench/FIFO_system/fifo_interface.load
add wave -noupdate -radix unsigned /testbench/resetn
add wave -noupdate -radix unsigned /testbench/enable
add wave -noupdate -radix unsigned /testbench/A0
add wave -noupdate -radix unsigned /testbench/A1
add wave -noupdate -radix unsigned /testbench/A2
add wave -noupdate -radix unsigned /testbench/A3
add wave -noupdate -radix unsigned /testbench/A4
add wave -noupdate -radix unsigned /testbench/A5
add wave -noupdate -radix unsigned /testbench/A6
add wave -noupdate -radix unsigned /testbench/A7
add wave -noupdate -radix unsigned /testbench/FIFO_system/fifo_interface.X0
add wave -noupdate -radix unsigned /testbench/FIFO_system/fifo_interface.X1
add wave -noupdate -radix unsigned /testbench/FIFO_system/fifo_interface.X2
add wave -noupdate -radix unsigned /testbench/FIFO_system/fifo_interface.X3
add wave -noupdate -radix unsigned /testbench/FIFO_system/fifo_interface.X4
add wave -noupdate -radix unsigned /testbench/FIFO_system/fifo_interface.X5
add wave -noupdate -radix unsigned /testbench/FIFO_system/fifo_interface.X6
add wave -noupdate -radix unsigned /testbench/FIFO_system/fifo_interface.X7
add wave -noupdate -radix unsigned /testbench/FIFO_system/fifo_interface/SREG_0.Y
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ns} {12 ns}


