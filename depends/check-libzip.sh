#!/bin/sh
# check-libzip.sh by Naomi Peori (naomi@peori.ca)

## Check for libzip.
(ls /usr/include/zip.h || ls /opt/local/include/zip.h) 1>/dev/null 2>&1 || { echo "ERROR: Install libzip before continuing."; exit 1; }
