##################################################
#  Modelsim do file to run simuilation
#  MS 7/2015
##################################################

#Setup
 vlib work 
 vmap work work

#Include Netlist and Testbench
 vlog +acc -incr /courses/ee6321/share/ibm13rflpvt/verilog/ibm13rflpvt.v
 vlog +acc -incr ../../syn/FIFO_system/FIFO_system.nl.v
 vlog +acc -incr test_FIFO_system.v 

#Run Simulator 
#SDF from DC is annotated for the timing check 
vsim -voptargs=+acc -t ps -lib work -sdftyp FIFO_system=../../syn/FIFO_system/FIFO_system.syn.sdf testbench 
do "waveformat.do"
run -all
