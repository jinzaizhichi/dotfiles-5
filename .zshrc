# Configure oh-my-zsh
if [ -d $HOME/.oh-my-zsh ]; then
	ZSH=$HOME/.oh-my-zsh
	ZSH_THEME="terminalparty"
	plugins=(git vagrant gulp)
	source $ZSH/oh-my-zsh.sh
fi

for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;



# User shims instead on native ruby/python/php/node interpreters
eval "$(direnv hook $0)"
for xenv in rbenv pyenv phpenv ndenv; do
	if which $xenv > /dev/null; then eval "$($xenv init -)"; fi
done
unset xenv

# NVM  shim works different
#export NVM_DIR="/usr/local/opt/nvm"
export NVM_DIR=$(brew --prefix nvm)
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Some gems requires this
export _system_type="Darwin"


