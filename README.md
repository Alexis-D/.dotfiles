### How to deploy these config files

    ssh-keygen -t rsa -C "Alexis Daboville <adaboville@...>"
    git clone --recursive git@github.com:Alexis-D/.dotfiles.git
    cd .dotfiles
    . deploy.sh

Vim plugins are managed using Pathogen (see
[tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)).

### Other stuff that's worth doing/installing, but not handled here

* [Homebrew](http://brew.sh/) (remember to install `coreutils`, `findutils`,
  `gawk`, `gnu-sed`, `screen`, `python3`, `bash`, ...)
* [f.lux](http://justgetflux.com/)
* [`ssh-installkeys`](http://www.catb.org/~esr/ssh-installkeys/) or
  `ssh-copy-id` ([man page](http://linux.die.net/man/1/ssh-copy-id))
* [`sshfs`](http://fuse.sourceforge.net/sshfs.html)
* [Karabiner](https://pqrs.org/osx/karabiner/)
  / [Seil](https://pqrs.org/osx/karabiner/seil.html.en)
* [`bash-completion`](http://bash-completion.alioth.debian.org/)
* [Spectacle](http://spectacleapp.com/)
* [`z`](https://github.com/rupa/z)

### A note about keyboard configuration

1. `deploy.sh` does all the magic.

### A note about Homebrew and useful formulas

    brew tap caskroom/cask
    brew tap caskroom/fonts

    # --with-default-names
    brew install bash bash-completion@2 choose-gui coreutils distribution ffmpeg findutils gawk git gpg-agent gpg2 gnu-sed gnu-tar grep gzip jq netcat pinentry pinentry-mac parallel pass pup pv pwgen python python3 q screen ssh-copy-id the_silver_searcher tofrodos tree unrar vim watch youtube-dl z
    brew cask install caffeine flux handbrake intellij-idea-ce iterm2 java karabiner-elements licecap spectacle

### A note about Python

    sudo pip install csvkit data_hacks flake8 font-inconsolata ipython jupyter virtualenv virtualenvwrapper

### A note about Chrome

* [Block Quora Login Popup](https://chrome.google.com/webstore/detail/block-quora-login-popup/fkbnfnaikpdihahjljbigedkangbieih)
* [Ghostery](https://chrome.google.com/webstore/detail/ghostery/mlomiejdfkolichcflejclcbmpeaniij)
* [HTTPS Everywhere](https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp/related)
* [Office Editing for Docs, Sheets & Slides](https://chrome.google.com/webstore/detail/office-editing-for-docs-s/gbkeegbaiigmenfmjfclcdgdpimamgkj)
* [Tab Pinner](https://chrome.google.com/webstore/detail/tab-pinner-keyboard-short/mbcjcnomlakhkechnbhmfjhnnllpbmlh)
* [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)
