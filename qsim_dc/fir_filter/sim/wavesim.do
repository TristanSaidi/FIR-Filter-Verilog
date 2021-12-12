
vlib work 
vmap work work

vlog +acc -incr /courses/ee6321/share/ibm13rflpvt/verilog/ibm13rflpvt_neg.v
vlog +acc -incr ../../rtl/fir_filter/fir_filter.v
vlog +acc -incr ../../rtl/Control/Control.v
vlog +acc -incr ../../rtl/da/da.v
vlog +acc -incr ../../syn/FIFO_system/FIFO_system.nl.v
vlog +acc -incr ../../memory/sram256w20b/sram256w20b.v
vlog +acc -incr ./tb_fir_filter.v

vsim +profile -t ps -lib work testbench
set WLFUseThreads
do "waveformat.do"
run -all

