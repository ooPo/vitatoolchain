#!/bin/sh
# check-vitadev.sh by Naomi Peori (naomi@peori.ca)

## Check if $VITADEV is set.
if test ! $VITADEV; then { echo "ERROR: Set \$VITADEV before continuing."; exit 1; } fi

## Check if $VITASDK is set.
if test ! $VITASDK; then { echo "ERROR: Set \$VITASDK before continuing."; exit 1; } fi

## Check for the $VITADEV directory.
( ls -ld $VITADEV || mkdir -p $VITADEV ) 1>/dev/null 2>&1 || { echo "ERROR: Create $VITADEV before continuing."; exit 1; }

## Check for write permission.
touch $VITADEV/test.tmp 1>/dev/null 2>&1 || { echo "ERROR: Grant write permissions for $VITADEV before continuing."; exit 1; }

## Check for $VITADEV/bin in the path.
echo $PATH | grep $VITADEV/bin 1>/dev/null 2>&1 || { echo "ERROR: Add $VITADEV/bin to your path before continuing."; exit 1; }
