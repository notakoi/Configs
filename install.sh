#!/bin/bash
path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$path"
/bin/cp -rf home/. ~
doas /bin/cp -rf root/. /
