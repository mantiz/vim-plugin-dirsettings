#!/bin/bash
filepath="$(dirname "$(readlink -f "$0")")"

if [ $# -gt 1 ]; then
    env sh ${filepath}/runVimTests/bin/runVimTests.sh --default "$@"
else
    env sh ${filepath}/runVimTests/bin/runVimTests.sh --default "${filepath}/src"
fi

if [ -z "${TESTDEBUG}" ]; then
    rm ${filepath}/src/*.{msgout,out,msgresult} >/dev/null 2>&1
fi
