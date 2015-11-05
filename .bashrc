# Check for an interactive session
[[ -z "$PS1" ]] && return

BASH_MAJOR_VERSION=${BASH_VERSINFO[0]}

# create an archive from a directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

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

bump() {
    if [[ $# -ne 1 ]]; then
        return 1
    elif ! git rev-parse 2>/dev/null; then
        return 2
    fi

    git fetch  # fetch to get the most recent tags
    local currentVersion=$(git tag
        | egrep '^v\d+.\d+.\d+$'
        | sed 's/^v//'
        | sort -V
        | tail -n 1)

    case $1 in
        major)
            local newVersion=$(echo "$currentVersion"
                | awk -F. '{ printf "%d.0.0", $1 + 1 }') ;;

        minor)
            local newVersion=$(echo "$currentVersion"
                | awk -F. '{ printf "%d.%d.0", $1, $2 + 1 }') ;;

        patch)
            local newVersion=$(echo "$currentVersion"
                | awk -F. '{ printf "%d.%d.%d", $1, $2, $3 + 1 }') ;;

        *) return 3 ;;
    esac

    git checkout develop &&
    git pull --rebase &&
    git checkout master &&
    git pull --rebase &&
    git merge --no-ff -m "Update to $newVersion" develop &&
    git tag "v$newVersion" &&
    git push --tags &&
    git push &&
    git checkout develop &&
    git merge --ff master &&
    git push &&
    echo &&
    echo "Successfully bumped version to $newVersion"
}

java6() {
    JAVA_HOME=$(/usr/libexec/java_home -v '1.6') "$@"
}

java7() {
    JAVA_HOME=$(/usr/libexec/java_home -v '1.7') "$@"
}

java8() {
    JAVA_HOME=$(/usr/libexec/java_home -v '1.8') "$@"
}

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[1;31m'        # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

popen() {
    qlmanage -p "$1" &>/dev/null &
}

nowrap() {
    cut -c1-$COLUMNS
}

root() {
    cd "$(git rev-parse --show-toplevel)"
}

# http://stackoverflow.com/a/16178979/2813687
color() (set -o pipefail; "$@" 2>&1>&3 | sed $'s,.*,\e[31m&\e[m,' >&2)3>&1

# tz2tz <LocalDateTime> <fromTz> <toTz>
tz2tz() {
    TZ=$3 gdate --date "TZ=\"$2\" ${1/T/ }" -Iseconds
}

alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias .='PS1= builtin .'
alias ?=pydoc
alias ??=pydoc2
alias csv="awk -vFPAT='([^,]+)|(\"[^\"]+\")'"
alias eclipse='/Applications/eclipse/Eclipse.app/Contents/MacOS/eclipse'
alias fix-mbp-camera='sudo killall VDCAssistant'
alias grep='grep -E --color=auto -n -I'
alias gw='./gradlew --daemon --info'
alias fgrep='fgrep --color=auto -n -I'
alias ipy='ipython --no-confirm-exit'
alias ipy2='ipython2 --no-confirm-exit'
alias ipy3='ipython3 --no-confirm-exit'
# Causes less to automatically exit if the entire file can be displayed on the
# first screen. + display colors
alias less='less -F -X -R'
alias ls='ls --color=auto'
alias mou='open /Applications/Mou.app'
alias py2=python2
alias py3=python3
alias py=python
alias reload='history -n'
alias tree='tree -C'
alias venv=mkvirtualenv
alias vi=vim

# tz are hard!
alias fr='TZ=Europe/Paris date'
alias ny='TZ=America/New_York date'
alias sf='TZ=US/Pacific date'
alias tk='TZ=Asia/Tokyo date'
alias uk='TZ=Europe/London date'
alias utc='TZ=UTC date'

shopt -s checkwinsize
shopt -s cdspell
(( BASH_MAJOR_VERSION > 3 )) && shopt -s globstar
shopt -s histappend

export EDITOR=vim
export HISTCONTROL=ignorespace
export HISTTIMEFORMAT='%F %T - '
export HISTFILESIZE=100000
export HISTSIZE=100000
export GRADLE_OPTS=-Xmx2g
[[ -x /usr/libexec/java_home ]] &&
    export JAVA_HOME=$(/usr/libexec/java_home -v '1.7')

# use gnu coreutils on Mac (and use the right man pages)
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/grep/share/man/:$MANPATH"
export MANPATH="/usr/local/opt/findutils/share/man/:$MANPATH"

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/bin/:$PATH"
export PATH="/usr/local/opt/findutils/bin/:$PATH"
export PATH="/usr/local/bin:$PATH"

export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export PYTHONSTARTUP=~/.pythonrc.py
export VIRTUALENVWRAPPER_HOOK_DIR=~/.virtualenvs_hooks
export WORKON_HOME=~/.virtualenvs

# use bash-completion if available (obviously...)
((BASH_MAJOR_VERSION > 3)) && [[ -f /etc/bash_completion ]] &&
    . /etc/bash_completion

if hash brew 2>/dev/null; then
    # for MacOS
    BASH_COMPLETION=$(brew --prefix)/share/bash-completion/bash_completion
    Z=$(brew --prefix)/etc/profile.d/z.sh
    ((BASH_MAJOR_VERSION > 3)) && [[ -f "$BASH_COMPLETION" ]] &&
        . "$BASH_COMPLETION"
    [[ -f "$Z" ]] && . "$Z"
fi

# use virtualenvwrapper, if available...
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] &&
    . /usr/local/bin/virtualenvwrapper.sh

# for __git_ps1
[[ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]] &&
    . /usr/local/etc/bash_completion.d/git-prompt.sh

bind 'set match-hidden-files off'
bind C-w:backward-kill-word
stty stop '' # disable ^S

envfile="$HOME/.gpg-agent-info"
if [[ -e "$envfile" ]] && kill -0 $(awk -F: '/GPG_AGENT_INFO/ {print $2}' "$envfile") 2>/dev/null; then
    . "$envfile"
else
    eval "$(gpg-agent --daemon --write-env-file "$envfile")"
fi
export GPG_AGENT_INFO

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
PS1=" $check $time $user @ $host in $dir$branch $root "

stitle() {
    echo -ne "\033]1;${1:-$(hostname -s)}\033\\"
}

# only for ssh/non-iTerm
[[ "$TERM_PROGRAM" != "iTerm.app" ]] && stitle

((BASH_MAJOR_VERSION < 4)) && (
    echo -n $'\nBash < 4.x; some features '
    echo $'(e.g. advanced autocompletion) won\'t be available.\n') || true
