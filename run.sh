#!/bin/bash -x
cd "$(dirname -- "$0")/.."

##
# this is the old layout that we don't really use anymore
# if you want to specify a specific target directory override this
# otherwise we'll assume you're using your Forsaken folder as
# your game directory as well
##
: ${SKELETON:="$PWD/../skeleton"}
[[ -d $SKELETON ]] && cd "$skeleton"

if ! [[ -e OpenAL32.dll ]] || ! [[ -e SDL.dll ]]; then
	echo "WARNING: You need to make sure that OpenAL32/SDL.dll are in your system"
	echo "WARNING: You can easily do this by runnig \`ln -sf mingw/bin/*dll .\`"
fi

projectx="$PWD/projectx"
wine "$projectx" "$@"
