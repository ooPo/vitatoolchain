#!/bin/sh -e
# vdpm.sh by Naomi Peori (naomi@peori.ca)

VDPM="vdpm"

if [ ! -d ${VDPM} ]; then

  ## Download the source code.
  git clone https://github.com/vitasdk/vdpm

fi

## Enter the build directory.
cd ${VDPM}

## Compile and install.
./install-all.sh
