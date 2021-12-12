
set clk_period 520
set clk_uncertainty 0.010
set clk_transition 0.010
set typical_input_delay 0.05
set typical_output_delay 0.05
set typical_wire_load 0.005

create_clock -name "clk" -period 99840 [get_ports "clk"]
set_drive 0 [get_clocks "clk"]
create_clock -name "clk2" -period 520 [get_ports "clk2"]
set_drive 0 [get_clocks "clk2"]

set_clock_uncertainty $clk_uncertainty [all_clocks]
set_clock_transition $clk_transition [all_clocks]
set_fix_hold [all_clocks]
set_dont_touch_network "clk"
set_dont_touch_network "clk2"
set_ideal_network "clk"
set_ideal_network "clk2"

set_driving_cell -lib_cell INVX1TS [all_inputs]
set_input_delay $typical_input_delay [all_inputs] -clock "clk"
remove_input_delay -clock "clk" [find port "clk2"]
remove_input_delay -clock "clk2" [find port "clk"]
set_output_delay $typical_output_delay [all_outputs] -clock "clk"

set_load 0.05 [all_outputs] 

