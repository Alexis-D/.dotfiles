# Check for an interactive session
[ -z "$PS1" ] && return

#create an archive from a directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

#usage: remind 15m "Go lunch"
remind()
{
    sleep $1 && zenity --info --text "$2" &
}

calc()
{
    echo $@ | bc
}

wcat()
{
    wget -O - $1 2>/dev/null
}

# ex - extract an archive
# usage: ex <file>
ex ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjvf $1   ;;
            *.tar.gz)    tar xzvf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xvf $1    ;;
            *.tbz2)      tar xjvf $1   ;;
            *.tgz)       tar xzvf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)           echo -e "'$1' ne peut pas etre decompresse avec ex()" ;;
        esac
    else
        echo -e "\n'$1' n'est pas un fichier valide"
    fi
}

alias ls='ls --color=auto'
alias la='ls -A'
alias lar='la -R'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias :q='exit'
alias grep='grep --color=auto'

#alias myip='echo My IP is `ifconfig | grep -Po "inet addr:(\d{1,3}\.?){4}  Bcast" | grep -Po "(\d{1,3}\.?){4}"`.'
alias myip='echo `ifconfig | tr -d "\n" | sed -r "s/.*inet addr:(([0-9]{1,3}\.?){4})  Bcast.*/\1/"`'

shopt -s checkwinsize
shopt -s cdspell

export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=10000
export EDITOR='vim'
export BROWSER='luakit'

#use bash-completion if available (obviously...)
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

#complete -cf sudo
#complete -cf man
#complete -cd yaourt
#complete -cf killall

bind 'set match-hidden-files off'

tooLong () 
{
    pfad="`pwd`"
    if [[ ${#pfad} -lt 30 ]]; then
        echo -n "${pfad/\/home\/$USER/~}"
    else 
        echo -n ".../`basename "$pfad"`"
    fi
}

#PS1='`date +"%R"` < \e[1;37m\u\e[0m in \W > \$ '
PS1='\A <\[\e[1m\]\u\[\e[0m\] in $(tooLong)> \$ '
PATH=$PATH:/opt/google-appengine

