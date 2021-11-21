onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/CLOAD
add wave -noupdate /testbench/valid_in
add wave -noupdate /testbench/done
add wave -noupdate /testbench/start
add wave -noupdate -radix decimal /testbench/CIN
add wave -noupdate -radix decimal /testbench/CADDR
add wave -noupdate -radix decimal /testbench/A7
add wave -noupdate -radix decimal /testbench/A6
add wave -noupdate -radix decimal /testbench/A5
add wave -noupdate -radix decimal /testbench/A4
add wave -noupdate -radix decimal /testbench/A3
add wave -noupdate -radix decimal /testbench/A2
add wave -noupdate -radix decimal /testbench/A1
add wave -noupdate -radix decimal /testbench/A0
add wave -noupdate -radix decimal /testbench/DUT.Z7
add wave -noupdate -radix decimal /testbench/DUT.Z6
add wave -noupdate -radix decimal /testbench/DUT.Z5
add wave -noupdate -radix decimal /testbench/DUT.Z4
add wave -noupdate -radix decimal /testbench/DUT.Z3
add wave -noupdate -radix decimal /testbench/DUT.Z2
add wave -noupdate -radix decimal /testbench/DUT.Z1
add wave -noupdate -radix decimal /testbench/DUT.Z0
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


