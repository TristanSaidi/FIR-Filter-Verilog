
set DC_PATH	"../../dc"
set RTL_PATH 	"../../rtl"
set top_level	sram_8blk
source -verbose "./common.tcl"
read_verilog {"${RTL_PATH}/sram/${top_level}.v"}
list_designs
if { [check_error -v] == 1 } { exit 1 }
current_design ${top_level}
link

