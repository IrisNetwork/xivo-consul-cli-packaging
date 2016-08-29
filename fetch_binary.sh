
#!/bin/bash
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>

set -e

ARCH=${DEB_BUILD_ARCH}
if [ "${DEB_BUILD_ARCH}" = "386" ]
then
    ARCH=386
elif [ "${DEB_BUILD_ARCH}" = "armhf" ]
then
    ARCH=arm
fi

VERSION=$(cat VERSION)

URL="https://github.com/CiscoCloud/consul-cli/releases/download/v${VERSION}/consul-cli_${VERSION}_linux_${ARCH}.tar.gz"

rm -rf tmp
mkdir tmp
cd tmp

wget -nv "${URL}"
tar xzf "consul-cli_${VERSION}_linux_${ARCH}.tar.gz"
mv consul-cli_*_linux_*/consul-cli consul-cli
