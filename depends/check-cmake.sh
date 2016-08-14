#!/bin/sh
# check-cmake.sh by Naomi Peori (naomi@peori.ca)

## Check for cmake.
cmake --version 1>/dev/null 2>&1 || { echo "ERROR: Install cmake before continuing."; exit 1; }
