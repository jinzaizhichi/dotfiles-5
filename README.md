# Dotfiles for Mario Yepes

## Warning

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

## Installation

- Install Git (On MacOS)
- Clone the repo
- Execute the bootstrap script
- Install packages and extensions

### Install Git

If you are using a mac you would need some xcode comands

```bash
xcode-select --install
```

In linux, you probably will get `git` out of the box

### Clone the repo and install the bootstrap script

This can be done with just 1 line of code

```bash
git clone https://github.com/marioy47/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

### Install packages and extensions

Also, you may want to install some common [Homebrew](http://brew.sh/) formulae, some development fonts, some [VSC](https://code.visualstudio.com) plugins and some Vagrant plugins.

```bash
./brew.sh
./brew-cask.sh
./brew-cask-fonts.sh
./lang-plugins.sh
```

### Install additional services

Unfortunatelly [this](http://www.gingerbeardman.com/services/) services are not installable using `brew` but are very much recommended

## Terminal

I'm using [iTerm2](https://www.iterm2.com) terminal emulator with the [Night Owl](https://github.com/nickcernis/iterm2-night-owl) color scheme. More information on how to set it up [here](http://iterm2colorschemes.com/)

For the command interpreter, I'm using [ZIM](https://github.com/zimfw/zimfw) (Zsh IMproved Framework) since `oh-my-zshell` its too slow for my computer.

Updated installations instructions are [here](https://github.com/zimfw/zimfw#installation) but in a nutshell is:

```bash
zsh
git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-${HOME}}/.zim
for template_file in ${ZDOTDIR:-${HOME}}/.zim/templates/*; do
  user_file="${ZDOTDIR:-${HOME}}/.${template_file:t}"
  cat ${template_file} ${user_file}(.N) > ${user_file}.tmp && mv ${user_file}{.tmp,}
done
chsh -s =zsh
source ${ZDOTDIR:-${HOME}}/.zlogin
```

## VIM

I really like `vim` but I don't really have the time to configure all the possible packages and extensions. So I use [Vim Bootstrap]() for configuration.

To install vim bootstrap just execute

```bash
curl -s 'http://vim-bootstrap.com/generate.vim' --data 'langs=javascript&langs=php&langs=html&langs=go&editor=vim' > ~/.vimrc
```

And then execute `vim` normally

## Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

You could also use `~/.extra` to override settings, functions and aliases from Mathias Bynens dotfiles repository. It’s probably better to [fork this repository](https://github.com/mathiasbynens/dotfiles/fork) instead, though.
