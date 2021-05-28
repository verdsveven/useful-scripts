BinDir = ${HOME}/bin/

install:
	stow -t ${BinDir} */

uninstall:
	stow -Dt ${BinDir} */

reinstall:
	stow -Rt ${BinDir} */ 
