#!/usr/bin/env bash

echo "Update repository..."
git pull

echo "Getting Pathogen..."
mkdir -p .vim/autoload
curl -Sso .vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

echo "Init/update submodules..."
git submodule update --init --recursive

cd

for i in $(ls -A $OLDPWD)
do
    if [ "$i" != "deploy.sh" -a "$i" != ".git" -a "$i" != "README.md" ]
    then
        echo "Symlinking $i..."
        rm -rf $i && ln -s "$OLDPWD/$i"
    fi
done

echo "Sourcing .bashrc..."
. .bashrc

echo "Restoring location..."
cd $OLDPWD
