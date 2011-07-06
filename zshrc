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
plugins=(git command-not-found)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases.zsh

# Customize to your needs...
export PATH=/home/choldsworth/dev/sdk/main/s3e/bin:/home/choldsworth/.cabal/bin:/misc/sdks/code-sourcery/arm-2009q3/bin:/misc/sdks/code-sourcery/gnueabi/bin:/home/choldsworth/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/choldsworth/local/Downloads/android-sdk-linux_x86/platform-tools:/home/choldsworth/bin:/home/choldsworth/local/opt/clojure-contrib/launchers/bash
