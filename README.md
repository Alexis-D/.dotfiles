Reminder to myself, how to deploy the files:

    git clone https://github.com/Alexis-D/.dotfiles.git
    cd .dotfiles
    . deploy.sh

Vim plugins are managed (as much as possible) using the excellent Pathogen
plugin created by Tim Pope.

Submodules are used where possible.

You'll need to `sudo pip install flake8 virtualenv virtualenvwrapper` first
(not done in the deploy script because it requires root).
