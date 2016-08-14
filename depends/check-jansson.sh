#!/bin/sh
# check-jansson.sh by Naomi Peori (naomi@peori.ca)

## Check for jansson.
ls /usr/include/jansson.h 1>/dev/null 2>&1 || { echo "ERROR: Install jansson before continuing."; exit 1; }
