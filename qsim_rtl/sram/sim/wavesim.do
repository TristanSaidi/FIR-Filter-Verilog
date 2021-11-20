
vlib work 
vmap work work

vlog +acc -incr ../../rtl/sram/sram_8blk.v
vlog +acc -incr ../../memory/rf1shd/bin/sram512w32b/sram512w32b.v
vlog +acc -incr ./tb_sram.v

vsim -t ps -lib work testbench
do "waveformat.do"
run -all

