#!/bin/bash

# dir vars
builderdir=$(cd $(dirname ${0}); pwd)
appdir=$(dirname ${builderdir})

# setup build environment
cd ${builderdir}
npm install
PATH+=:./node_modules/.bin

# settings
electron_version=$(electron --version | sed -e 's/^v//')
package_path=${appdir}/package.json
appname=$( (grep productName ${package_path} || grep name ${package_path}) | sed -e 's/[^:]\+: *"\([^"]\+\)".*/\1/' )

# build
#electron-packager ${appdir} --platform=all --arch=all --version=${electron_version}
#electron-packager ${appdir} --platform=win32 --arch=x64 --version=${electron_version}
electron-packager ${appdir} --platform=linux --arch=x64 --version=${electron_version}

# clean
#rm -rf node_modules ${appname}-*
