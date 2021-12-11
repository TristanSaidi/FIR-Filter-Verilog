#!/bin/bash

NAME="da"
TDIR="../../syn/${NAME}"

make clean
rm -rf $TDIR
mkdir $TDIR
chmod 700 $TDIR
mkdir reports
mkdir ./reports/tt
chmod 700 reports
mkdir misc
chmod 700 misc
dc_shell -64 -f ${NAME}.tcl | tee log
chmod 600 ./reports/tt/*
chmod 600 ./reports/*.rpt
mv *.log ./misc/
mv *.svf ./misc/
mv log ./misc/
chmod 600 ./misc/*
cp "./reports/${NAME}.nl.v" $TDIR
cp "./reports/tt/${NAME}.syn.sdf" $TDIR
cp "./reports/tt/${NAME}.syn.sdc" $TDIR
cp "./reports/tt/${NAME}.dc.rpt" $TDIR
cp "./misc/log" $TDIR

exit

