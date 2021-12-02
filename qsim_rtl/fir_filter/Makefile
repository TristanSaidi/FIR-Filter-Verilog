
.PHONY: clean run all
.SILENT: clean

run: clean
	python ex.py
	vsim -c -do "./sim/runsim.do"
wave: clean
	vsim -do "./sim/wavesim.do"
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

