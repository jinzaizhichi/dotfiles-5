
# Path to your oh-my-zsh configuration.
if [ -d $HOME/.oh-my-zsh ]; then
	ZSH=$HOME/.oh-my-zsh
	ZSH_THEME="terminalparty"
	plugins=(git)
	source $ZSH/oh-my-zsh.sh
fi

eval "$(direnv hook $0)"

export PATH=/usr/local/sbin:$PATH:$HOME/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin

# To install ruby gem breakpoint
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# aias temporal
alias sage="cd ~/Projects/wp_metromile/public/wp-content/themes/sage-8.0.0"
alias metro="cd /Users/Mario/Projects/wp_metromile/"
