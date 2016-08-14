#!/bin/sh -e
# libvita2d.sh by Naomi Peori (naomi@peori.ca)

LIBVITA2D="libvita2d"

if [ ! -d ${LIBVITA2D} ]; then

  ## Download the source code.
  git clone https://github.com/xerpi/libvita2d

fi

## Enter the build directory.
cd ${LIBVITA2D}/libvita2d

## Compile and install.
${MAKE:-make} -j4 && ${MAKE:-make} install
