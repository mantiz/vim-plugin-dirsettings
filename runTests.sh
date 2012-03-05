#!/bin/bash
filepath="$(dirname "$(readlink -f "$0")")"
testdir="${filepath}/tests"

fakehome="${testdir}/data"
oldhome="$HOME"

export HOME="${fakehome}"

if [ $# -gt 1 ]; then
    env bash ${testdir}/runVimTests/bin/runVimTests.sh "$@"
else
    env bash ${testdir}/runVimTests/bin/runVimTests.sh "${testdir}/src"
fi

if [ -z "${TESTDEBUG}" ]; then
    rm ${testdir}/src/*.{msgout,out,msgresult} >/dev/null 2>&1
fi

export HOME="${oldhome}"
