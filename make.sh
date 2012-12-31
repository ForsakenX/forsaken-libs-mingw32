#!/bin/bash
cd "$(dirname -- "$0")/.."
export PKG_CONFIG_PATH="$PWD/mingw/lib/pkgconfig"
function regex_match { [[ $1 =~ $2 ]]; }
flags=""
if ! regex_match "$*" "\bCC="; then
	versions="i386-mingw32-gcc i586-mingw32-gcc i586-mingw32msvc-gcc i686-mingw32-gcc"
	cc=$(which $versions 2>/dev/null | tail -n 1)
	if [[ $cc ]]; then
		flags="CC=$cc"
		echo "Auto detected: $flags"
		echo "You can override this on the command line if desired."
	fi
fi
make MINGW=1 $flags "$@"
