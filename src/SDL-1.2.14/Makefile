#
# Makefile for installing the Mingw32 version of the SDL library

PREFIX := $(PWD)/../../

install:
	if test -d $(PREFIX); then \
	    cp -rv bin include lib share $(PREFIX)/; \
	    sed "s|^PREFIX=.*|PREFIX=$(PREFIX)|" <bin/sdl-config >$(PREFIX)/bin/sdl-config; \
	    chmod 755 $(PREFIX)/bin/sdl-config; \
	    sed "s|^libdir=.*|libdir=\'$(PREFIX)/lib\'|" <lib/libSDL.la >$(PREFIX)/lib/libSDL.la; \
	else \
	    echo "*** ERROR: $(PREFIX) does not exist!"; \
	    exit 1; \
	fi
