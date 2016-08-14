#!/bin/sh -e
# vita-toolchain.sh by Naomi Peori (naomi@peori.ca)

VITA_TOOLCHAIN="vita-toolchain"

if [ ! -d ${VITA_TOOLCHAIN} ]; then

  ## Download the source code.
  git clone https://github.com/vitasdk/vita-toolchain

fi

## Enter the build directory.
cd ${VITA_TOOLCHAIN}

## Configure the build.
cmake -DUSE_BUNDLED_ENDIAN_H=ON -DCMAKE_INSTALL_PREFIX=${VITADEV} -DDEFAULT_JSON=../share/db.json -Dlibelf_LIBRARY=${VITADEV}/lib/libelf.a -Dlibelf_INCLUDE_DIR=${VITADEV}/include

## Compile and install.
${MAKE:-make} -j4 && ${MAKE:-make} install
