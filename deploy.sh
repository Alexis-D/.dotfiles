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

    echo "Make keys repeat themselves in Intellij..."
    defaults write com.jetbrains.intellij.ce ApplePressAndHoldEnabled -bool false
fi

echo "Sourcing ~/.bashrc..."
. ~/.bashrc
