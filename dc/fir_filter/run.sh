#!/bin/bash

make clean
mkdir reports
mkdir ./reports/tt
chmod 700 reports
chmod 700 ./reports/*
mkdir misc
chmod 700 misc
dc_shell -64 -f fir_filter.tcl | tee log
chmod 600 ./reports/tt/*
chmod 600 ./reports/*.rpt
mv *.log ./misc/
mv *.svf ./misc/
mv log ./misc/
chmod 600 ./misc/*
exit

