
###############################################################################
# Evaluate Design Across Multiple Corners
###############################################################################

set maxpaths 20
set run_rpt "./reports/${top_level}.run.rpt"
set design_rpt "${top_level}.dc.rpt"
set area_rpt "${top_level}.area.rpt"
set power_rpt "${top_level}.power.rpt"
set timing_rpt "${top_level}.timing.rpt"
set reg_rpt "${top_level}.reg.rpt"
set violations_rpt "${top_level}.viol.rpt"
set tt "./reports/tt"
set sdf "${top_level}.syn.sdf"
set sdc "${top_level}.syn.sdc"


###############################################################################
# Typical-Typical Corner
###############################################################################

set_operating_conditions tt_1p2v_25c -lib scx3_cmos8rf_lpvt_tt_1p2v_25c

report_area > "${run_rpt}"
report_compile_options >> "${run_rpt}"
report_design >> "${run_rpt}"

report_power -hier -analysis_effort high > "${tt}/${power_rpt}"

report_design > "${tt}/${design_rpt}"
report_cell >> "${tt}/${design_rpt}"
report_port -verbose >> "${tt}/${design_rpt}"
report_lib tt_1p2v_25c >> "${tt}/${design_rpt}"

report_timing -path full -delay max -max_paths $maxpaths -nworst 10 > "${tt}/${timing_rpt}"
report_timing_requirements >> "${tt}/${timing_rpt}"

report_constraints -all_violators > "./reports/${violations_rpt}"

report_timing -delay max -nworst 1 -max_paths 100 -path end -nosplit -unique -sort_by slack > "${tt}/${reg_rpt}"
report_timing -delay max -nworst 1 -max_paths 100 -path full -nosplit -unique -sort_by slack >> "${tt}/${reg_rpt}"
report_timing -delay max -nworst 1 -max_paths 100 -path end -nosplit -unique -sort_by slack -to [all_outputs] >> "${tt}/${reg_rpt}"
report_timing -delay max -nworst 1 -max_paths 100 -path end -nosplit -unique -sort_by slack -to [all_registers -data_pins] >> "${tt}/${reg_rpt}"
report_timing -delay min -nworst 1 -max_paths 100 -path short -nosplit -unique -sort_by slack >> "${tt}/${reg_rpt}"

write_sdf "${tt}/${sdf}"
write_sdc "${tt}/${sdc}" -version 1.7

