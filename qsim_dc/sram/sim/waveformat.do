onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/i
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/CEN
add wave -noupdate /testbench/WEN
add wave -noupdate -radix unsigned /testbench/CADDR
add wave -noupdate -radix decimal /testbench/D
add wave -noupdate -radix unsigned /testbench/Q7
add wave -noupdate -radix unsigned /testbench/Q6
add wave -noupdate -radix unsigned /testbench/Q5
add wave -noupdate -radix unsigned /testbench/Q4
add wave -noupdate -radix unsigned /testbench/Q3
add wave -noupdate -radix unsigned /testbench/Q2
add wave -noupdate -radix unsigned /testbench/Q1
add wave -noupdate -radix unsigned /testbench/Q0
add wave -noupdate -radix unsigned /testbench/A7
add wave -noupdate -radix unsigned /testbench/A6
add wave -noupdate -radix unsigned /testbench/A5
add wave -noupdate -radix unsigned /testbench/A4
add wave -noupdate -radix unsigned /testbench/A3
add wave -noupdate -radix unsigned /testbench/A2
add wave -noupdate -radix unsigned /testbench/A1
add wave -noupdate -radix unsigned /testbench/A0
add wave -noupdate -radix decimal /testbench/Q

add wave -noupdate -radix decimal /testbench/DUT.Q
add wave -noupdate -radix unsigned /testbench/DUT.CADDRI
add wave -noupdate -radix unsigned /testbench/DUT.AI[7]
add wave -noupdate -radix unsigned /testbench/DUT.AI[6]
add wave -noupdate -radix unsigned /testbench/DUT.AI[5]
add wave -noupdate -radix unsigned /testbench/DUT.AI[4]
add wave -noupdate -radix unsigned /testbench/DUT.AI[3]
add wave -noupdate -radix unsigned /testbench/DUT.AI[2]
add wave -noupdate -radix unsigned /testbench/DUT.AI[1]
add wave -noupdate -radix unsigned /testbench/DUT.AI[0]
add wave -noupdate -radix decimal /testbench/DUT.DI
add wave -noupdate /testbench/DUT.WENI
add wave -noupdate /testbench/DUT.CENI
add wave -noupdate /testbench/DUT.genblk[7].WENIB
add wave -noupdate /testbench/DUT.genblk[6].WENIB
add wave -noupdate /testbench/DUT.genblk[5].WENIB
add wave -noupdate /testbench/DUT.genblk[4].WENIB
add wave -noupdate /testbench/DUT.genblk[3].WENIB
add wave -noupdate /testbench/DUT.genblk[2].WENIB
add wave -noupdate /testbench/DUT.genblk[1].WENIB
add wave -noupdate /testbench/DUT.genblk[0].WENIB
add wave -noupdate /testbench/DUT.genblk[7].AIB
add wave -noupdate /testbench/DUT.genblk[6].AIB
add wave -noupdate /testbench/DUT.genblk[5].AIB
add wave -noupdate /testbench/DUT.genblk[4].AIB
add wave -noupdate /testbench/DUT.genblk[3].AIB
add wave -noupdate /testbench/DUT.genblk[2].AIB
add wave -noupdate /testbench/DUT.genblk[1].AIB
add wave -noupdate /testbench/DUT.genblk[0].AIB
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


