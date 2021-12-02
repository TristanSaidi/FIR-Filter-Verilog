##################################################
#  Modelsim do file to run simuilation
#  MS 7/2015
##################################################

vlib work 
vmap work work

# Include Netlist and Testbench
vlog +acc -incr ../../rtl/FIFO_system/FIFO_system.v 
vlog +acc -incr tb_FIFO_system.v 

# Run Simulator 
vsim +acc -c -t ps -lib work testbench 
run -all

