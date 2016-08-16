#!/bin/sh -e
# libelf.sh by Naomi Peori (naomi@peori.ca)

LIBELF="libelf-0.8.13"

if [ ! -d ${LIBELF} ]; then

  ## Download the source code.
  wget --continue http://www.mr511.de/software/${LIBELF}.tar.gz

  ## Unpack the source code.
  tar xfvz ${LIBELF}.tar.gz

fi

## Enter the build directory.
cd ${LIBELF}

## Configure the build.
./configure --prefix=${VITASDK}

## Compile and install.
${MAKE:-make} -j4 && ${MAKE:-make} install
