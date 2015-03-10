# Install native apps

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
sudo -v


brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# daily
#brew cask install alfred
brew cask install dropbox
#brew cask install gyazo
#brew cask install onepassword
#brew cask install rescuetime
# cask install flux
brew cask install spectacle
brew cask install caffeine

# dev
brew cask install iterm2
brew cask install sublime-text3
brew cask install imagealpha
brew cask install imageoptim
brew cask install gimp
brew cask install sourcetree
brew cask install github
brew cask install phpstorm
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
brew cask install boot2docker
brew cask install rstudio

# fun
brew cask install limechat
#brew cask install miro-video-converter
brew cask install simple-comic

# browsers
brew cask install google-chrome
#brew cask install firefox-nightly --force
#brew cask install webkit-nightly --force
#brew cask install chromium --force
#brew cask install torbrowser
brew cask install flash

# less often
#brew cask install disk-inventory-x
brew cask install screenflow4 # 4 specifically not 5.
brew cask install vlc
brew cask install keycastr
brew cask install android-file-transfer
brew cask install mou


