#!/bin/sh -e
# expat.sh by Sunguk Lee (d3m3vilurr@gmail.com)

EXPAT="expat"
BRANCH="25c6393829"

if [ ! -d ${EXPAT} ]; then

  ## Download the source code.
  git clone git://git.code.sf.net/p/expat/code_git ${EXPAT}

fi

## Enter the build directory.
cd ${EXPAT}
git checkout -f ${BRANCH}

## Patch the source code.
git am --keep-cr ../../patches/${EXPAT}-${BRANCH}.patch

## Configure the build.
mkdir -p build && cd build
cmake ../expat -DCMAKE_SYSTEM_NAME="Generic" \
    -DCMAKE_C_COMPILER="arm-vita-eabi-gcc" \
    -DBUILD_tools=0 \
    -DBUILD_examples=0 \
    -DBUILD_tests=0 \
    -DBUILD_shared=0 \
    -DCMAKE_INSTALL_PREFIX=${VITASDK}/arm-vita-eabi/

## Compile and install.
${MAKE:-make} -j4 && ${MAKE:-make} install
