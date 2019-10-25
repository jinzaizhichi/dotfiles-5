# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Hombrew if not present
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
# brew install wget --with-iri

brew install vim
# brew install grep
# brew install openssh
# Install GnuPG to enable PGP-signing commits.
# brew install gnupg

brew install nmap

# brew install git
# brew install ssh-copy-id
# brew install tree

brew install composer
brew install rclone
brew install node

# Remove outdated versions from the cellar.
brew cleanup

