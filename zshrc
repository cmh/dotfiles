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

export S3E_CONFIG=s3econfig.txt
export CCACHE_PREFIX="distcc"
alias sdk='cd ~/dev/sdk/main'
alias ack='ack-grep'
alias dpw='cd /home/choldsworth/Dropbox/Work'
export P4CLIENT="choldsworth_chromium_linux"
export ANDROID_ROOT="/home/choldsworth/local/Downloads/android-sdk-linux_x86"
export JAVA_HOME="/home/choldsworth/Downloads/jdk1.6.0_25"
alias andrun='mkb --debug --compiler=gcc --arm --deploy=android --deployargs=--install --deployargs=--run'
alias anrrun='mkb --release --compiler=gcc --arm --deploy=android --deployargs=--install --deployargs=--run'
alias iosrun='mkb --debug --compiler=gcc --arm --deploy=iphone --deployargs=--install'
alias mvim='mkb --buildenv=vimproject'
export S3E_DEV_MODE=1
export S3E_DIR=/home/choldsworth/dev/sdk/main/s3e
export MARMALADE_ROOT=/usr/local/home/choldsworth/dev/sdk/main
