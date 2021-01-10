# Useful scripts

Some simple scripts which may prove useful to some people.

## Some notes on installation
* Clone the repository with git clone as usual (wherever you prefer)
* It is possible to install with stow, more specifically:
```
stow */ -t $HOME/bin/
```
* -t here specifies the target directory. Look at man stow if you want other options

## chLayout -- changes the layout
* A simple script that changes the current x server layout based on the previous one in the layouts array.
* Usage: /pathtoscript/chLayout.sh us gb
* Alternatively, a file can be used as input: /pathtoscript/chLayout.sh $(cat /pathtofile/file)
* Meant to be used with some hotkey daemon e.g. sxhkd
* If a currently selected layout is not in the list, the script will revert to the first item i.e. [0] in the layouts array
* If no layouts are given the script will not do anything and exit

## hst-chk -- checks if hostname includes $host_type
* Script that checks the hostname for including $hst_type
* Exits with success if it includes the string; with failure if not
* To be used in combination with other scripts e.g: [ hst-chk.sh laptop ] && laptop.sh
* Made for the sake of keeping one set of dotfiles across desktops and laptops (enabling certain features in one vs the other)
* Usage: ./hst-chk.sh laptop	alternatively: ./hst-chk.sh desktop	it can match anything in the hostname for that matter (even the distribution or *nix flavour)
* NB!: It is case insensitive (uses grep -i option for this)!
* Should work on all distributions (message me if not)

## domain_block -- blocks unwanted domains for a limited time
* A simple script that blocks certain domains as long as it is running and counts time passed
* Works through /etc/hosts so needs sudo or su
* When killed, it restores the previous /etc/hosts file
* Usage: sudo /pathtoscript/domain_block.sh example.com example.net
* Alternatively: sudo /pathtoscript/domain_block.sh $(cat domains.txt)
* NB!: do not edit the /etc/hosts file while the script is working, it will overwrite changes
* If there are no domains given, it exits

## smount.sh -- simple mount
* Mounts disks or SMB shares
