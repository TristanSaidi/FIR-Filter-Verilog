
.PHONY: clean run all
.SILENT: clean

INPUT_FILE="./reports/input.rpt"
OUTPUT_FILE="./reports/output.rpt"
ERROR_FILE="./reports/error.rpt"
SCRIPT_PATH="./scripts/da.py"
ROM_PATH="./rom/"

run: clean
	vsim -c -do "./sim/runsim.do"
wave: clean
	vsim -do "./sim/wavesim.do"
pyy:
	python ${SCRIPT_PATH} ${ROM_PATH} ${INPUT_FILE} ${OUTPUT_FILE} ${ERROR_FILE}
clean:
	rm -rf work modelsim.ini
	rm -rf *.log *.syn *.rpt *.mr *.nl.v *.sdf *.svf *.vcd transcript *.wlf
	rm -rf *.result
	rm -f error* output*
	rm -rf rom
	mkdir rom
	chmod 700 rom
	rm -rf reports
	mkdir reports
	chmod 700 reports
all: clean
	make run

