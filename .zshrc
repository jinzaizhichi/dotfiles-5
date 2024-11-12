
for file in ~/.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config ~/dotfiles/space-mario.omp.json)"
else
    eval "$(oh-my-posh init zsh --config /opt/homebrew/opt/oh-my-posh/themes/robbyrussell.omp.json)"
fi

eval "$(atuin init zsh)"
eval "$(fnm env)"

bindkey -v # Vi mode

# Lando
export PATH="/Users/mario/.lando/bin${PATH+:$PATH}"; #landopath

