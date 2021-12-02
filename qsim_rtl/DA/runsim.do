##################################################
#  Modelsim do file to run simuilation
#  MS 7/2015
##################################################

vlib work 
vmap work work

# Include Netlist and Testbench
vlog +acc -incr ../../memory/sram256w20b/sram256w20b.v
vlog +acc -incr ../../rtl/DA/DA.v 
vlog +acc -incr test_DA.v 

# Run Simulator 
vsim +acc -t ps -lib work testbench 
do waveformat.do   
run -all
