#/bin/bash

REMOTE_HOST="user@192.168.178.164"
REMOTE_MOUNT="/data"
REMOTE_BACKUP="${REMOTE_MOUNT}/Backups/Desktop"
LOGFILE="$HOME/.rsync-backup.log"
DEST="user@192.168.178.164:${REMOTE_BACKUP}"

# Dry-run flag for testing
#DRYRUN="--dry-run"

# Directories to backup
SOURCES=(
#		/mnt/Volume/Data
		/home/user/Desktop
		/home/user/Documents
		/home/user/Music
		/home/user/Pictures
		/home/user/Stuff
		/home/user/projects
		/home/user/scripts
)

# Clear the log
rm $LOGFILE

if ssh "$REMOTE_HOST" "lsblk" | grep -q "$REMOTE_MOUNT"; then
		# Build and run rsync command
		#
		# -a archive(keep permissions)
		# -v verbose
		# -z compression
		# -R preserve relative structure
		# --delete delete files
		#
		rsync -avzR --delete --info=progress2 $DRYRUN -e ssh "${SOURCES[@]}" "$DEST" 2>&1 | tee $LOGFILE
		
		if [ $? -eq 0 ]; then
				echo "Backup done!"
				notify-send -u critical -a Backup "Backup done!"
		else
				echo "rsync encountered an error!"
				notify-send -u critical -a Backup "rsync encountered an error!"
				exit 1
		fi
else
    echo "Backup destination not mounted. Aborting."
    notify-send -u critical -a Backup "Backup destination not mounted. Aborting!"
    exit 1
fi


