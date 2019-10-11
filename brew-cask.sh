# Install native apps

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# daily
brew cask install dropbox
brew cask install flux
brew cask install spectacle
brew cask install caffeine
brew cask install qttorrent
brew cask install toggldesktop


# dev
brew cask install iterm2
brew cask install sublime-text
brew cask install visual-studio-code
brew cask install imagealpha
brew cask install imageoptim
brew cask install sourcetree
brew cask install skitch
#brew cask install paparazzi

# fun
brew cask install spotify

# browsers
brew cask install google-chrome

# less often
brew cask install vlc
brew cask install keycastr
brew cask install android-file-transfer
brew cask install fugu
brew cask install fluid
brew cask install free-ruler
brew cask install knockknock

# Quicklook plugins
brew cask install quicklook-json
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install qlcolorcode

# big ones
#brew cask install gimp
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vagrant

# Remove outdated versions from the cellar.
brew cleanup
