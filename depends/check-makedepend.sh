#!/bin/sh
# check-makedepend.sh by Naomi Peori (naomi@peori.ca)

## Check for makedepend.
( ls /usr/bin/makedepend || ls /usr/local/bin/makedepend ) 1>/dev/null 2>&1 || { echo "ERROR: Install makedepend before continuing."; exit 1; }
