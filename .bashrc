# Check for an interactive session
[ -z "$PS1" ] && return

# create an archive from a directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

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
            *)           echo -e "'$1' can't be uncompressed with ex()" ;;
        esac
    else
        echo -e "\n'$1' is an invalid file"
    fi
}

alias ls='ls --color=auto'
alias venv='virtualenv'

alias chmox='chmod +x'
alias fx='firefox'
alias py='python'
alias py2='python2'
alias py3='python3'
alias irb='irb --readline -r irb/completion'
alias ?='pydoc'
alias ??='pydoc2'
alias vi='vim'
alias gi='git'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias :q='exit'
alias grep='grep --color=auto -n'
alias killbg='kill %{1..1000} 2>/dev/null'

alias mypublicip='curl ifconfig.me'

shopt -s checkwinsize
shopt -s cdspell

export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=10000

export BROWSER='firefox'
export EDITOR='vim'
export PYTHONSTARTUP="$HOME/.pythonrc.py"
export SESSION='startxfce4'

export CDPATH='.:~'
export PATH=$PATH:"/opt/google-appengine/:/opt/go/bin/:~/bin/"

# use bash-completion if available (obviously...)
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

bind 'set match-hidden-files off'
bind '\C-w:backward-kill-word'
stty stop '' # disable ^S

tooLong () 
{
    pfad="`pwd`"
    if [[ ${#pfad} -lt 30 ]]; then
        echo -n "${pfad/\/home\/$USER/~}"
    else 
        echo -n ".../`basename "$pfad"`"
    fi
}

check="\[\033[01;37m\]\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi)\[\e[0m\]"
time="\A"
user="\[\e[1;37m\]\u\[\e[0m\]" # 33
host="\[\e[1;34m\]\H\[\e[0m\]"
dir="\[\e[1;32m\]\$(tooLong)\[\e[0m\]"
branch="\[\e[1;36m\]\$(__git_ps1)\[\e[0m\]"
root="\\$"
# e.g. ✓ 16:33 <alexis @ alexis in ~/.dotfiles> (master) $
PS1="$check $time <$user @ $host in $dir>$branch $root "
