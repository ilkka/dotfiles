lib=$ZSH/lib/git-flow-completion.zsh
if [[ -f $lib && -r $lib ]]; then
	source $lib
else
	echo "Unable to source $lib"
fi
