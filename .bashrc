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

origin() {
    tr / . | sed 's/.java$//'
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

gw() {
    (cd "$(git rev-parse --show-toplevel)" && "$(git rev-parse --show-toplevel)"/gradlew --daemon --no-scan "$@")
}

# http://stackoverflow.com/a/16178979/2813687
color() (set -o pipefail; "$@" 2>&1>&3 | sed $'s,.*,\e[31m&\e[m,' >&2)3>&1

idea() {
    open -b com.jetbrains.intellij.ce .
}

goland() {
    open -b com.jetbrains.goland .
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
alias 720p='yt-dlp -f "bv[height<=720]+ba"'
alias csv="awk -vFPAT='([^,]+)|(\"[^\"]+\")'"
alias drop="awk -v cols=\$COLUMNS 'length(\$0) < cols'"
alias gg='./godelw'
alias grep='grep -E --color=auto -I'
alias fgrep='fgrep --color=auto -I'
alias ipy='ipython --colors=linux --no-confirm-exit'
alias k=kubectl && complete -o nospace -F __start_kubectl k
# Causes less to automatically exit if the entire file can be displayed on the
# first screen. + display colors
alias less='less -F -X -R'
alias ls='ls --color=auto'
alias pwgen='pwgen -s 32 1'
alias py=python
alias reload='history -n'
alias tree='tree -C'
alias vi=vim
alias vimcognito='vim -u NONE "+set noswapfile nobackup nowritebackup viminfo="'

# tz are hard!
alias denver='TZ=America/Denver date'
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
if [[ -x /opt/homebrew/opt/openjdk/bin/java ]]
then
    export JAVA_HOME=/opt/homebrew/opt/openjdk/
    export PATH="/opt/homebrew/opt/openjdk/bin/:$PATH"
elif [[ -x /usr/libexec/java_home ]]
then
    export JAVA_HOME=$(/usr/libexec/java_home -v '17')
fi

# https://stackoverflow.com/a/42265848/2813687
export GPG_TTY=$(tty)
# avoid anonymous encryption like so:
# gpg: encrypted with RSA key, ID 0x00000000
# gpg: anonymous recipient; trying secret key 0xF82937A7 ...
# gpg: okay, we are the anonymous recipient.
export PASSWORD_STORE_GPG_OPTS='--no-throw-keyids'

# use gnu coreutils on Mac (and use the right man pages)
export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/opt/homebrew/opt/gnu-sed/libexec/gnuman:$MANPATH"
export MANPATH="/opt/homebrew/opt/grep/libexec/gnuman/:$MANPATH"
export MANPATH="/opt/homebrew/opt/findutils/libexec/gnuman/:$MANPATH"

# pipx
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin/:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

if [[ "$PROMPT_COMMAND" != *"history -a;"* ]]
then
    export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
fi
export PYTHONSTARTUP=~/.pythonrc.py
export XDG_CONFIG_HOME=~/.dotfiles/.config

if ((BASH_MAJOR_VERSION > 3)) && [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
fi

if hash brew 2>/dev/null; then
    # for MacOS
    BREW_PREFIX=$(brew --prefix)
    BASH_COMPLETION="$BREW_PREFIX/share/bash-completion/bash_completion"
    if ((BASH_MAJOR_VERSION > 3)) && [[ -f "$BASH_COMPLETION" ]]; then
        . "$BASH_COMPLETION"
    fi
    Z="$BREW_PREFIX/etc/profile.d/z.sh"
    [[ -f "$Z" ]] && . "$Z"
fi

if hash kubectl 2>/dev/null; then
    source <(kubectl completion bash)
fi

if hash fzf 2>/dev/null; then
    if hash rg 2>/dev/null; then
        export FZF_DEFAULT_COMMAND='rg --files'
        export FZF_CTRL_T_COMMAND='rg --files'
    fi

    eval "$(fzf --bash)"
fi

if command -v z &>/dev/null
then
    Z="$HOME/bin/z.sh"
    [[ -f "$Z" ]] && . "$Z"
fi

# for __git_ps1, this actually loads fast
[[ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]] &&
    . /usr/local/etc/bash_completion.d/git-prompt.sh
[[ -f /usr/share/git/git-prompt.sh ]] &&
    . /usr/share/git/git-prompt.sh

[[ -f ~/.cargo/env ]] && . ~/.cargo/env

# http://superuser.com/a/418112
stty stop '' # disable ^S

too-long() {
    local pfad=${PWD/#$HOME/\~}
    if [[ ${#pfad} -lt 30 ]]; then
        echo -n "${pfad}"
    else
        echo -n ".../${pfad##*/}"
    fi
}

find-up () {
  path=$(pwd)
  while [[ "$path" != "" && ! -e "$path/$1" ]]; do
    path=${path%/*}
  done
  [[ -n "$path" ]]
}

git-branch() {
    # used instead of git rev-parse --show-toplevel as it's faster (noticeable
    # when running in an x86 QEMU VM running on ARM)
    if ! find-up .git; then
        return
    fi

    # VM
    if [[ "$HOSTNAME" == arch ]]; then
        echo -n ' (???)'
        return
    fi

    local plusminus=+-
    ((BASH_MAJOR_VERSION > 3)) && plusminus=$'\u00b1'

    local dirty=$(
        [[ -n "$(git status --porcelain 2>/dev/null | head -c 1)" ]] &&
        echo -n " $plusminus")

    __git_ps1 " (%s$dirty)" 2>/dev/null
}

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
mark=+
((BASH_MAJOR_VERSION > 3)) && mark=$'\u2713'
cross=-
((BASH_MAJOR_VERSION > 3)) && cross=$'\u2717'
check="\[\033[01;37m\]\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\"$mark;
      else echo \"\[\033[01;31m\]\"$cross; fi)\[\e[0m\]"
if [[ -n "$SSH_CLIENT" ]]
then
    ssh="\[\e[1;41m\]\[\e[1;97m\]SSH\[\e[0m\] "
fi
time="\\A"
user="\[\e[1;37m\]\u\[\e[0m\]"
host="\[\e[1;34m\]\h\[\e[0m\]"
dir="\[\e[1;32m\]\$(too-long)\[\e[0m\]"
branch="\[\e[1;36m\]\$(git-branch)\[\e[0m\]"
root="\\$"
# TODO(alexis): refactor PS1 logic at some point.
# e.g. ✓ 16:33 alexis @ alexis in ~/.dotfiles (master ±) $
PS1="$check $ssh$time $user @ $host in $dir$branch $root "

stitle() {
    echo -ne "\033]1;${1:-${HOSTNAME%%.*}}\033\\"
}

_venvname() {
    if [[ -n "$1" ]]
    then
        echo -n "$1"
        return
    fi

    local mayberepo=$(git rev-parse --show-toplevel 2>/dev/null)

    if [[ -n "$mayberepo" ]]
    then
        basename "$mayberepo"
        return
    fi

    basename "$PWD"
}

venv() {
    [[ ! -d ~/.venvs ]] && mkdir ~/.venvs
    local venv=$(_venvname "$1")
    [[ ! -d ~/.venvs/"$venv" ]] && python3 -m venv ~/.venvs/"$venv"

    workon "$venv"
}

venvs() {
    ls --format=single-column ~/.venvs
}

workon() {
    . ~/.venvs/"$(_venvname "$1")"/bin/activate
}

if [[ -f ~/.rye/env ]]
then
    . ~/.rye/env
    eval "$(rye self completion)"
fi

# only for ssh/non-iTerm
[[ "$TERM_PROGRAM" != "iTerm.app" ]] && PROMPT_COMMAND="stitle; $PROMPT_COMMAND"

((BASH_MAJOR_VERSION < 4)) && (
    echo -n $'\nBash < 4.x; some features '
    echo $'(e.g. advanced autocompletion) won\'t be available.\n') || true
