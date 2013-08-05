# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

if [[ -f $HOME/dotfiles/liquidprompt/liquidprompt ]]; then
    source $HOME/dotfiles/liquidprompt/liquidprompt
else
    ZSH_THEME=pygmalion
fi

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases.zsh

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

plugins=(git zsh-syntax-highlighting command-not-found mercurial history-substring-search mercurial gradle vi-mode)

#set -o vi

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/bin

alias ack='ack-grep'

#C++ libs
export STLSOFT=/usr/local/include/stlsoft-1.9.111

export EDITOR=vim

#Machine specific specific zshrc
if [[ -f $HOME/.zshrc.local ]]; then
    source $HOME/.zshrc.local
fi

#Virtualenv
if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/workspace
    source /usr/local/bin/virtualenvwrapper.sh
fi
