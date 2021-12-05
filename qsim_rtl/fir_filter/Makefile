
.PHONY: clean run all
.SILENT: clean

run: clean
	vsim -c -do "./sim/runsim.do"
	python outputs.rpt outputs.rpt
wave: clean
	vsim -do "./sim/wavesim.do"
	python outputs.rpt outputs.rpt
clean:
	rm -rf work modelsim.ini
	rm -f vish*
	rm -rf *.log *.syn *.rpt *.mr *.nl.v *.sdf *.svf *.vcd transcript *.wlf
	rm -rf *.result
	rm -f error* output* reads writes
	rm -rf rom
	rm -rf reports
	mkdir reports
	chmod 700 reports
all: clean
	make run

