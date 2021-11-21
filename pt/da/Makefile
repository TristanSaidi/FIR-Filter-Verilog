
.PHONY: run clean all
.SILENT: clean

run:
	pt_shell -file da.tcl | tee da.log
clean:
	rm -rf *.log
	rm -rf *.rpt
	rm -rf *.sdf
	rm -f *.report*
	rm -rf *.fsdb	
all:
	make clean
	make run

