
.PHONY: run clean all
.SILENT: clean

run: clean
	pt_shell -file fir_filter.tcl | tee fir_filter.log
clean:
	rm -rf *.log
	rm -rf *.rpt
	rm -rf *.sdf
	rm -f *.report*
	rm -rf *.fsdb	
	rm -f primetime_px*
all:
	make clean
	make run

