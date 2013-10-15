#!/bin/bash

###############################################################################
# Author: Shelby Sturgis
# Date: 10-14-2013
# Notes: This script adds the azkaban shell script to the ~/bin directory.
###############################################################################

# GLOBAL PARAMETERS
CURRENT_DIR=$(pwd)
HOME=echo $HOME

# FUNCTIONS
# Adds the ~/bin directory to the $PATH
add_bin_to_path() {
	if [[ -e "$HOME/.bash_profile" ]]; then
		cat >> $HOME/.bash_profile <<- _EOF_
		export PATH=~/bin:"$PATH"
		_EOF_
	else
		cat > $HOME/.bash_profile <<- _EOF_
		export PATH=~/bin:"$PATH"
		_EOF_
	fi

	return
}

add_azkaban() {
	echo "Adding the azkaban shell script to your $HOME/bin directory."
	if [[ -e "$CURRENT_DIR/azkaban" ]]; then
		add_bin_to_path
		cp azkaban ~/bin/
		echo "Congratulations! You can start using azkaban-controller."
		echo "Visit https://github.com/stormpython/azkaban-controller/blob/master/README.md for instructions."
	else
		echo "Please change into the directory with the azkaban shell 
		script, or add the azkaban shell script to the current 
		directory."
		exit 1
	fi

	return
}

# Main
# Check if the ~/bin directory exists.
main() {
	if [[ -d "$HOME/bin" ]]; then
		add_azkaban
	else
		echo "Creating a $HOME/bin directory."
		mkdir $HOME/bin
		echo "$HOME/bin directory created."
		add_azkaban
	fi

	return
}

main
