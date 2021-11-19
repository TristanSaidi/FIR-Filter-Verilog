##################################################
#  Modelsim do file to run simuilation
#  MS 7/2015
##################################################

#Setup
 vlib work 
 vmap work work

#Include Netlist and Testbench
 vlog +acc -incr /courses/ee6321/share/ibm13rflpvt/verilog/ibm13rflpvt.v
 vlog +acc -incr ../../dc/FIFO/FIFO.nl.v
 vlog +acc -incr test_FIFO.v 

#Run Simulator 
#SDF from DC is annotated for the timing check 
vsim -voptargs=+acc -t ps -lib work -sdftyp FIFO=../../dc/FIFO/FIFO.syn.sdf testbench 
 do waveformat.do   
 run -all
