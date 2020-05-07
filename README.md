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

    brew install findutils gnu-sed gnu-tar grep
    brew install bash bash-completion@2 coreutils docker-completion docker-compose-completion duti ffmpeg gawk git gpg2 gzip jq netcat pinentry pinentry-mac pass pup pv pwgen python python3 screen ssh-copy-id the_silver_searcher tofrodos tree unrar vim vmtouch watch youtube-dl z
    brew cask install caffeine flux font-inconsolata iterm2 karabiner-elements keyboard-cleaner licecap spectacle vlc

### A note about Python

    sudo pip install csvkit data_hacks flake8 ipython jupyter virtualenv virtualenvwrapper

### A note about Chrome

* [Figure it Out](https://chrome.google.com/webstore/detail/figure-it-out/lialghmkggocekkpjbnoacohodmckfke?hl=en)
* [HTTPS Everywhere](https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp/related)
* [ModHeader](https://chrome.google.com/webstore/detail/modheader/idgpnmonknjnojddfkpgkljpfnnfcklj?hl=en)
* [SourceGraph](https://chrome.google.com/webstore/detail/sourcegraph/dgjhfomjieaadpoljlnidmbgkdffpack)
* [Tab Pinner](https://chrome.google.com/webstore/detail/tab-pinner-keyboard-short/mbcjcnomlakhkechnbhmfjhnnllpbmlh)
* [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)

### A note about MacOS

* [How to enable the three-finger drag gesture on Mac OS X](http://www.idownloadblog.com/2015/06/25/three-finger-drag-gesture-os-x-el-capitan/)
* [How to Turn Off Multitouch Trackpad Look Up in OS X](https://www.tekrevue.com/tip/how-to-turn-off-multitouch-trackpad-look-up-in-os-x/)
* [Stop Spaces from Rearranging Themselves in Mac OS X](http://osxdaily.com/2011/11/12/stop-spaces-rearranging-mac-os-x/)
