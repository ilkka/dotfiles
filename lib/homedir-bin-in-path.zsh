if [[ -d $HOME/bin ]]
then
	if [[ $PATH != *:#$HOME/bin:#* ]]
	then
		export PATH=$HOME/bin:$PATH
	fi
fi

# lastly, read local settings from ~/.zshrc-local and ~/.zshrc.d/*.zsh
localsettings=$HOME/.zshrc-local
if [[ -f $localsettings && -r $localsettings ]]; then
	source $localsettings
fi

localsettingsdir=$HOME/.zshrc.d
if [[ -d $localsettingsdir ]]; then
	for configfile in $localsettingsdir/*.zsh; do
		source $configfile
	done
fi

