
.PHONY: clean run all
.SILENT: clean

run: clean
	vsim -c -do "./sim/runsim.do"
wave: 
	vsim -do "./sim/wavesim.do"
clean:
	rm -rf work modelsim.ini
	rm -rf *.log *.syn *.rpt *.mr *.nl.v *.sdf *.svf *.vcd transcript *.wlf
	rm -rf *.result
	rm -f error* output*
	rm -rf reports
	mkdir reports
	chmod 700 reports
all: clean
	make run

