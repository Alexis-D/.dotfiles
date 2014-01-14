How to deploy the files:

    git clone --recursive https://github.com/Alexis-D/.dotfiles.git
    cd .dotfiles
    . deploy.sh

Vim plugins are managed using Pathogen (see
[tpope/vim-pathogen](https://github.com/tpope/vim-pathogen).

Remember to `sudo pip install flake8 virtualenv virtualenvwrapper` the 1st
time to get some python-related tools.

Other stuff that's worth installing, but not handled here:

* [Homebrew](http://brew.sh/)
* [f.lux](http://justgetflux.com/)
* [`ssh-installkeys`](http://www.catb.org/~esr/ssh-installkeys/) or `ssh-copy-id`
  ([man page](http://linux.die.net/man/1/ssh-copy-id))
* [`sshfs`](http://fuse.sourceforge.net/sshfs.html)
* [KeyRemap4MacBook](https://pqrs.org/macosx/keyremap4macbook/)
* [`bash-completion`](http://bash-completion.alioth.debian.org/)
