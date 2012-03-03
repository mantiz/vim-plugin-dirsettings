#!/bin/bash
filepath="$(dirname "$(readlink -f "$0")")"
testdir="${filepath}/tests"

OLD_VIMRUNTIME="${VIMRUNTIME}"
export VIMRUNTIME="${testdir}/environment"

if [ $# -gt 1 ]; then
    env sh ${testdir}/runVimTests/bin/runVimTests.sh --default --source "${testdir}/environment/.vimrc" "$@"
else
    env sh ${testdir}/runVimTests/bin/runVimTests.sh --default --source "${testdir}/environment/.vimrc" "${testdir}/src"
fi

export VIMRUNTIME="${OLD_VIMRUNTIME}"

if [ -z "${TESTDEBUG}" ]; then
    rm ${testdir}/src/*.{msgout,out,msgresult} >/dev/null 2>&1
fi
