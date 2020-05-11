#!/bin/sh
# A simple script that changes the current x server layout based on the previous one in the layouts array.
# Usage: /pathtoscript/chLayout.sh us gb
# Alternatively, a file can be used as input: /pathtoscript/chLayout.sh $(cat /pathtofile/file)
# Meant to be used with some hotkey daemon e.g. sxhkd
# If a currently selected layout is not in the list, the script will revert to the first item i.e. [0] in the layouts array
# If no layouts are given the script will not do anything and exit

layouts=($@)
layout=`setxkbmap -print -v 10 | grep -oP '(?<=layout:     ).*'`
i=0

ch_lyt(){
	setxkbmap -layout $1
}

[ ${#layouts[@]} == 0 ] && exit

until [ $layout == ${layouts[$i]} ]; do
	let i=$i+1
	[ $i -gt ${#layouts[@]} ] && let i=-1 && break
done

let i=$i+1

[ $i == ${#layouts[@]} ] && let i=0

ch_lyt ${layouts[$i]}
