
vlib work 
vmap work work

vlog +acc -incr /courses/ee6321/share/ibm13rflpvt/verilog/ibm13rflpvt_neg.v
vlog +acc -incr ../../dc/da/reports/da.nl.v
vlog +acc -incr ../../memory/sram256w20b/sram256w20b.v
vlog +acc -incr ./tb_da.v

vsim -c -t ps -lib work testbench
vsim -voptargs=+acc -t ps -lib work -sdftyp da=../../dc/da/da.syn.sdf testbench 
onerror {resume}
onfinish {exit}
run -all

