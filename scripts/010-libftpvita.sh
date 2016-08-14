#!/bin/sh -e
# libftpvita.sh by Naomi Peori (naomi@peori.ca)

LIBFTPVITA="libftpvita"

if [ ! -d ${LIBFTPVITA} ]; then

  ## Download the source code.
  git clone https://github.com/xerpi/libftpvita

fi

## Enter the build directory.
cd ${LIBFTPVITA}/libftpvita

## Compile and install.
${MAKE:-make} -j4 && ${MAKE:-make} install
