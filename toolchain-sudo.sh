#!/bin/sh
# toolchain-sudo.sh by Naomi Peori (naomi@peori.ca)

## Enter the toolchain directory.
cd "`dirname $0`" || { echo "ERROR: Could not enter the toolchain directory."; exit 1; }

## Set up the environment.
export VITASDK=/usr/local/vitasdk

## Set up the path.
export PATH=$PATH:$VITASDK/bin

## Run the toolchain script.
./toolchain.sh $@ || { echo "ERROR: Could not run the toolchain script."; exit 1; }
