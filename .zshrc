# Configure oh-my-zsh
if [ -d $HOME/.oh-my-zsh ]; then
	ZSH=$HOME/.oh-my-zsh
	# ZSH_THEME="agnoster"
	# ZSH_THEME="cloud"
    ZSH_THEME="powerlevel9k/powerlevel9k"
	plugins=( git vagrant docker )
	source $ZSH/oh-my-zsh.sh
fi

for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Some gems requires this
export _system_type="Darwin"

# export CLICOLOR=1
# export TERM=xterm-256color

