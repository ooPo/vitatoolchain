#!/bin/sh -e
# gcc.sh by Naomi Peori (naomi@peori.ca)

GCC="gcc-6.3.0"
NEWLIB="newlib"

if [ ! -d ${GCC} ]; then

  ## Download the source code.
  if [ ! -f ${GCC}.tar.bz2 ]; then wget --continue ftp://ftp.gnu.org/gnu/gcc/${GCC}/${GCC}.tar.bz2; fi

  ## Unpack the source code.
  rm -Rf ${GCC} && tar xfvj ${GCC}.tar.bz2
  rm -Rf ${NEWLIB} && git clone https://github.com/vitasdk/newlib

  ## Patch the source code.
  cat ../patches/${GCC}.patch | patch -p1 -d ${GCC}

  ## Enter the source code directory.
  cd ${GCC}

  ## Create the newlib symlinks.
  ln -s ../${NEWLIB}/newlib newlib
  ln -s ../${NEWLIB}/libgloss libgloss

  ## Download the prerequisites.
  ./contrib/download_prerequisites

  ## Leave the source code directory.
  cd ..

fi

if [ ! -d ${GCC}/build-vita ]; then

  ## Create the build directory.
  mkdir ${GCC}/build-vita

fi

## Enter the build directory.
cd ${GCC}/build-vita

## Configure the build.
../configure --prefix=${VITASDK} --target=arm-vita-eabi \
	--disable-multilib \
	--disable-nls \
	--disable-shared \
	--enable-languages="c,c++" \
	--enable-lto \
	--enable-threads \
	--with-newlib \
	--with-arch=armv7-a \
	--with-tune=cortex-a9 \
	--with-fpu=neon \
	--with-float=hard \
	--with-mode=thumb

## Compile and install.
${MAKE:-make} -j 4 all && ${MAKE:-make} install
