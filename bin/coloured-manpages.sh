#!/bin/bash

if [[ ! -d ~/.terminfo ]]; then
    echo "~/.terminfo does not exist, run ./install_dotfiles.sh first"; exit 1
fi

cd ~/.terminfo && tic mostlike.txt
