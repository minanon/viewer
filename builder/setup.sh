#!/bin/bash

# dir vars
builderdir=$(cd $(dirname ${0}); pwd)
appdir=$(dirname ${builderdir})

# setup build environment
cd ${builderdir}
npm install
PATH+=:./node_modules/.bin
