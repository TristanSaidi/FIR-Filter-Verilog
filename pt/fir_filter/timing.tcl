
set clk_period 520
set clk_uncertainty 0.010
set clk_transition 0.010
set typical_input_delay 0.05
set typical_output_delay 0.05
set typical_wire_load 0.005

create_clock -name "clk_slow" -period 99840 [get_ports "clk_slow"]
set_drive 0 [get_ports "clk_slow"]
create_clock -name "clk_fast" -period 520 [get_ports "clk_fast"]
set_drive 0 [get_ports "clk_fast"]

set_clock_uncertainty $clk_uncertainty [get_clocks "clk_slow"]
set_clock_uncertainty $clk_uncertainty [get_clocks "clk_fast"]
set_clock_transition $clk_transition [get_clocks "clk_slow"]
set_clock_transition $clk_transition [get_clocks "clk_fast"]

set_driving_cell -lib_cell INVX1TS [all_inputs]
set_input_delay $typical_input_delay [all_inputs] -clock "clk_slow"
remove_input_delay -clock "clk_slow" [find port "clk_fast"]
remove_input_delay -clock "clk_fast" [find port "clk_slow"]
set_output_delay $typical_output_delay [all_outputs] -clock "clk_slow"
set_load 0.05 [all_outputs] 

