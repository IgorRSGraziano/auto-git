#!/usr/bin/env sh
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'


if [ -z $* ] ; then
    printf "${RED}No commit message ${NC} \n"
    exit 1
fi

git add -A

if git commit -m "$*" | grep -q "$*"; then
    git push
    printf "${GREEN}Commited & Push: \"$*\" ${NC} \n"
else
    git commit -m "$*"
    printf "${RED}Some error occurred ${NC} \n"
fi