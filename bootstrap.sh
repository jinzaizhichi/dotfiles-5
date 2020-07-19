#!/usr/bin/env bash

cd "$(dirname "$0")"
# git pull origin master;

PWD=`pwd`

# Make colorschemes compatible with italics
tic -c init/tmux-256color.terminfo
tic -x init/xterm-256color-italic.terminfo

for file in `ls -a` ; do
	if [ $file == ".git" ]; then continue; fi
	if [ $file == ".DS_Store" ]; then continue; fi
	if [ $file == ".zshrc" ]; then continue; fi
	if [[ $file == *".sh" ]]; then continue; fi
	if [[ $file == *".md" ]]; then continue; fi
	if [ $file == "Brewfile" ]; then continue; fi
	if [ ! -f $file ]; then continue; fi

    echo $file;

	ln -nfs $PWD/$file $HOME/$file
done

cp .zshrc $HOME/

echo 'Next steps:'
echo 'Re-stablish your ssh keys in .ssh'
echo 'Install homebrew with: bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'
echo 'Install oh-my-zsh with: bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
echo 'Install MacOS packages with: "sudo -v && brew bundle"'
echo 'Install Plugins and extensions with : "source plugins.sh"'
