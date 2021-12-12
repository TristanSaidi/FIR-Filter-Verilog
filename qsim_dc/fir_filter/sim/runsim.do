
vlib work 
vmap work work

vlog +acc -incr /courses/ee6321/share/ibm13rflpvt/verilog/ibm13rflpvt_neg.v
vlog +acc -incr ../../syn/fir_filter/fir_filter.nl.v
vlog +acc -incr ../../memory/sram256w20b/sram256w20b.v
vlog +acc -incr ./tb_fir_filter.v

vsim +profile -c -t ps -lib work testbench
set WLFUseThreads
onerror {resume}
onfinish {exit}
run -all

