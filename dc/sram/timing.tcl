
# TCL script of timing setup for synthesis

# Time unit: 1ns (in the IBM power-delivery library)
# Capacitance unit: 1pF (in the IBM power-delivery library)

set clk_period 20.00
set clk_uncertainty 0.01
set clk_transition 0.01
set clk_name "clk"
set clk_port "clk"
set typical_input_delay 0.1
set typical_output_delay 0.1
set typical_wire_load 0.005

create_clock "clk" -name "clk" -period $clk_period -waveform {0 10}

set_drive 0 [get_clocks $clk_name] 

set_clock_uncertainty $clk_uncertainty [get_clocks $clk_name]
set_clock_transition $clk_transition [get_clocks $clk_name]

set_fix_hold [all_clocks]

set_driving_cell -lib_cell INVX1TS [all_inputs]
set_input_delay $typical_input_delay [all_inputs] -clock "clk"
remove_input_delay -clock "clk" [find port "clk"]
set_output_delay $typical_output_delay [all_outputs] -clock "clk"
set_load 0.005 [all_outputs] 

