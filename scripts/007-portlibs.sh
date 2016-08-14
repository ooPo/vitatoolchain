#!/bin/sh -e
# vita-portlibs.sh by Naomi Peori (naomi@peori.ca)

VITA_PORTLIBS="vita_portlibs"

if [ ! -d ${VITA_PORTLIBS} ]; then

  ## Download the source code.
  git clone https://github.com/xerpi/vita_portlibs

fi

## Enter the build directory.
cd ${VITA_PORTLIBS}

## Compile and install.
${MAKE:-make}
