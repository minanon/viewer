#!/bin/bash

# dir vars
builderdir=$(cd $(dirname ${0}); pwd)
appdir=$(dirname ${builderdir})
releasedir=${appdir}/releases

source ${builderdir}/setup.sh

# settings
electron_version=$(electron --version | sed -e 's/^v//')
package_path=${appdir}/package.json
appname=$( (grep productName ${package_path} || grep name ${package_path}) | sed -e 's/[^:]\+: *"\([^"]\+\)".*/\1/' )

mkdir -p ${releasedir}

# clean
rm -rf ${releasedir}/${appname}-*

# build
cd ${releasedir}
#electron-packager ${appdir} --platform=all --arch=all --version=${electron_version}
#electron-packager ${appdir} --platform=win32 --arch=x64 --version=${electron_version}
electron-packager ${appdir} --platform=linux --arch=x64 --version=${electron_version} \
    --ignore '(node_modules|releases|builder|README.md|bower.json)'
