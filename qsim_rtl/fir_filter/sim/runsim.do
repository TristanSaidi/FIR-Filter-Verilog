
vlib work 
vmap work work

vlog +acc -incr ../../rtl/fir_filter/fir_filter.v
vlog +acc -incr ../../memory/sram256w20b/sram256w20b.v
vlog +acc -incr ./tb_fir_filter.v

vsim -c -t ps -lib work testbench
onerror {resume}
onfinish {exit}
run -all

