# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# check the window size after each command and, if necessary, # update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend
#Write history to file whenever we display a prompt. This sovled the multiwindow problem
PROMPT_COMMAND='history -a' 

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=40000
HISTFILESIZE=40000

#Magic space - to expand historical arguments
#Space: magic-space

#cd behaviour
shopt -s cdspell
bind 'set completion-ignore-case on'

#Mandate 2 Ctrl-D pressed to exit bash
export IGNOREEOF=1

# Sensible sorted du summary
alias duf='du -sk .??* | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

# i3d
# TODO - move local settings to a local bashrc
export S3E_CONFIG=s3econfig.txt
PATH=~/dev/sdk/main/s3e/bin:~/.cabal/bin:/misc/sdks/code-sourcery/arm-2009q3/bin:/misc/sdks/code-sourcery/gnueabi/bin:$PATH
export CCACHE_PREFIX="distcc"
alias sdk='cd ~/dev/sdk/main'
alias ack='ack-grep'
alias dpw='cd /home/choldsworth/Dropbox/Work'
export P4CLIENT="choldsworth_chromium_linux"
export ANDROID_ROOT="/home/choldsworth/local/Downloads/android-sdk-linux_x86"
PATH=$PATH:$ANDROID_ROOT/platform-tools
PATH=$PATH:$HOME/bin
export JAVA_HOME="/home/choldsworth/Downloads/jdk1.6.0_25"
alias andrun='mkb --debug --compiler=gcc --arm --deploy=android --deployargs=--install --deployargs=--run'
alias anrrun='mkb --release --compiler=gcc --arm --deploy=android --deployargs=--install --deployargs=--run'
alias iosrun='mkb --debug --compiler=gcc --arm --deploy=iphone --deployargs=--install'
alias mvim='mkb --buildenv=vimproject'
export S3E_DEV_MODE=1
export S3E_DIR=/home/choldsworth/dev/sdk/main/s3e
export MARMALADE_ROOT=/usr/local/home/choldsworth/dev/sdk/main

# git
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\033[00m\]\u@\h\[\033[01;34m\] \W \[\033[31m\]\$(parse_git_branch) \[\033[00m\]$\[\033[00m\] "

# clojure
export CLOJURE_EXT=~/.clojure
PATH=$PATH:~/local/opt/clojure-contrib/launchers/bash
alias clj=clj-env-dir

# Custom completions
COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}

function _killall()
{
	local cur prev
	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}
	# get a list of processes (the first sed evaluation
	# takes care of swapped out processes, the second
	# takes care of getting the basename of the process)
	COMPREPLY=( $( /bin/ps -u $USER -o comm  | \
		sed -e '1,1d' -e 's#[]\[]##g' -e 's#^.*/##'| \
		awk '{if ($0 ~ /^'$cur'/) print $0}' ))
	return 0
}
complete -F _killall killall killps
