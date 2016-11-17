#!/bin/sh -e
# sdl-vita.sh by Naomi Peori (naomi@peori.ca)

SDL_VITA="SDL-Vita"

if [ ! -d ${SDL_VITA} ]; then

  ## Download the source code.
  git clone https://github.com/xerpi/SDL-Vita

  ## Patch the source code.
  cat ../patches/${SDL_VITA}.patch | patch -p1 -d ${SDL_VITA}

fi

## Enter the build directory.
cd ${SDL_VITA}

## Compile and install.
${MAKE:-make} -f Makefile.vita -j4 && ${MAKE:-make} -f Makefile.vita install
