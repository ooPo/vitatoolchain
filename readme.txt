
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

    autoconf, automake, bison, bzip2, cmake, flex, g++, gcc, git,
    gmp, janssen, libtool, make, makeinfo, ncurses, patch, pkg-config,
    python, subversion, wget, ziplib, zlib

   Specifically on debian-based systems, the following command line should
   be enough to install everything necessary:

     apt-get install autoconf automake bison build-essential bzip2 \
       cmake flex git libgmp3-dev libjansson-dev libncurses5-dev \
       libtool libzip-dev pkg-config python python-dev subversion \
       texinfo wget zlib1g-dev

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

  https://github.com/xerpi/vita_portlibs
  - "Portlibs for the PSVita"

  https://github.com/xerpi/libvita2d
  - "Simple and Fast (using the GPU) 2D library for the PSVita"

  https://github.com/xerpi/SDL-Vita
  - "An unofficial, automated SDL2 and SDL1.2 HG mirror."

  https://github.com/xerpi/libftpvita
  - "FTP Server for the PSVita"
