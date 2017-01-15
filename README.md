### How to deploy these config files

    git clone --recursive https://github.com/Alexis-D/.dotfiles.git
    cd .dotfiles
    . deploy.sh

Vim plugins are managed using Pathogen (see
[tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)).

### Other stuff that's worth installing, but not handled here

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

    brew tap homebrew/dupes
    brew tap homebrew/versions
    brew install caskroom/cask/brew-cask

    # --with-default-names
    brew install bash homebrew/versions/bash-completion2 choose-gui coreutils distribution findutils gawk git gnu-sed gnu-tar homebrew/dupes/grep homebrew/dupes/gzip netcat python python3 q parallel pv homebrew/dupes/screen ssh-copy-id the_silver_searcher tofrodos tree unrar watch youtube-dl z
    brew cask install caffeine flux gpg2 intellij-idea-ce karabiner licecap mou pass pinentry-mac pycharm-ce seil spectacle

### A note about Python

    sudo pip install csvkit data_hacks flake8 ipython jupyter virtualenv virtualenvwrapper

### A note about Chrome

* [Block Quora Login Popup](https://chrome.google.com/webstore/detail/block-quora-login-popup/fkbnfnaikpdihahjljbigedkangbieih)
* [Ghostery](https://chrome.google.com/webstore/detail/ghostery/mlomiejdfkolichcflejclcbmpeaniij)
* [HTTPS Everywhere](https://www.eff.org/https-everywhere)
* [Office Editing for Docs, Sheets & Slides](https://chrome.google.com/webstore/detail/office-editing-for-docs-s/gbkeegbaiigmenfmjfclcdgdpimamgkj)
* [~~Tab Pinner~~](https://chrome.google.com/webstore/detail/tab-pinner-keyboard-short/mbcjcnomlakhkechnbhmfjhnnllpbmlh)
* [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)
* [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)
  
      https://github.com/* t
      https://github.palantir.build/* t
      
      map π togglePinTab
      
      g: https://www.google.com/search?q=%s Google
      gh: https://github.com/search?q=%s GitHub
      gi: https://github.palantir.build/search?q=%s GitHub
      gm: https://www.google.com/maps?q=%s Google Maps
      hn: https://www.hnsearch.com/search#request/submissions&q=%s&start=0 HackerNews
      so: http://stackoverflow.com/search?q=%s StackOverflow
      translate: http://translate.google.com/?source=osdd#auto|auto|%s Google Translator
      w: http://en.wikipedia.org/wiki/Special:Search?search=%s Wikipedia
      wa: http://www.wolframalpha.com/input/?i=%s Wolfram|Alpha
      yt: http://www.youtube.com/results?search_query=%s YouTube
