# `recording-software`

Super-repository for the Baccus lab recording software suite.

## Overview

The recording software pipeline the Baccus lab consists of a set of
libraries and applications stored across several Git repositories. All
of these components are needed in order to fully record data in the lab.
This repository provides all these components as "submodules", a Git
concept that allows storing sub-repositories easily. Users requiring
all the recording software (rather than a single component), can easily
download and build it all by simply using this repo, rather than getting
and compiling each component separately.

## Building the software

To download this repository:

	$ git clone https://github.com/baccuslab/recording-software.git

This will download the main super-module, but the actual code inside
the submodules will not yet be available. To get that code, run:
	
	$ cd recording-software
	$ git submodule update --init --recursive

This will download the actual code, so you should see lots of Git output.
The code can then be built by simply running the script:

	$ ./build-all.sh

This will build each component in turn. Note that the repositories are
dependent on one another (the shared libraries), so they must be built
in a particular order. The script knows how to do this.

## Updating

The submodules are supposed to track the master branch of their respective
repositories. If those change, run:

	$ git submodule update --remote --recursive
	$ ./build-all.sh

## Submodules

### `libdatafile`

A shared library which provides a C++ interface to the HDF5 files storing
recorded data.

### BLDS

The Baccus Lab Data Server. This manages a source of data (such as an MEA
or previously-recorded file) on behalf of remote clients, and sends them
data when requested.

### `libdata-source`

A shared library for interacting with data sources (MEAs or files). This 
is used by the BLDS.

### `libblds-client`

C++ (Qt) and Python libraries for interacting with the BLDS as a client,
and manipulating the managed data source.

### `meactl`

A graphical application for managing and controlling a data source and
a recording from it.

### `meaview`

A graphical application for real-time display of data from a data source.

### Tufao

This is a third-party Qt-based HTTP server, which is used by the BLDS.

