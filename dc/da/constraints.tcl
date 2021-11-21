
##################################################
# Define Design Rule Constraints
##################################################

set_max_fanout 4 ${top_level}
set_max_fanout 4 [all_inputs]

set_max_capacitance 0.005 [all_inputs]

check_design



