# Check for an interactive session
[ -z "$PS1" ] && return

# create an archive from a directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

# ex - extract an archive
# usage: ex <file>
ex()
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

alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias .='PS1= builtin .'
alias :q=exit
alias ?=pydoc
alias ??=pydoc2
alias chmox='chmod +x'
alias fx=firefox
alias gi=git
alias grep='grep --color=auto -n'
alias irb='irb --readline -r irb/completion'
alias killbg='kill %{1..1000} 2>/dev/null'
alias ls='ls --color=auto'
alias mypublicip='curl ifconfig.me'
alias py2=python2
alias py3=python3
alias py=python
alias venv=mkvirtualenv
alias vi=vim

shopt -s checkwinsize
shopt -s cdspell

export BROWSER=firefox
export CDPATH=.:~
export EDITOR=vim
export HISTCONTROL=ignoreboth
export HISTCONTROL=ignoredups
export HISTFILESIZE=10000
export HISTSIZE=10000
export PYTHONSTARTUP=~/.pythonrc.py
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_HOOK_DIR=~/.virtualenvs_hooks

# use bash-completion if available (obviously...)
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

# use virtualenvwrapper, if available...
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
. /usr/local/bin/virtualenvwrapper.sh
fi

bind 'set match-hidden-files off'
bind \C-w:backward-kill-word
stty stop '' # disable ^S

tooLong()
{
    pfad=${PWD/#$HOME/\~}
    if [[ ${#pfad} -lt 30 ]]; then
        echo -n "${pfad}"
    else 
        echo -n ".../`basename "$pfad"`"
    fi
}

gitBranch() {
    __git_ps1 2>/dev/null
}

stickToFirstColumn="\[\033[G\]"
check="\[\033[01;37m\]\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\[\234\223\]\"; else echo \"\[\033[01;31m\]\342\[\234\227\]\"; fi)\[\e[0m\]"
time="\A"
user="\[\e[1;37m\]\u\[\e[0m\]"
host="\[\e[1;34m\]\h\[\e[0m\]"
dir="\[\e[1;32m\]\$(tooLong)\[\e[0m\]"
branch="\[\e[1;36m\]\$(gitBranch)\[\e[0m\]"
root="\\$"
# e.g. ✓ 16:33 <alexis @ alexis in ~/.dotfiles> (master) $
PS1="$stickToFirstColumn $check $time $user @ $host in $dir$branch $root "
