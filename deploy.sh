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
    if [ "$i" != "deploy.sh" -a "$i" != ".git" -a "$i" != "README.md" -a "$i" != "karabiner.sh" -a "$i" != "seil.sh" ]
    then
        echo "Symlinking $i..."
        rm -rf "$i" && ln -s "$OLDPWD/$i"
    fi
done

echo "Restoring keyboard settings..."

if [ -d ~/Library/Application\ Support/Karabiner/ ]
then
    cat > ~/Library/Application\ Support/Karabiner/private.xml <<EOF
<?xml version="1.0"?>
<root>
    <item>
        <name>Shift Right to Control A</name>
        <identifier>private.shift_right_to_ctrl_a</identifier>
        <autogen>__KeyOverlaidModifier__ KeyCode::SHIFT_R, KeyCode::SHIFT_R, KeyCode::A, ModifierFlag::CONTROL_L</autogen>
    </item>
</root>
EOF
fi

# /dev/null in case this is ran on non-MacOS
./karabiner.sh &>/dev/null
./seil.sh &>/dev/null

echo "Restoring location..."
cd $OLDPWD

echo "Sourcing .bashrc..."
. .bashrc
