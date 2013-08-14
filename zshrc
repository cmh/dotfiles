# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

if [[ -f $HOME/dotfiles/liquidprompt/liquidprompt ]]; then
    source $HOME/dotfiles/liquidprompt/liquidprompt
else
    ZSH_THEME=pygmalion
fi

plugins=(git zsh-syntax-highlighting command-not-found mercurial \
         history-substring-search mercurial gradle pip debian)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases.zsh
unsetopt AUTO_NAME_DIRS

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

#set -o vi
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/bin
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
