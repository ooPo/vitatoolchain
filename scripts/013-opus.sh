#!/bin/sh -e
# opus.sh by Sunguk Lee (d3m3vilurr@gmail.com)

OPUS="opus"

if [ ! -d ${OPUS} ]; then

  ## Download the source code.
  git clone https://github.com/xiph/opus.git ${OPUS}

fi

## Enter the build directory.
cd ${OPUS}

## Patch the source code.
git am -q -3 ../../patches/${OPUS}-master.patch

## Configure the build.
./autogen.sh
./configure --host=arm-vita-eabi \
    --enable-fixed-point \
    --prefix=${VITASDK}/arm-vita-eabi

## Compile and install.
${MAKE:-make} -j4 && ${MAKE:-make} install
