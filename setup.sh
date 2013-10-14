#!/bin/bash

###############################################################################
# Author: Shelby Sturgis
# Date: 10-14-2013
# Notes: This script adds the azkaban shell script to the ~/bin directory.
###############################################################################

# GLOBAL PARAMETERS
CURRENT_DIR=$(pwd)

# FUNCTIONS
add_azkaban() {
	echo "Adding the azkaban shell script to your ~/bin directory."
	if [[ -e "$CURRENT_DIR/azkaban" ]]; then
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
	if [[ -d "~/bin" ]]; then
		add_azkaban
	else
		echo "Creating a ~/bin directory."
		mkdir ~/bin
		echo "~/bin directory created."
		add_azkaban
	fi

	return
}

main
