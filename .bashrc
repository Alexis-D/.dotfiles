# Check for an interactive session
[[ -z "$PS1" ]] && return

BASH_MAJOR_VERSION=${BASH_VERSINFO[0]}

# create an archive from a directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

[[ -f ~/.p ]] && . .p

# ex - extract an archive
# usage: ex <file>
ex() {
    if [[ -f "$1" ]]; then
        case "$1" in
            *.tar.bz2)   tar xjvf "$1" ;;
            *.tar.gz)    tar xzvf "$1" ;;
            *.tar.xz)    tar xJvf "$1" ;;
            *.bz2)       bunzip2 "$1" ;;
            *.rar)       unrar x "$1" ;;
            *.gz)        gunzip "$1" ;;
            *.tar)       tar xvf "$1" ;;
            *.tbz2)      tar xjvf "$1" ;;
            *.tgz)       tar xzvf "$1" ;;
            *.zip)       unzip "$1" ;;
            *.par)       unzip "$1" ;;
            *.jar)       unzip "$1" ;;
            *.Z)         uncompress "$1" ;;
            *.7z)        7z x "$1" ;;
            *)           echo -e "'$1' can't be uncompressed with ex()" ;;
        esac
    else
        echo -e "\n'$1' is an invalid file"
    fi
}

list() {
    if [[ -f "$1" ]]; then
        case "$1" in
            *.tar.bz2)   tar tjf "$1" ;;
            *.tar.gz)    tar tzf "$1" ;;
            *.tar.xz)    tar tJf "$1" ;;
            *.tar)       tar tf "$1" ;;
            *.tbz2)      tar tjf "$1" ;;
            *.tgz)       tar tzf "$1" ;;
            *.zip)       unzip -l "$1" ;;
            *.par)       unzip -l "$1" ;;
            *.jar)       jar tf "$1" ;;
            *)           echo -e "'$1' can't be listed with list()" ;;
        esac
    else
        echo -e "\n'$1' is an invalid file"
    fi
}

# takes a bunch of text and quote it like in markdown
cite() {
    if [[ -t 0 ]]
    then
        pbpaste | sed 's/^/> /'
    else
        sed 's/^/> /'
    fi
}

java8() {
    JAVA_HOME=$(/usr/libexec/java_home -v '1.8') "$@"
}

java9() {
    JAVA_HOME=$(/usr/libexec/java_home -v '1.9') "$@"
}

java11() {
    JAVA_HOME=$(/usr/libexec/java_home -v '11') "$@"
}

java14() {
    JAVA_HOME=$(/usr/libexec/java_home -v '14') "$@"
}

java15() {
    JAVA_HOME=$(/usr/libexec/java_home -v '15') "$@"
}

origin() {
    tr / . | sed 's/.java$//'
}

regen() {
    ./gradlew --daemon -q tasks --all |
        awk '{print $1}' |
        grep -E -e generateAltaClient$ -e compileConjure$ -e gofigureRender$ -e generateSchema$ -e generateDockerCompose$ -e devEnvSetup$  -e generateMetrics$ |
        xargs ./gradlew
}

throttling-proxy() {
    ssh -D 1080 -N -o ProxyCommand="
    pv -B8K -trbcN upload -L${2:-100K} |
    /usr/bin/nc %h %p |
    pv -B8K -trbcN download -L${1:-100K}" localhost
}

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[1;31m'        # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

root() {
    cd "$(git rev-parse --show-toplevel)"
}

# http://stackoverflow.com/a/16178979/2813687
color() (set -o pipefail; "$@" 2>&1>&3 | sed $'s,.*,\e[31m&\e[m,' >&2)3>&1

idea() {
    open *.ipr
}

tmp() {
    if [[ $# == 1 ]]
    then
        cd "$(mktemp -td "$1-XXX")"
    else
        cd "$(mktemp -d)"
    fi
}

pb() {
    pbpaste | vim -
}

clean() {
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
    docker volume rm $(docker volume ls -qf dangling=true)
    docker network rm $(docker network ls -q)
}

WANTED_PYTHON_VERSION=3.9.4

venv() {
    pyenv virtualenv "$WANTED_PYTHON_VERSION" "$1"
    pyenv shell "$1"
}

workon() {
    pyenv shell "${1:-"$WANTED_PYTHON_VERSION"}"
}

_xargsh () {
    local f=$1
    export -f "$f"
    shift
    xargs "$@" bash -c "$f \"\$@\"" _
}

alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias .='PS1= builtin .'
alias aa='ag --ignore-dir test'
alias csv="awk -vFPAT='([^,]+)|(\"[^\"]+\")'"
alias grep='grep -E --color=auto -I'
alias groovysh='JAVA_OPTS=-Djava.awt.headless=true rlwrap groovysh -T off'
alias gw='./gradlew --daemon --no-scan'
alias fgrep='fgrep --color=auto -I'
alias ipy='ipython --colors=linux --no-confirm-exit'
# Causes less to automatically exit if the entire file can be displayed on the
# first screen. + display colors
alias less='less -F -X -R'
alias ls='ls --color=auto'
alias pwgen='pwgen -s 32 1'
alias py=python
alias reload='history -n'
alias tree='tree -C'
alias throttled-youtube-dl='youtube-dl --proxy socks5://localhost:1080'
alias venvs='pyenv virtualenvs'
alias vi=vim
alias vimcognito='vim -u NONE "+set noswapfile nobackup nowritebackup viminfo="'

# tz are hard!
alias fr='TZ=Europe/Paris date'
alias jp='TZ=Asia/Tokyo date'
alias ny='TZ=America/New_York date'
alias nyc='TZ=America/New_York date'
alias sf='TZ=US/Pacific date'
alias sg='TZ=Asia/Singapore date'
alias uk='TZ=Europe/London date'
alias utc='TZ=UTC date'

shopt -s checkwinsize
shopt -s cdspell
(( BASH_MAJOR_VERSION > 3 )) && shopt -s globstar
shopt -s histappend

export EDITOR=$HOME/.editor.sh
export GRADLE_OPTS=-Xmx2g
export HISTCONTROL=ignorespace
export HISTTIMEFORMAT='%F %T - '
export HISTFILESIZE=100000
export HISTSIZE=100000
export HOMEBREW_NO_ANALYTICS=1
[[ -x /usr/libexec/java_home ]] &&
    export JAVA_HOME=$(/usr/libexec/java_home -v '15')

# use gnu coreutils on Mac (and use the right man pages)
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/grep/share/man/:$MANPATH"
export MANPATH="/usr/local/opt/findutils/share/man/:$MANPATH"

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/bin/:$PATH"
export PATH="/usr/local/opt/findutils/bin/:$PATH"
export PATH="/usr/local/bin:$PATH"

export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export PYTHONSTARTUP=~/.pythonrc.py
export XDG_CONFIG_HOME=~/.dotfiles/.config

if ((BASH_MAJOR_VERSION > 3)) && [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
fi

if hash brew 2>/dev/null; then
    # for MacOS
    BASH_COMPLETION=$(brew --prefix)/share/bash-completion/bash_completion
    if ((BASH_MAJOR_VERSION > 3)) && [[ -f "$BASH_COMPLETION" ]]; then
        . "$BASH_COMPLETION"
    fi
    Z=$(brew --prefix)/etc/profile.d/z.sh
    [[ -f "$Z" ]] && . "$Z"
fi

if command -v z &>/dev/null
then
    Z="$HOME/bin/z.sh"
    [[ -f "$Z" ]] && . "$Z"
fi

# for __git_ps1, this actually loads fast
[[ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]] &&
    . /usr/local/etc/bash_completion.d/git-prompt.sh

# http://superuser.com/a/418112
stty stop '' # disable ^S

if command -v pyenv &>/dev/null
then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

too-long() {
    local pfad=${PWD/#$HOME/\~}
    if [[ ${#pfad} -lt 30 ]]; then
        echo -n "${pfad}"
    else
        echo -n ".../$(basename "$pfad")"
    fi
}

git-branch() {
    local plusminus=+-
    ((BASH_MAJOR_VERSION > 3)) && plusminus=$'\u00b1'
    local dirty=$(
        [[ $(git status --porcelain 2>/dev/null) != '' ]] &&
        echo -n " $plusminus")
    __git_ps1 " (%s$dirty)" 2>/dev/null
}

mark=+
((BASH_MAJOR_VERSION > 3)) && mark=$'\u2713'
cross=-
((BASH_MAJOR_VERSION > 3)) && cross=$'\u2717'
check="\[\033[01;37m\]\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\"$mark;
      else echo \"\[\033[01;31m\]\"$cross; fi)\[\e[0m\]"
time="\\A"
user="\[\e[1;37m\]\u\[\e[0m\]"
host="\[\e[1;34m\]\h\[\e[0m\]"
dir="\[\e[1;32m\]\$(too-long)\[\e[0m\]"
branch="\[\e[1;36m\]\$(git-branch)\[\e[0m\]"
root="\\$"
# TODO(alexis): refactor PS1 logic at some point.
# e.g. ✓ 16:33 alexis @ alexis in ~/.dotfiles (master ±) $
PS1=$'\b'" $check $time $user @ $host in $dir$branch $root "

stitle() {
    echo -ne "\033]1;${1:-$(hostname -s)}\033\\"
}

# only for ssh/non-iTerm
[[ "$TERM_PROGRAM" != "iTerm.app" ]] && stitle

((BASH_MAJOR_VERSION < 4)) && (
    echo -n $'\nBash < 4.x; some features '
    echo $'(e.g. advanced autocompletion) won\'t be available.\n') || true
