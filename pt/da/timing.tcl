# TCL script of timing setup for synthesis

# Time unit: 1ns (in the IBM power-delivery library)
# Capacitance unit: 1pF (in the IBM power-delivery library)

##################################################
# Define the clock timing
################################################## 

set clk_name "clk"
set clk_port "clk"
set clk_period 20.0
set clk_uncertainty 0.01
set clk_transition 0.01
set typical_input_delay 0.1
set typical_output_delay 0.1
set typical_wire_load 0.005

create_clock -name "clk" -period $clk_period [get_ports "clk"]
set_drive 0 $clk_port

set_clock_uncertainty $clk_uncertainty [get_clocks $clk_name]
set_clock_transition $clk_transition [get_clocks $clk_name]
set_output_delay $typical_output_delay [all_outputs] -clock "clk"
set_load 0.005 [all_outputs] 
set_input_delay $typical_input_delay [all_inputs] -clock "clk"
set_driving_cell -lib_cell INVX1TS [all_inputs]
remove_input_delay -clock "clk" [find port $clk_port]

