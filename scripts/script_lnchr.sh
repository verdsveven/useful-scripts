#!/bin/sh
# Script that launches scripts/programs in an array
# Can also export PATH if a script is in a specific location
# Usage: ./script_lnchr.sh -s "script1.sh script2.sh" -p "$HOME/bin/"
# Alternatively: ./script_lnchr.sh -s $(cat scripts.txt) to use a list
# Exits if there are no scripts in the list

while getopts "p:s:" i; do
	case $i in
		s) scripts=($OPTARG) ;;
		p) paths=($OPTARG) ;;
	esac
done

lnchr(){
	$1 &
}

[ ${#scripts} == 0 ] && exit

for i in ${!paths[@]}; do
	export PATH="${paths[$i]}:$PATH"
done

for i in ${!scripts[@]}; do
	lnchr ${scripts[$i]}
done
