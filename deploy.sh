#!/usr/bin/env bash

echo "Update repository..."
git pull

echo "Getting Pathogen..."
mkdir -p .vim/autoload
curl -LSso .vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

echo "Init/update submodules..."
git submodule update --init --recursive

pushd ~
find "$OLDPWD"\
    -maxdepth 1\
    -mindepth 1\
    ! -name deploy.sh\
    ! -name .git\
    ! -name Brewfile\
    ! -name README.md\
    ! -name com.googlecode.iterm2.plist\
    ! -name DefaultKeyBinding.dict\
    -print0 | while IFS= read -d $'\0' -r file
do
    rm -rf "${file##*/}" && ln -s "$file"
done

popd
if [[ "$OSTYPE" == "darwin"* ]]
then
    echo "Setting MacOS Emacs keybindings..."
    mkdir -p ~/Library/KeyBindings/
    cp DefaultKeyBinding.dict ~/Library/KeyBindings/

    echo "Setting Outlook as the default mail client..."
    duti -s com.microsoft.outlook mailto
    duti -s org.videolan.vlc .webm viewer
    duti -s org.videolan.vlc .mp4 viewer

    echo "Make keys repeat themselves in Intellij..."
    defaults write com.jetbrains.intellij.ce ApplePressAndHoldEnabled -bool false
    echo "Make keys repeat themselves in PyCharm..."
    defaults write com.jetbrains.pycharm.ce ApplePressAndHoldEnabled -bool false
    echo "Make keys repeat themselves in VSCodium..."
    defaults write com.vscodium ApplePressAndHoldEnabled -bool false
fi

if hash brew 2>/dev/null
then
    printf "✅ \032[0;31mbrew is available, will proceed with Brewfile install.\033[0m\n" >&2
    brew bundle install --no-lock
else
    printf "❌ \033[0;31mNo brew, skipping brew bundle install.\033[0m\n" >&2
fi

echo "Sourcing ~/.bashrc..."
. ~/.bashrc
