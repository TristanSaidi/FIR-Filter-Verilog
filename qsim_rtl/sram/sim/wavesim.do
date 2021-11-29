
vlib work 
vmap work work

vlog +acc -incr ../../rtl/sram/sram.v
vlog +acc -incr ../../memory/sram256w20b/sram256w20b.v
vlog +acc -incr ./tb_sram.v

vsim -t ps -lib work testbench
do "waveformat.do"
run -all

