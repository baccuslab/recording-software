#!/bin/bash
#
# Make all components of the recording-software suite
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
	# Move to submodule directory
	cd "$DIR"

	# Tufao uses CMake as its build system
	if [ "$DIR" = "tufao" ]
	then

		# Make build directory if not there
		mkdir -p build

		# Homebrew's installation of Qt5 is a bit wonky,
		# and doesn't interact well with CMake. This is 
		# a hacky fix suggested on the Homebrew Qt issues
		# page, which seems to work. The user's actual PATH
		# is not affected, this is only added when CMake is run.
		EXTRA_PATH=""
		if [ -d "/usr/local/opt/qt5/bin" ]
		then
			EXTRA_PATH="/usr/local/opt/qt5/bin"
		fi
		echo $EXTRA_PATH
		cd build && PATH="$EXTRA_PATH:$PATH" cmake .. && make -j4
		cd ..
	else

		# Other components are just straight Qt builds
		qmake && make -j release
	fi

	# Move back to main super-repo folder
	cd ..

done

# Link executables, always overwriting them
declare -a EXECUTABLES=(blds meactl meaview)
for EXEC in "${EXECUTABLES[@]}"
do
	TARGET="$PWD/$EXEC/$EXEC"
	LINKNAME="$PWD/bin"
	echo "ln -sf "$TARGET" "$LINKNAME""
	ln -sf "$TARGET" "$LINKNAME"
done

