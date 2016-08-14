#!/bin/sh -e
# vita-headers.sh by Naomi Peori (naomi@peori.ca)

VITA_HEADERS="vita-headers"

if [ ! -d ${VITA_HEADERS} ]; then

  ## Download the source code.
  git clone https://github.com/vitasdk/vita-headers

fi

## Enter the build directory.
cd ${VITA_HEADERS}

## Configure the build.
vita-libs-gen db.json .

## Compile.
${MAKE:-make} -j4

## Install.
cp *.a ${VITADEV}/arm-vita-eabi/lib/
cp -r include ${VITADEV}/arm-vita-eabi/
mkdir -p ${VITADEV}/share && cp db.json ${VITADEV}/share
