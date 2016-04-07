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
brew cask install google-drive
#brew cask install mailbox
brew cask install utorrent
brew cask install slack
brew cask install the-unarchiver
brew cask install unrarx
brew cask install nylas-n1
brew cask install toggldesktop


# dev
brew cask install iterm2
#brew cask install sublime-text3
brew cask install atom
brew cask install imagealpha
brew cask install imageoptim
#brew cask install lisanet-gimp
brew cask install sourcetree
#brew cask install github
#brew cask install boot2docker
#brew cask install rstudio
#brew cask install mou
brew cask install gitify

# fun
#brew cask install simple-comic
#brew cask install clementine
brew cask install deezer
#brew cask install spotify

# browsers
brew cask install google-chrome
#brew cask install opera
#brew cask install flash

# less often
#brew cask install screenflow4 # 4 specifically not 5.
brew cask install vlc
brew cask install keycastr
brew cask install android-file-transfer
brew cask install fugu
brew cask install fluid
brew cask install calibre
#brew cask install all2mp3
brew cask install tagger
brew cask install skype
brew cask install noizio
brew cask install free-ruler
brew cask install wordpresscom

# Quicklook plugins
brew cask install suspicious-package
brew cask install quicklook-json
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install qlcolorcode

# big ones
brew cask install gimp
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vagrant
brew cask install vagrant-manager
brew cask install libreoffice
brew cask install caskroom/homebrew-versions/java6
brew cask install phpstorm

