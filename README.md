### How to deploy these config files

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ssh-keygen -t rsa -C "Alexis Daboville <adaboville@...>"
    git clone --recursive git@github.com:Alexis-D/.dotfiles.git
    cd .dotfiles
    . deploy.sh

Vim plugins are managed using Pathogen (see
[tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)).

### A note about keyboard configuration

1. Still WIP on Sierra

### A note about Homebrew and useful formulas

    brew tap caskroom/cask
    brew tap homebrew/cask-fonts

    brew install coreutils findutils gawk gnu-sed gnu-tar grep gzip netcat ssh-copy-id tree watch
    brew install gpg2 pass pinentry pinentry-mac pwgen
    brew install certigo duti git jq pup pv screen tofrodos unrar vmtouch youtube-dl
    brew install bash bash-completion@2 docker-completion docker-compose-completion z
    brew install htop nmap the_silver_searcher vim
    brew install python python3 pyenv pyenv-virtualenv

    brew cask install caffeine flux iterm2 karabiner-elements keyboard-cleaner licecap spectacle vlc
    brew cask install font-inconsolata font-jetbrains-mono font-ubuntu

# A note about Python

    pyenv install 3.9.4
    pyenv global 3.9.4
    pyenv shell 3.9.4
    pip install ipython

### A note about Chrome

* [Figure it Out](https://chrome.google.com/webstore/detail/figure-it-out/lialghmkggocekkpjbnoacohodmckfke?hl=en)
* [HTTPS Everywhere](https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp/related)
* [ModHeader](https://chrome.google.com/webstore/detail/modheader/idgpnmonknjnojddfkpgkljpfnnfcklj?hl=en)
* [SourceGraph](https://chrome.google.com/webstore/detail/sourcegraph/dgjhfomjieaadpoljlnidmbgkdffpack)
* [Tab Pinner](https://chrome.google.com/webstore/detail/tab-pinner-keyboard-short/mbcjcnomlakhkechnbhmfjhnnllpbmlh)
* [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) ([`fake-news.txt`](https://raw.githubusercontent.com/ryanbr/fanboy-adblock/master/fake-news.txt))
* [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)

```
map <c-f> scrollFullPageDown
map <c-b> scrollFullPageUp
map p togglePinTab
map u restoreTab
map e Vomnibar.activateEditUrl
map E Vomnibar.activateEditUrlInNewTab
map Y copyCurrentUrl
```

```
enfr: http://www.wordreference.com/enfr/%s
fren: http://www.wordreference.com/fren/%s
g: http://google.com/search?q=%s
wa: https://www.wolframalpha.com/input/?i=%s
y: https://www.youtube.com/results?search_query=%s
```

```
https?://github.com/* btye
```

### A note about MacOS

* [How to enable the three-finger drag gesture on Mac OS X](http://www.idownloadblog.com/2015/06/25/three-finger-drag-gesture-os-x-el-capitan/)
* [How to Turn Off Multitouch Trackpad Look Up in OS X](https://www.tekrevue.com/tip/how-to-turn-off-multitouch-trackpad-look-up-in-os-x/)
* [Stop Spaces from Rearranging Themselves in Mac OS X](http://osxdaily.com/2011/11/12/stop-spaces-rearranging-mac-os-x/)
* `Keyboard -> Text` -> Disable everything.
* `Keyboard -> Touch Bar shows` = `Expanded Control Strip`
* `Keyboard -> Shortcuts -> Services -> Search man Page index in Terminal` -> Disable
* Setup hot corners
* `iTerm2` -> right click in Dock, `Options -> Assign To -> All Desktops`
* `Sound -> Show volume in menu bar`
* `Displays -> Disable True Tone`
* `Chrome -> ⌘, -> Allow Chrome sign-in -> Disable`
* `Karabiner-Elements -> Function keys -> Check Use all F1, F2, etc...`
