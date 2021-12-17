
.PHONY: clean run all
.SILENT: clean

run: clean
	nohup vsim -c -do "./sim/runsim.do"
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
	mkdir rom
	chmod 700 reports
	chmod 700 rom
all: clean
	make run

