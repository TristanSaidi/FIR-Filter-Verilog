onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/CLOAD
add wave -noupdate /testbench/valid_in
add wave -noupdate /testbench/done
add wave -noupdate -radix unsigned /testbench/CADDR
add wave -noupdate /testbench/DUT.load_zreg
add wave -noupdate -radix unsigned /testbench/A7
add wave -noupdate -radix unsigned /testbench/A6
add wave -noupdate -radix unsigned /testbench/A5
add wave -noupdate -radix unsigned /testbench/A4
add wave -noupdate -radix unsigned /testbench/A3
add wave -noupdate -radix unsigned /testbench/A2
add wave -noupdate -radix unsigned /testbench/A1
add wave -noupdate -radix unsigned /testbench/A0
add wave -noupdate -radix decimal /testbench/DUT.ROM_BANK.Q7
add wave -noupdate -radix decimal /testbench/DUT.ROM_BANK.Q6
add wave -noupdate -radix decimal /testbench/DUT.ROM_BANK.Q5
add wave -noupdate -radix decimal /testbench/DUT.ROM_BANK.Q4
add wave -noupdate -radix decimal /testbench/DUT.ROM_BANK.Q3
add wave -noupdate -radix decimal /testbench/DUT.ROM_BANK.Q2
add wave -noupdate -radix decimal /testbench/DUT.ROM_BANK.Q1
add wave -noupdate -radix decimal /testbench/DUT.ROM_BANK.Q0
add wave -noupdate /testbench/DUT.CEN
add wave -noupdate /testbench/DUT.WEN
add wave -noupdate /testbench/DUT.ROM_BANK.CENI
add wave -noupdate /testbench/DUT.ROM_BANK.WENI
add wave -noupdate /testbench/DUT.ROM_BANK.genblk1[7].WENIB
add wave -noupdate /testbench/DUT.ROM_BANK.genblk1[6].WENIB
add wave -noupdate /testbench/DUT.ROM_BANK.genblk1[5].WENIB
add wave -noupdate /testbench/DUT.ROM_BANK.genblk1[4].WENIB
add wave -noupdate /testbench/DUT.ROM_BANK.genblk1[3].WENIB
add wave -noupdate /testbench/DUT.ROM_BANK.genblk1[2].WENIB
add wave -noupdate /testbench/DUT.ROM_BANK.genblk1[1].WENIB
add wave -noupdate /testbench/DUT.ROM_BANK.genblk1[0].WENIB
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.DI
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.CADDRI
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.AI[7]
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.AI[6]
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.AI[5]
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.AI[4]
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.AI[3]
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.AI[2]
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.AI[1]
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.AI[0]
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.genblk1[7].AIB
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.genblk1[6].AIB
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.genblk1[5].AIB
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.genblk1[4].AIB
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.genblk1[3].AIB
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.genblk1[2].AIB
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.genblk1[1].AIB
add wave -noupdate -radix unsigned /testbench/DUT.ROM_BANK.genblk1[0].AIB
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


