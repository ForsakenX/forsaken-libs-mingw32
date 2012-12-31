# Libraries required to build Forsaken with mingw32

This folder contains all prebuilt shared/static libraries ready to go and header files.

The src folder contains all the sources.

  Note that this project will eventually be merged into https://github.com/ForsakenX/forsaken-libs which builds everything from scrach using patch files.

## General procedure to rebuild is:

```shell
autoreconf -vfi
./configure --prefix=$PWD/../../ --host=i586-mingw32msvc --build=i686-linux CC=i586-mingw32msvc-gcc
# tweak make file
make
make install
```

Be carefull running ./configure cause it will destroy the custom changes that were required to make the libraries build.

When tweaking the make files make sure you use mingw binaries.

Some examples:

```shell
host_triplet = i586-pc-mingw32msvc
AR = i586-mingw32msvc-ar
CC = i586-mingw32msvc-gcc
CPP = i586-mingw32msvc-gcc -E
LD = /usr/i586-mingw32msvc/bin/ld
NM = /usr/bin/i586-mingw32msvc-nm -B
OBJDUMP = i586-mingw32msvc-objdump
RANLIB = i586-mingw32msvc-ranlib
STRIP = i586-mingw32msvc-strip
host = i586-pc-mingw32msvc
host_alias = i586-mingw32msvc
host_os = mingw32msvc
```
