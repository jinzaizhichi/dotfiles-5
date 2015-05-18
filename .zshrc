export PATH=$PATH:~/.phpenv/bin

# Configure oh-my-zsh
if [ -d $HOME/.oh-my-zsh ]; then
	ZSH=$HOME/.oh-my-zsh
	ZSH_THEME="terminalparty"
	plugins=(git)
	source $ZSH/oh-my-zsh.sh
fi

for file in ~/dotfiles/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

eval "$(direnv hook $0)"
for xenv in rbenv pyenv phpenv; do
	if which $xenv > /dev/null; then eval "$($xenv init -)"; fi
done
unset xenv

#  Temp Aliases
alias sage="cd ~/Projects/wp_metromile/public/wp-content/themes/sage-8.0.0"
alias metro="cd ~/Projects/wp_metromile/"
