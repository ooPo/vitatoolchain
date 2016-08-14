#!/bin/sh -e
# gdb.sh by Naomi Peori (naomi@peori.ca)

GDB="gdb-7.9.1"

if [ ! -d ${GDB} ]; then

  ## Download the source code.
  if [ ! -f ${GDB}.tar.gz ]; then wget --continue ftp://ftp.gnu.org/gnu/gdb/${GDB}.tar.gz; fi

  ## Unpack the source code.
  tar xfvz ${GDB}.tar.gz

fi

if [ ! -d ${GDB}/build-vita ]; then

  ## Create the build directory.
  mkdir ${GDB}/build-vita

fi

## Enter the build directory.
cd ${GDB}/build-vita

## Configure the build.
../configure --prefix=${VITADEV} --target=arm-vita-eabi \
	--disable-multilib \
	--disable-nls \
	--disable-sim \
	--disable-werror

## Compile and install.
${MAKE:-make} -j 4 && ${MAKE:-make} install
