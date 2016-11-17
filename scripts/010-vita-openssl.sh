#!/bin/sh -e
# vita-openssl.sh by Sunguk Lee (d3m3vilurr@gmail.com)

VITA_OPENSSL="vita-openssl"
BRANCH="vita-1_0_2"

if [ ! -d ${VITA_OPENSSL}-${BRANCH} ]; then

  ## Download the source code.
  wget --continue https://github.com/d3m3vilurr/${VITA_OPENSSL}/archive/${BRANCH}.tar.gz -O ${VITA_OPENSSL}-${BRANCH}.tar.gz

  ## Unpack the source code.
  tar xfvz ${VITA_OPENSSL}-${BRANCH}.tar.gz

fi

## Enter the build directory.
cd ${VITA_OPENSSL}-${BRANCH}

## Configure the build.
./Configure no-threads --prefix=${VITASDK}/arm-vita-eabi/ vita-cross
${MAKE:-make} depend

## Compile and install.
${MAKE:-make} -j4 && ${MAKE:-make} install
