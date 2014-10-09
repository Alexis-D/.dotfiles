### How to deploy these config files

    git clone --recursive https://github.com/Alexis-D/.dotfiles.git
    cd .dotfiles
    . deploy.sh

Vim plugins are managed using Pathogen (see
[tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)).

Remember to `sudo pip install flake8 virtualenv virtualenvwrapper` the 1st
time to get some python-related tools.

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

1. `System Preferences > Keyboard > Modifier Keys > Caps Lock (⇪) Key:
   ^ Control`
2. Karabiner: `Control_L to Control_L (+ When you type Control_L only, send
   Escape)`
3. Karabiner's `private.xml`:

        <item>
            <name>Shift Right to Control A</name>
            <identifier>private.shift_right_to_ctrl_a</identifier>
            <autogen>__KeyToKey__ KeyCode::SHIFT_R, KeyCode::A, ModifierFlag::CONTROL_L</autogen>
        </item>

4. Seil: `Other Keys > Change Escape: 80` (which is `F19`, and the use that to
   change iTerm's preferences, `⌘,`).
