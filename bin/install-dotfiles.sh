#!/bin/zsh

function set_rc {
	[ -z "$1" ] && return
	echo "Setting ${1}..."
	[ -f ~/.${1} ] && [ ! -f ~/.${1}.bak ] && mv -f ~/.${1} ~/.${1}.bak
	ln -sf ~/dotfiles/${1} ~/.${1}
}

function set_vimrc {
	[ -z "$1" ] && return
	echo "Setting ${1}..."
	[ -f ~/.${1} ] && [ ! -f ~/.${1}.bak ] && mv -f ~/.${1} ~/.${1}.bak
	ln -sf ~/.vim/${1} ~/.${1}
}

#Dot files
set_rc "gitconfig"
set_rc "ackrc"
set_rc "irssirc"
set_rc "bashrc"

#Directories
set_rc "vim"
set_rc "zsh"

#Need to handle vimrc separately
set_vimrc "vimrc"

exit 0