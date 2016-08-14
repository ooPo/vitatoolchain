#!/bin/sh -e
# binutils.sh by Naomi Peori (naomi@peori.ca)

BINUTILS="binutils-2.27"

if [ ! -d ${BINUTILS} ]; then

  ## Download the source code.
  if [ ! -f ${BINUTILS}.tar.bz ]; then wget --continue ftp://ftp.gnu.org/gnu/binutils/${BINUTILS}.tar.bz2; fi

  ## Unpack the source code.
  tar xfvj ${BINUTILS}.tar.bz2

  ## Patch the source code.
  cat ../patches/${BINUTILS}.patch | patch -p1 -d ${BINUTILS}

fi

if [ ! -d ${BINUTILS}/build-vita ]; then

  ## Create the build directory.
  mkdir ${BINUTILS}/build-vita

fi

## Enter the build directory.
cd ${BINUTILS}/build-vita

## Configure the build.
../configure --prefix=${VITADEV} --target=arm-vita-eabi \
	--disable-multilib \
	--disable-nls \
	--disable-shared \
	--disable-werror \
	--with-arch=armv7-a \
	--with-tune=cortex-a9 \
	--with-fpu=neon \
	--with-float=hard \
	--with-mode=thumb

## Compile and install.
${MAKE:-make} -j 4 && ${MAKE:-make} install
