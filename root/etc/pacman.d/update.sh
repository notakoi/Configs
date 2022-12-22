#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

pacman -S curl pacman-contrib

#save old mirrors
mkdir old
/bin/mv -f mirrorlist old/
/bin/mv -f mirrorlist-arch old/

#Arch Mirrors
reflector --save /etc/pacman.d/mirrorlist-arch --protocol https --sort rate --threads 10 -a 1

#Artix Mirrors
curl https://gitea.artixlinux.org/packagesA/artix-mirrorlist/raw/branch/master/trunk/mirrorlist -o mirrors
rankmirrors mirrors > mirrorlist
/bin/rm mirrors
