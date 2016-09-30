#!/bin/sh -e
# vita-curl.sh by Sunguk Lee (d3m3vilurr@gmail.com)

VITA_CURL="vita-curl"
BRANCH="vita"

if [ ! -d ${VITA_CURL}-${BRANCH} ]; then

  ## Download the source code.
  wget --continue https://github.com/xyzz/${VITA_CURL}/archive/${BRANCH}.tar.gz -O ${VITA_CURL}-${BRANCH}.tar.gz

  ## Unpack the source code.
  tar xfvz ${VITA_CURL}-${BRANCH}.tar.gz

fi

## Enter the build directory.
cd ${VITA_CURL}-${BRANCH}

## Configure the build.
./buildconf
./configure --host=arm-vita-eabi \
    --with-ssl=${VITASDK}/arm-vita-eabi/ \
    --disable-shared \
    --disable-ftp \
    --disable-ldap \
    --disable-imap \
    --disable-ipv6 \
    --disable-rtsp \
    --disable-dict \
    --disable-file \
    --disable-gopher \
    --disable-pop3 \
    --disable-smtp \
    --disable-telnet \
    --disable-tftp \
    --enable-https \
    --disable-smb \
    --disable-smbs \
    --prefix=${VITASDK}/arm-vita-eabi/

## Compile and install.
${MAKE:-make} -j4 && ${MAKE:-make} install
