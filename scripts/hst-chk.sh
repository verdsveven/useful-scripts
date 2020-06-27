# Script that checks the hostname for including $hst_type
# Exits with success if it includes the string; with failure if not
# To be used in combination with other scripts e.g: [ hst-chk.sh laptop ] && laptop.sh
# Made for the sake of keeping one set of dotfiles across desktops and laptops (enabling certain features in one vs the other)
# Usage: ./hst-chk.sh laptop	alternatively: ./hst-chk.sh desktop	it can match anything in the hostname for that matter (even the distribution or *nix flavour)
# NB!: It is case insensitive (uses grep -i option for this)!
# Should work on all distributions (message me if not)

hst_cmd=`hostname`
hst_type=$1
hst_chk=`grep -i "$hst_type" <<< "$hst_cmd"`

( [ $hst_chk ] && exit 0 ) || exit 1
