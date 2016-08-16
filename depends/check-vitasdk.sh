#!/bin/sh
# check-vitasdk.sh by Naomi Peori (naomi@peori.ca)

## Check if $VITASDK is set.
if test ! $VITASDK; then { echo "ERROR: Set \$VITASDK before continuing."; exit 1; } fi

## Check for the $VITASDK directory.
( ls -ld $VITASDK || mkdir -p $VITASDK ) 1>/dev/null 2>&1 || { echo "ERROR: Create $VITASDK before continuing."; exit 1; }

## Check for write permission.
touch $VITASDK/test.tmp 1>/dev/null 2>&1 || { echo "ERROR: Grant write permissions for $VITASDK before continuing."; exit 1; }

## Check for $VITASDK/bin in the path.
echo $PATH | grep $VITASDK/bin 1>/dev/null 2>&1 || { echo "ERROR: Add $VITASDK/bin to your path before continuing."; exit 1; }
