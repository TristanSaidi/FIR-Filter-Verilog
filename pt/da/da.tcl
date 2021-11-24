
set sh_enable_page_mode true
set power_enable_analysis true

set SIG_FIGS 6

##################################################
# Set files and paths
##################################################

set top_level da
set search_path "/courses/ee6321/share/ibm13rflpvt/synopsys/ ../../memory/sram256w20b/"
set link_path "* scx3_cmos8rf_lpvt_tt_1p2v_25c.db sram256w20b_tt_1p2v_25c_syn.db"
read_db "scx3_cmos8rf_lpvt_tt_1p2v_25c.db"
read_db "sram256w20b_tt_1p2v_25c_syn.db"
set verilog_files {../../dc/da/reports/da.nl.v}
read_verilog $verilog_files
link_design -keep_sub_designs $top_level

source ./timing.tcl

set rpt_file "${top_level}.pt.rpt"
check_timing

report_design >> ${rpt_file}
report_reference >> ${rpt_file}
report_constraint >> ${rpt_file}
report_constraint -all_violators -significant_digits ${SIG_FIGS} >> ${top_level}.constraints.report
report_timing -significant_digits ${SIG_FIGS} -delay_type min_max >> ${rpt_file}

set power_analysis_mode "time_based"
read_vcd "../../qsim_dc/${top_level}/${top_level}.vcd" -strip_path "testbench/DUT"
report_switching_activity >> ${rpt_file}
report_switching_activity -list_not_annotated >> ${rpt_file}
update_power
report_power >> ${rpt_file}
report_power -hierarchy -verbose >> ${rpt_file}

write_sdf -context verilog "./${top_level}.pt.sdf"
quit
