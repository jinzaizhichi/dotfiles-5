# Dotfiles for Mario Yepes

## Warning

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

## Installation

- Install Git (On MacOS and Windows)
- Log in to the App Store (On MacOS)
- Clone the repo
- Source the `bootstrap.sh` script
- Install packages and extensions

### Install Git

If you are using a mac you would need some xcode comands

```bash
xcode-select --install
```

In linux, you probably will get `git` right out of the box

### Login to the App Store

On mac, the installation of apps is done using [Homebrew](https://brew.sh/) and the unofficial [Mac App Store command line interface](https://github.com/mas-cli/mas). And for the latter to work, you need to log in into the Apps Store app first.

### Clone the repo and source the bootstrap script

This can be done with the following commands

```bash
git clone https://github.com/marioy47/dotfiles.git
cd dotfiles
source bootstrap.sh
```

This will create several _symlinks_ into your home directory. That's why you **should never remove the dotfiles directory**.

### Install packages and extensions

Also, you may want to install some common [Homebrew](http://brew.sh/) formulae, some development fonts, some [VSC](https://code.visualstudio.com) plugins and some Vagrant plugins.

```bash
sudo -v
brew bundle
source plugins.sh
```

### Install additional services

Unfortunatelly [this](http://www.gingerbeardman.com/services/) services are not installable using `brew` but are very much recommended

## Terminal setup

I'm using [iTerm2](https://www.iterm2.com) terminal emulator on Mac with a customized version of the the [Material Design Color Scheme](https://github.com/MartinSeeler/iterm2-material-design). More information on how to set it up [here](http://iterm2colorschemes.com/)

There is also an [Alacritty](https://github.com/alacritty/alacritty/) dotfile configuration if you are more interested in an speedy terminal.

### Alacritty Terminfo

```bash
cd ~/Downloads/
curl https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info -O 
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
```

## Add custom commands without creating a new fork

If the `~/.extra` file exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

## Key Repeat issue on Mac

If you use VIM emulation on Visual Studio code or Sublime Text you'll notice that keeping the `h,j,k,l` keys pressed doesn't repeat the movement. For that you have to execute this on the terminal:

```bash
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
```
