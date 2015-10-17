# Dotfiles for Mario Yepes

![](http://i.imgur.com/DAnmvYC.png)


## Warning

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

## Installation

### Using Git and the bootstrap script
(On Mac OS you might need to install xcode select utils `xcode-select --install`)

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`).

```bash
git clone https://github.com/marioy47/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:
```bash
source bootstrap.sh
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

You could also use `~/.extra` to override settings, functions and aliases from Mathias Bynens dotfiles repository. It’s probably better to [fork this repository](https://github.com/mathiasbynens/dotfiles/fork) instead, though.

## Mac OS X
If you are using a mac you would need some xcode comands

```bash
xcode-select --install
```

And maybe some OS X defaults **NOTE: You might not like this defaults**

```bash
./.osx
```

### Install Homebrew formulae
Also, you may want to install some common [Homebrew](http://brew.sh/) formulae

```bash
./brew.sh
./brew-cask.sh
```

### iTerm Color Scheme
I'm using [Solarized Dark Higer contrast](https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Solarized%20Dark%20Higher%20Contrast.itermcolors). More information on how to set it up [here](http://iterm2colorschemes.com/)

## Other Tools

### Install OH My Z Shell
I really like z shell. And [this](http://ohmyz.sh/) is the best zsh framework in my opinion

```
curl -L http://install.ohmyz.sh | sh"
```

### Install rbenv, pyenv and nvm
If you juggle between diferent versions, this is the way to go

```
rbenv install 2.0.0-p247 #(or the latest version)"
nvm install stable && nvm alias default stable"
pyenv install 2.7.8 #(or the latest version)"
```

