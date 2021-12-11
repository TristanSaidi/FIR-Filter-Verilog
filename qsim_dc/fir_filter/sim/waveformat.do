
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /testbench/i
add wave -noupdate -radix unsigned /testbench/j
add wave -noupdate /testbench/clk_fast
add wave -noupdate /testbench/clk_slow
add wave -noupdate /testbench/DUT.done
add wave -noupdate /testbench/DUT/start_DA
add wave -noupdate /testbench/resetn


add wave -noupdate /testbench/DUT/enable_FIFO
add wave -noupdate -radix decimal /testbench/DUT.load
add wave -noupdate -radix decimal /testbench/DUT.start
add wave -noupdate -radix decimal /testbench/valid_in
add wave -noupdate -radix unsigned /testbench/CADDR
add wave -noupdate -radix unsigned /testbench/CIN
add wave -noupdate -radix unsigned /testbench/CLOAD
add wave -noupdate -radix decimal /testbench/X
add wave -noupdate -radix decimal /testbench/Y
add wave -noupdate -radix decimal /testbench/Y_INT
add wave -noupdate -radix decimal /testbench/DUT.ACC_OUT
add wave -noupdate -radix unsigned /testbench/DUT.A7
add wave -noupdate -radix unsigned /testbench/DUT.A6
add wave -noupdate -radix unsigned /testbench/DUT.A5
add wave -noupdate -radix unsigned /testbench/DUT.A4
add wave -noupdate -radix unsigned /testbench/DUT.A3
add wave -noupdate -radix unsigned /testbench/DUT.A2
add wave -noupdate -radix unsigned /testbench/DUT.A1
add wave -noupdate -radix unsigned /testbench/DUT.A0

add wave -noupdate -radix decimal /testbench/DUT/da.Q0
add wave -noupdate -radix decimal /testbench/DUT/da.Q1
add wave -noupdate -radix decimal /testbench/DUT/da.Q2
add wave -noupdate -radix decimal /testbench/DUT/da.Q3
add wave -noupdate -radix decimal /testbench/DUT/da.Q4
add wave -noupdate -radix decimal /testbench/DUT/da.Q5
add wave -noupdate -radix decimal /testbench/DUT/da.Q6
add wave -noupdate -radix decimal /testbench/DUT/da.Q7
add wave -noupdate -radix decimal /testbench/DUT/da.CEN
add wave -noupdate -radix decimal /testbench/DUT/da.WEN
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
