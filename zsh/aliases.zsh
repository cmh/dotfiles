alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

#Same but for dot files
alias dufh='du -sk .??* | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

#Coloured man pages in less
alias man="TERMINFO=~/.terminfo/ LESS=C TERM=mostlike PAGER=less man"

#hssssssssssss
alias python=ipython
