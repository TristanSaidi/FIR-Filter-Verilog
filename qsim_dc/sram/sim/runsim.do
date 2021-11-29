
vlib work 
vmap work work

vlog +acc -incr /courses/ee6321/share/ibm13rflpvt/verilog/ibm13rflpvt_neg.v
vlog +acc -incr ../../dc/sram/reports/sram.nl.v
vlog +acc -incr ../../memory/sram256w20b/sram256w20b.v
vlog +acc -incr ./tb_sram.v

vsim -c -t ps -lib work testbench
onerror {resume}
onfinish {exit}
run -all

