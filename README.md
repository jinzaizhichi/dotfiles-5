# Dotfiles for Mario Yepes

## Warning

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

## Installation

- Install Git (On MacOS and Windows)
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

This can be done with the following commands

```bash
git clone https://github.com/marioy47/dotfiles.git
cd dotfiles
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

For the command interpreter, I'm using zshell with [oh-my-zshell](https://ohmyz.sh/). You can install it with

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## VIM

I really like `vim` but I don't really have the time to configure all the possible packages and extensions. So I use [Vim Bootstrap](https://github.com/editor-bootstrap/vim-bootstrap) for configuration.

To install vim bootstrap just execute

```bash
curl -s 'http://vim-bootstrap.com/generate.vim' --data 'langs=javascript&langs=typescript&langs=php&langs=html&langs=python&editor=vim' > ~/.vimrc
```

And then execute `vim` normally

## Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

You could also use `~/.extra` to override settings, functions and aliases from Mathias Bynens dotfiles repository. It’s probably better to [fork this repository](https://github.com/mathiasbynens/dotfiles/fork) instead, though.
