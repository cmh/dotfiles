alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

#Same but for dot files
alias dufh='du -sk .??* | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

#Coloured man pages in less
if [[ -d ~/.terminfo/m ]]; then
    alias man="TERMINFO=~/.terminfo/ LESS=C TERM=mostlike PAGER=less man"
fi

#hssssssssssss
alias python=ipython
alias gst='git status --ignore-submodules=dirty'

alias lr='ls -latrh'
