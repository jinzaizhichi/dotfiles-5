# Configure oh-my-zsh
if [ -d $HOME/.oh-my-zsh ]; then
	ZSH=$HOME/.oh-my-zsh
	ZSH_THEME="cloud"
	plugins=( git vagrant )
	source $ZSH/oh-my-zsh.sh
fi

for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Some gems requires this
export _system_type="Darwin"

