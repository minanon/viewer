#!/bin/bash

# usage
#   source setup.sh

# dir vars
builderdir=$(cd $(dirname ${0}); pwd)
appdir=$(dirname ${builderdir})

# setup build environment
cd ${appdir}
npm install builder
PATH+=:${appdir}/node_modules/.bin

npm install

typeset -U path > /dev/null 2>&1 || true
