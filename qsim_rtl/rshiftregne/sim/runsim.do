
vlib work 
vmap work work

vlog +acc -incr ../../rtl/da/rshiftregne.v
vlog +acc -incr ./tb_rshiftregne.v

vsim -c -t ps -lib work testbench
onerror {resume}
onfinish {exit}
run -all

