### How to deploy these config files

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ssh-keygen -t ed25519 -C "Alexis Daboville <adaboville@...>"
    git clone --recursive git@github.com:Alexis-D/.dotfiles.git
    sudo chsh -s /opt/homebrew/bin/bash alexis
    cd .dotfiles
    bash
    . deploy.sh
    # git submodule update --remote # update all submodule to whatever origin's HEAD is pointing to

Vim plugins are managed using Pathogen (see
[tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)).

### A note about Chrome

* [ModHeader](https://chrome.google.com/webstore/detail/modheader/idgpnmonknjnojddfkpgkljpfnnfcklj?hl=en)
* [SourceGraph](https://chrome.google.com/webstore/detail/sourcegraph/dgjhfomjieaadpoljlnidmbgkdffpack)
* [Tab Pinner](https://chrome.google.com/webstore/detail/tab-pinner-keyboard-short/mbcjcnomlakhkechnbhmfjhnnllpbmlh)
* [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) ([`fake-news.txt`](https://raw.githubusercontent.com/ryanbr/fanboy-adblock/master/fake-news.txt), [`all.txt`](https://raw.githubusercontent.com/quenhus/uBlock-Origin-dev-filter/main/dist/google/all.txt))
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
m: https://www.google.com/maps?q=%s
sg: https://sourcegraph.com/search?q=%s
w: https://www.wikipedia.org/w/index.php?title=Special:Search&search=%s
wa: https://www.wolframalpha.com/input/?i=%s
y: https://www.youtube.com/results?search_query=%s
```

```
https?://github.com/* btye
```

### A note about Python

Install [Rye](https://rye.astral.sh/).

### A note about Firefox

* [Tridactyl](https://tridactyl.xyz/)
* [SponsorBlock](https://sponsor.ajay.app/)
* [uBlock Origin](https://github.com/gorhill/uBlock#ublock-origin)

In `about:config`, disable `dom.private-attribution.submission.enabled`.

### A note about MacOS

* [How to enable the three-finger drag gesture on Mac OS X](http://www.idownloadblog.com/2015/06/25/three-finger-drag-gesture-os-x-el-capitan/)
* [How to Turn Off Multitouch Trackpad Look Up in OS X](https://www.tekrevue.com/tip/how-to-turn-off-multitouch-trackpad-look-up-in-os-x/)
* [Stop Spaces from Rearranging Themselves in Mac OS X](http://osxdaily.com/2011/11/12/stop-spaces-rearranging-mac-os-x/)
* `Keyboard -> Keyboard shortcuts -> Services -> Text` -> Disable everything
  (<https://intellij-support.jetbrains.com/hc/en-us/articles/360005137400-Cmd-Shift-A-hotkey-opens-Terminal-with-apropos-search-instead-of-the-Find-Action-dialog>).
* Setup hot corners
* `iTerm2` -> right click in Dock, `Options -> Assign To -> All Desktops`
* `Control Center -> Show volume in menu bar` + `Bluetooth`
* `Displays -> Disable True Tone`
* `Karabiner-Elements -> Function keys -> Check Use all F1, F2, etc...`
