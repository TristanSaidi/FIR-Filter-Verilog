#!/bin/bash

NAME="FIFO_system"
TDIR="../../syn/$NAME"

sh nuke.sh
dc_shell -64 -f ${NAME}.tcl | tee ${NAME}.log
rm -rf $TDIR
mkdir -p $TDIR
chmod 700 $TDIR
cp ${NAME}.nl.v		$TDIR
cp ${NAME}.syn.sdf	$TDIR
cp ${NAME}.syn.sdc	$TDIR
cp ${NAME}.dc.rpt	$TDIR
cp ${NAME}.log		$TDIR
