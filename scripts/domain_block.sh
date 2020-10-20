#!/bin/sh
# A simple script that blocks certain domains as long as it is running and counts time passed
# Works through /etc/hosts so needs sudo or su
# When killed, it restores the previous /etc/hosts file
# Usage: sudo /pathtoscript/domain_block.sh example.com example.net
# Alternatively: sudo /pathtoscript/domain_block.sh $(cat domains.txt)
# NB!: do not edit the /etc/hosts file while the script is working, it will overwrite changes
# If there are no domains given, it exits

domains=($@)

[ ${#domains[@]} == 0 ] && exit

restore(){
	mv /tmp/hosts-tmp /etc/hosts
}

cp /etc/hosts /tmp/hosts-tmp

trap restore EXIT

for i in ${!domains[@]}; do
	echo "0.0.0.0	${domains[$i]}" >> /etc/hosts
done

date1=`date +%s`
while true; do
	clear
	echo "Worked for: $(expr `date +%s` - $date1)s"
	sleep 1
done
