
.PHONY: clean run all
.SILENT: clean

run: clean
	vsim -c -do "./sim/runsim.do"
wave: clean
	vsim -do "./sim/wavesim.do"
clean:
	rm -rf work modelsim.ini
	rm -rf *.log *.syn *.rpt *.mr *.nl.v *.sdf *.svf *.vcd transcript *.wlf
	rm -rf *.result
	rm -f error* output*
all: clean
	make run

