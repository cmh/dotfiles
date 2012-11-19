# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="jreese"
# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases.zsh

plugins=(git zsh-syntax-highlighting command-not-found mercurial history-substring-search mercurial)

# Customize to your needs...#
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/bin

alias ack='ack-grep'

#C++ libs
export STLSOFT=/usr/local/include/stlsoft-1.9.111

export EDITOR=vim

#Work specific zshrc
source $HOME/dotfiles/zshrc.work

#Virtualenv
if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/workspace
    source /usr/local/bin/virtualenvwrapper.sh
fi
