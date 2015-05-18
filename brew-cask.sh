# Install native apps

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
sudo -v

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# daily
brew cask install dropbox
cask install flux
brew cask install spectacle
brew cask install caffeine
brew cask install google-drive

# dev
brew cask install iterm2
brew cask install sublime-text3
brew cask install imagealpha
brew cask install imageoptim
brew cask install lisanet-gimp
brew cask install sourcetree
brew cask install github
brew cask install phpstorm
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
brew cask install boot2docker
brew cask install rstudio
brew cask install mou

# fun
brew cask install simple-comic

# browsers
brew cask install google-chrome
brew cask install opera
brew cask install flash

# less often
brew cask install screenflow4 # 4 specifically not 5.
brew cask install vlc
brew cask install keycastr
brew cask install android-file-transfer
brew cask install fugu
brew cask install fluid
brew cask install libreoffice
brew cask install calibre
#brew cask install all2mp3

# Quicklook plugins
brew cask install suspicious-package
brew cask install quicklook-json
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install qlcolorcode

