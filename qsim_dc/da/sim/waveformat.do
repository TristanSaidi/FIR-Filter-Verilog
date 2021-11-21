onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/CLOAD
add wave -noupdate /testbench/valid_in
add wave -noupdate /testbench/start
add wave -noupdate /testbench/done
add wave -noupdate /testbench/valid_out
add wave -noupdate -radix unsigned /testbench/A7_INT
add wave -noupdate -radix unsigned /testbench/A6_INT
add wave -noupdate -radix unsigned /testbench/A5_INT
add wave -noupdate -radix unsigned /testbench/A4_INT
add wave -noupdate -radix unsigned /testbench/A3_INT
add wave -noupdate -radix unsigned /testbench/A2_INT
add wave -noupdate -radix unsigned /testbench/A1_INT
add wave -noupdate -radix unsigned /testbench/A0_INT
add wave -noupdate -radix decimal /testbench/ACC
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


