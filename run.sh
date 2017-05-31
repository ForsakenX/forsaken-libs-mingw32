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

projectx="$PWD/projectx"
wine "$projectx" "$@"
