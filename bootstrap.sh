#!/usr/bin/env bash

cd "$(dirname "$0")"
git pull origin master;

PWD=`pwd`

# Make colorschemes compatible with italics
tic -c init/tmux-256color.terminfo
tic -x init/xterm-256color-italic.terminfo

for file in `ls -a` ; do
	if [ $file == ".git" ]; then continue; fi
	if [ $file == ".DS_Store" ]; then continue; fi
	if [ $file == ".bootstrap.sh" ]; then continue; fi
	if [ $file == ".brew.sh" ]; then continue; fi
	if [ $file == ".brew-cask.sh" ]; then continue; fi
	if [ $file == "README.md" ]; then continue; fi
	if [ $file == "LICENSE-MIT.txt" ]; then continue; fi
	if [ ! -f $file ]; then continue; fi
	if [[ $file == *".sh" ]]; then continue; fi

	ln -nfs $PWD/$file $HOME/$file
done

echo "Next steps:"
echo "Re-stablish your ssh keys in .ssh"
echo "Install Xcode with: xcode-select --install"
echo "Install MacOS packages with: ./brew.sh && ./brew-cask.sh && ./brew-fonts.sh"
echo "Install ZIM with: https://github.com/zimfw/zimfw"
