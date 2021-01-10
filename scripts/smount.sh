#!/bin/sh
# smount - simple mount, a script that mounts disks and SMB shares
# -t options sets abnormal mounting scenarios
# For -t cifs, specific options get called
# Usage for SMB: ./smount.sh -t cifs -a IP -s SHARE -m DIR -u USER
# Usage for disks: ./smount.sh -d /dev/sdx -m DIR
# Alternatively, the script will prompt you for the values
# Requires superuser access; you will be prompted therefore

while getopts "t:a:s:d:u:m:" i; do
	case $i in
		t) t=$OPTARG ;;
		a) address=$OPTARG ;;
		s) share=$OPTARG ;;
		d) drive=$OPTARG ;;
		u) user=$OPTARG ;;
		m) mountpoint=$OPTARG ;;

	esac
done

if [ -z "$t" ]; then
	d=true

elif [ "$t" = "cifs" ]; then
	[ -z $address ] && read -ep "Please enter IP of server: " address
	[ -z $share ] && read -ep "Please enter share to mount: " share
	[ -z $user ] && read -ep "Please enter share username: " user

	cmd="-t $t //$address/$share -o username=$user"
else
	cmd="-t $t"
	d=true
fi

[ $d = true ] && [ -z $drive ] && read -ep "Please enter drive directory: " drive
[ -n $drive ] && cmd="$cmd $drive"

[ -z $mountpoint ] && read -ep "Please enter mount directory: " mountpoint 

sudo mount $cmd $mountpoint
