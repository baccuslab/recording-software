#!/bin/bash
#
# Script to clean all components of the recording software suite.
#
# (C) 2017 Benjamin Naecker bnaecker@stanford.edu

# Specify directories, because ordering matters
declare -a DIRECTORIES=(libdatafile
	libdata-source 
	libblds-client 
	tufao 
	blds 
	meactl 
	meaview)

for DIR in "${DIRECTORIES[@]}"
do
	cd "$DIR"
	if [ "$DIR" = "tufao" ]
	then
		rm -rf build
	else
		make distclean
	fi
	cd ..
done

declare -a EXECUTABLES=(blds meaview meactl)
BINDIR="$PWD/bin"
for EXEC in "${EXECUTABLES[@]}"
do
	FILENAME="$BINDIR/$EXEC"
	echo "rm -f "$FILENAME""
	rm -f "$FILENAME"
done
