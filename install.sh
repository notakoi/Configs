#!/bin/bash
path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$path"
/bin/cp -rf home/. ~
if ! [ $(id -u) = 0 ]; then
	echo "This script must be run as root to install all config files" 
else
	/bin/cp -rf root/. /
fi
