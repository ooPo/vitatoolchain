
 ====================
  What does this do?
 ====================

  This program will automatically build and install a compiler and other
  tools used in the creation of homebrew software for the Sony Vita
  videogame system.

 ==================
  How do I use it?
 ==================

  1) Set up your environment by installing the following software:

   autoconf, automake, bison, flex, gcc, libelf, make, makeinfo,
   ncurses, patch, python, subversion, wget, zlib, libtool, python,
   bzip2, gmp, pkg-config, ziplib, janssen, cmake

   Specifically on debian-based systems, the following command line should
   be enough to install everything necessary:

   apt-get install autoconf automake bison flex gcc make \
     texinfo libncurses5-dev patch python subversion wget \
     zlib1g-dev libtool python-dev bzip2 libgmp3-dev pkg-config \
     libzip-dev jansson-dev cmake

  2) Add the following to your login script:

   ## Set up the environment.
   export VITADEV=/usr/local/vitadev
   export VITASDK=$VITADEV

   ## Set up the path.
   export PATH=$PATH:$VITADEV/bin

  3) Run the toolchain script:

   ./toolchain.sh

  4) Enjoy!

 ========================
  External Contributions
 ========================

  https://github.com/vitasdk/buildscripts
  - Patches and other information.

  https://github.com/vitasdk/newlib
  - A port of Newlib to the Vita.

  https://github.com/vitasdk/vita-toolchain
  - Useful command line utilities for creating Vita executables.

  https://github.com/vitasdk/vita-headers
  - Headers for SCE libraries.
