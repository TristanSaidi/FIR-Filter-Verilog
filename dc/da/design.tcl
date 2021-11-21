
set DC_PATH	"../../dc"
set RTL_PATH 	"../../rtl"
set top_level	da
source -verbose "./common.tcl"
check_design_allow_non_tri_drivers_on_tri_bus true
read_verilog {"${RTL_PATH}/${top_level}/${top_level}.v"}
list_designs
if { [check_error -v] == 1 } { exit 1 }
current_design ${top_level}
link

