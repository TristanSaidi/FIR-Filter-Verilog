
vlib work 
vmap work work

vlog +acc -incr ../../rtl/da/rshiftregne.v
vlog +acc -incr ./tb_rshiftregne.v

vsim -t ps -lib work testbench
do "waveformat.do"
run -all

