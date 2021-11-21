
set sh_enable_page_mode true
set power_enable_analysis true

##################################################
# Set files and paths
##################################################

set top_level sram_8blk
set search_path "/courses/ee6321/share/ibm13rflpvt/synopsys/ ../../memory/sram256w20b/"
set link_path "* scx3_cmos8rf_lpvt_tt_1p2v_25c.db sram256w20b_tt_1p2v_25c_syn.db"
read_db "scx3_cmos8rf_lpvt_tt_1p2v_25c.db"
read_db "sram256w20b_tt_1p2v_25c_syn.db"
set verilog_files {../../dc/sram/reports/sram_8blk.nl.v}
read_verilog $verilog_files
link_design -keep_sub_designs $top_level

source ./timing.tcl

set rpt_file "${top_level}.pt.rpt"
check_timing

report_design >> ${rpt_file}
report_reference >> ${rpt_file}
report_constraint >> ${rpt_file}
report_constraint -all_violators -significant_digits 6 >> ${top_level}.constraints.report
report_timing -significant_digits 6 -delay_type min_max >> ${rpt_file}

set power_analysis_mode "time_based"
read_vcd "../../qsim_dc/sram/sram_8blk.vcd" -strip_path "testbench/DUT"
report_switching_activity >> ${rpt_file}
report_switching_activity -list_not_annotated >> ${rpt_file}
update_power
report_power >> ${rpt_file}
report_power -hierarchy -verbose >> ${rpt_file}

write_sdf -context verilog "./sram_8blk.pt.sdf"
quit
