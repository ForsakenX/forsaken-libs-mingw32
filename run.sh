#!/bin/bash -x
cd "$(dirname -- "$0")/.."
skeleton="$PWD/../skeleton"
projectx="$PWD/projectx"
cd "$skeleton"
wine "$projectx" "$@"
