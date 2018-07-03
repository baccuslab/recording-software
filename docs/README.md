Recording software documentation
--------------------------------

This folder contains several documents which describe the implementation
details of some of the recording software components. The intended goal
is to describe how to *extend* the software in various ways. It contains
the following documents:

- `adding-data-sources`: This document details the data source library,
`libdata-source`, and describes how to add functionality to handle
new array systems when they're added to the lab.
- `closed-loop`: This document describes how to write a "closed loop" experiment
in the HiDens system, an experiment in which data is collected, some chip
configuration is chosen and set, and then new data is collected.
- `extending-oatool`: Describes the details of the online analysis toolkit,
espcially how to add new, custom online analysis methods to the existing
toolkit.
