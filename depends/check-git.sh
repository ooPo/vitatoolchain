#!/bin/sh
# check-git.sh by Naomi Peori (naomi@peori.ca)

## Check for git.
git --version 1>/dev/null 2>&1 || { echo "ERROR: Install git before continuing."; exit 1; }
