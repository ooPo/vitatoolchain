#!/bin/sh -e
# vita-curl.sh by Sunguk Lee (d3m3vilurr@gmail.com)

VITA_CURL="vita-curl"
BRANCH="vita"

if [ ! -d ${VITA_CURL}-${BRANCH} ]; then

  ## Download the source code.
  wget --continue https://github.com/d3m3vilurr/${VITA_CURL}/archive/${BRANCH}.tar.gz -O ${VITA_CURL}-${BRANCH}.tar.gz

  ## Unpack the source code.
  tar xfvz ${VITA_CURL}-${BRANCH}.tar.gz

fi

## Enter the build directory.
cd ${VITA_CURL}-${BRANCH}

## Configure the build.
./buildconf
./configure --host=arm-vita-eabi  --prefix=${VITASDK}/arm-vita-eabi/
cp lib/config-vita.h lib/curl_config.h

## Compile and install.
${MAKE:-make} -j4 && ${MAKE:-make} install
