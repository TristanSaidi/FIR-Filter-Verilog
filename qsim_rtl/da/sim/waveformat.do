onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate -radix decimal /testbench/cycle
add wave -noupdate -radix decimal /testbench/iteration
add wave -noupdate /testbench/reset
add wave -noupdate /testbench/start
add wave -noupdate -radix unsigned /testbench/DUT.i
add wave -noupdate -radix decimal /testbench/DUT.ADDER_RESULT
add wave -noupdate -radix decimal /testbench/DUT.X_ADDER_REG
add wave -noupdate -radix decimal /testbench/DUT.Y_ADDER_REG
add wave -noupdate -radix decimal /testbench/DUT.ACC
add wave -noupdate -radix decimal /testbench/DUT.Z7
add wave -noupdate -radix decimal /testbench/DUT.Z6
add wave -noupdate -radix decimal /testbench/DUT.Z5
add wave -noupdate -radix decimal /testbench/DUT.Z4
add wave -noupdate -radix decimal /testbench/DUT.Z3
add wave -noupdate -radix decimal /testbench/DUT.Z2
add wave -noupdate -radix decimal /testbench/DUT.Z1
add wave -noupdate -radix decimal /testbench/DUT.Z0
add wave -noupdate -radix decimal /testbench/DUT.W3
add wave -noupdate -radix decimal /testbench/DUT.W2
add wave -noupdate -radix decimal /testbench/DUT.W1
add wave -noupdate -radix decimal /testbench/DUT.W0
add wave -noupdate -radix decimal /testbench/DUT.Y0
add wave -noupdate -radix decimal /testbench/DUT.do_acc
add wave -noupdate /testbench/done
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


