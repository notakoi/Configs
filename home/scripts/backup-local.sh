#!/bin/bash
doas cryptsetup open $1 backup
doas mount /dev/mapper/backup /mnt/backup/
kbackup --auto /home/user/profile.kbp
sync
doas umount /mnt/backup
doas cryptsetup close /dev/mapper/backup
notify-send -u critical -a Backup "Backup done\!"

