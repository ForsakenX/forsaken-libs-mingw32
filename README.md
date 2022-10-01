# Libraries required to build Forsaken with mingw32

This folder contains all required win32 libraries ready to go.

The plan is to eventually merge it into the other forsaken-libs folder.


# Rebuilding

Everything is already built and ready to go so there is no need to rebuild.

In the event that you want to rebuild you can follow this as a general guide:

```shell
autoreconf -vfi
./configure --prefix=$PWD/../../ --host=i586-mingw32msvc --build=i686-linux CC=i586-mingw32msvc-gcc
# tweak make file
make
make install
```

Be carefull running ./configure cause it will destroy the custom changes that were required to make the libraries build.

When tweaking the make files make sure you use the mingw binaries to build.

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
