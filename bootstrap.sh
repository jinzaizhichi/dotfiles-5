#!/usr/bin/env bash

cd "$(dirname "$0")"
# git pull origin master;

PWD=`pwd`

# Make colorschemes compatible with italics
tic -c init/tmux-256color.terminfo
tic -x init/xterm-256color-italic.terminfo

# Link DotFiles on the home directory
for file in `ls -a` ; do
	if [ $file == ".git" ]; then continue; fi
	if [ $file == ".DS_Store" ]; then continue; fi
	if [ $file == ".zshrc" ]; then continue; fi
	if [[ $file == *".sh" ]]; then continue; fi
	if [[ $file == *".md" ]]; then continue; fi
	if [[ $file == *".ps1" ]]; then continue; fi
	if [ $file == "Brewfile" ]; then continue; fi
	if [ ! -f $file ]; then continue; fi

    echo $file;

	ln -nfs ${PWD}/$file ${HOME}/$file
done

# Create or append content to .zshrc
if [ -f ~/.zshrc ]; then
	cat ${PWD}/.zshrc >> ~/.zshrc
else
	cp .zshrc $HOME/
fi

# .ini files in .config
mkdir -p ~/.config
ln -nfs ${PWD}/.config/nvim ~/.config/nvim
ln -nfs ${PWD}/.config/lf ~/.config/lf

echo 'Next steps:'
echo 'Re-stablish your ssh keys in .ssh'
echo 'Install homebrew with: bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'
echo 'Install oh-my-zsh with: bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
echo 'Log in into the Apple App Store'
echo 'Install MacOS packages with: "sudo -v && brew bundle"'
echo 'Install Plugins and extensions with : "source plugins.sh"'
