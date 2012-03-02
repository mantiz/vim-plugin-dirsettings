#!/bin/bash
filepath="$(dirname "$(readlink -f "$0")")"

OLD_VIMRUNTIME="${VIMRUNTIME}"
export VIMRUNTIME="${filepath}/environment"

if [ $# -gt 1 ]; then
    env sh ${filepath}/runVimTests/bin/runVimTests.sh --default --source "${filepath}/environment/.vimrc" "$@"
else
    env sh ${filepath}/runVimTests/bin/runVimTests.sh --default --source "${filepath}/environment/.vimrc" "${filepath}/src"
fi

export VIMRUNTIME="${OLD_VIMRUNTIME}"

if [ -z "${TESTDEBUG}" ]; then
    rm ${filepath}/src/*.{msgout,out,msgresult} >/dev/null 2>&1
fi
