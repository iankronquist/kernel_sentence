#!/bin/sh

TARGET=arm-elf
PREFIX=$(pwd)/compiler/arm-elf
PATH=$PATH:$PREFIX/bin
echo 'Nuking ./compiler and recreating directories'
rm -rf compiler
mkdir -p compiler/src
mkdir -p compiler/arm-elf
mkdir -p compiler/build

cd compiler/src

echo 'Downloading sources'
wget http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz 
wget ftp://ftp.gnu.org/gnu/gcc/gcc-4.9.1/gcc-4.9.1.tar.gz
wget https://gmplib.org/download/gmp/gmp-6.0.0a.tar.gz
wget http://www.mpfr.org/mpfr-current/mpfr-3.1.2.tar.xz
wget ftp://ftp.gnu.org/gnu/mpc/mpc-1.0.2.tar.gz

echo 'Extracting archives'
echo `pwd`
tar xzf binutils-2.24.tar.gz
tar xzf gcc-4.9.1.tar.gz
tar xzf mpc-1.0.2.tar.gz
tar xzf gmp-6.0.0a.tar.gz
tar xJf mpfr-3.1.2.tar.xz
mv gmp-6.0.0a gcc-4.9.1/gmp
mv mpfr-3.1.2 gcc-4.9.1/mpfr
mv mpc-1.0.2 gcc-4.9.1/mpc

echo 'Building binutils'
cd binutils-2.24
../binutils-2.24/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make
make install
cd ..

echo 'Building gcc'
cd build
../src/gcc-4.9.1/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc

echo 'Done!'
