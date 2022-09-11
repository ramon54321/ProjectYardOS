#!/bin/sh -e

# Build tools and libraries to build GCC Cross compiler
apk update
apk add build-base
apk add gmp-dev mpfr-dev mpc1-dev
apk add texinfo bison flex

# ISO creation tools
apk add grub-bios xorriso

# Clean up
rm -rf /var/cache/apk/*

# Set up variables
TARGET=i686-elf
BINUTILS=binutils-2.39
GCC=gcc-12.2.0
PREFIX="/opt/toolchain"
PATH="$PREFIX/bin:$PATH"
SRC="/opt/src"

# Set up directories
mkdir ${SRC}

# Download binutils source
cd ${SRC}
wget http://ftp.gnu.org/gnu/binutils/${BINUTILS}.tar.gz
tar -xf ${BINUTILS}.tar.gz
mkdir binutils-build
cd binutils-build
../${BINUTILS}/configure \
  --target=${TARGET} \
  --prefix=${PREFIX} \
  --disable-nls \
  --disable-werror \
  --with-sysroot 

# Build binutils
make
make install

# Download gcc source
cd ${SRC}
wget http://ftp.gnu.org/gnu/gcc/${GCC}/${GCC}.tar.gz
tar -xf ${GCC}.tar.gz
mkdir gcc-build
cd gcc-build
../${GCC}/configure \
  --target=${TARGET} \
  --prefix=${PREFIX} \
  --disable-nls \
  --enable-languages=c,c++ \
  --without-headers

# Build gcc
make all-gcc all-target-libgcc
make install-gcc install-target-libgcc

