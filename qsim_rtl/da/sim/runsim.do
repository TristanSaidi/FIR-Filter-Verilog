
vlib work 
vmap work work

vlog +acc -incr ../../memory/sram256w20b/sram256w20b.v
vlog +acc -incr ../../rtl/da/da.v
vlog -svext +acc -incr ./tb_da.sv

vsim -c -t ps -lib work testbench
onerror {resume}
onfinish {exit}
run -all

