onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate -radix signed /testbench/ACC_OUT
add wave -noupdate -radix unsigned /testbench/A7
add wave -noupdate -radix unsigned /testbench/A6
add wave -noupdate -radix unsigned /testbench/A5
add wave -noupdate -radix unsigned /testbench/A4
add wave -noupdate -radix unsigned /testbench/A3
add wave -noupdate -radix unsigned /testbench/A2
add wave -noupdate -radix unsigned /testbench/A1
add wave -noupdate -radix unsigned /testbench/A0
add wave -noupdate -radix decimal /testbench/DA/WEN
add wave -noupdate -radix decimal /testbench/DA/CEN
add wave -noupdate -radix decimal /testbench/DA/Q7
add wave -noupdate -radix decimal /testbench/DA/Q6
add wave -noupdate -radix decimal /testbench/DA/Q5
add wave -noupdate -radix decimal /testbench/DA/Q4
add wave -noupdate -radix decimal /testbench/DA/Q3
add wave -noupdate -radix decimal /testbench/DA/Q2
add wave -noupdate -radix decimal /testbench/DA/Q1
add wave -noupdate -radix decimal /testbench/DA/Q0
add wave -noupdate -radix decimal /testbench/DA/Z7
add wave -noupdate -radix decimal /testbench/DA/Z6
add wave -noupdate -radix decimal /testbench/DA/Z5
add wave -noupdate -radix decimal /testbench/DA/Z4
add wave -noupdate -radix decimal /testbench/DA/Z3
add wave -noupdate -radix decimal /testbench/DA/Z2
add wave -noupdate -radix decimal /testbench/DA/Z1
add wave -noupdate -radix decimal /testbench/DA/Z0
add wave -noupdate -radix decimal /testbench/DA/W3
add wave -noupdate -radix decimal /testbench/DA/W2
add wave -noupdate -radix decimal /testbench/DA/W1
add wave -noupdate -radix decimal /testbench/DA/W0
add wave -noupdate -radix decimal /testbench/DA/Y1
add wave -noupdate -radix decimal /testbench/DA/Y0
add wave -noupdate -radix decimal /testbench/DA/ACC

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


