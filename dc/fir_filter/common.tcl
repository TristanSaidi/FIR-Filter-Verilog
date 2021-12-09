
set search_path [list "." "/courses/ee6321/share/ibm13rflpvt/synopsys/" "../../memory/sram256w20b/"]

set synthetic_library [list "dw_foundation.sldb"]

set link_library [list "*" \
                        "scx3_cmos8rf_lpvt_tt_1p2v_25c.db" 	\
			"sram256w20b_tt_1p2v_25c_syn.db"	\
                        "dw_foundation.sldb"]

set target_library [list "scx3_cmos8rf_lpvt_tt_1p2v_25c.db" 	\
				"sram256w20b_tt_1p2v_25c_syn.db"]

