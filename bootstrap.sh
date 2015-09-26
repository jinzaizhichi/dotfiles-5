#!/usr/bin/env bash

cd "$(dirname "$0")"
git pull origin master;

PWD=`pwd`


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
echo "Install MacOS packages with: ./brew.sh && ./brew-cask.sh"
echo "Install oh-my-zsh with: curl -L http://install.ohmyz.sh | sh"
echo "Install ruby with: rbenv install 2.0.0-p247 (or the latest version)"
echo "Install node with: nvm install stable && nvm alias default stable"
echo "Install python with: pyenv install 2.7.8 (or the latest version)"
