#!/bin/zsh

function set_rc {
	if [[ -z "$1" ]]; then 
        echo "No argument supplied to set_rc"; return
    fi

    #Check if the symlink we are trying to setup already exists 
    if [[ -L ~/.${1} ]]; then
        echo "Symlink already exists at ~/.${1}, skipping"; return
    fi

    if [[ ! -e ~/dotfiles/${1} ]]; then
        echo "File ${1} not present in ~/dotfiles"; return
    fi

	echo "Setting ~/.${1} -> ~/dotfiles/${1}" 
	[ -f ~/.${1} ] && [ ! -L ~/.${1} ] && [ ! -f ~/.${1}.bak ] && mv -f ~/.${1} ~/.${1}.bak
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
#set_rc "irssirc"
set_rc "bashrc"
set_rc "zshrc"
set_rc "hgrc"
set_rc "hgignore"
set_rc "clang_complete"

#Directories
set_rc "vim"
set_rc "zsh"
set_rc "terminfo"

#Need to handle vimrc separately
set_vimrc "vimrc"

exit 0
