
vlib work 
vmap work work

vlog +acc -incr ../../memory/sram256w20b/sram256w20b.v
vlog +acc -incr ../../rtl/da/da.v
vlog -svext +acc -incr ./tb_da.v

vsim -t ps -lib work testbench
do "waveformat.do"
run -all

