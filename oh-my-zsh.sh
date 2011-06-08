# Check for updates on initial load...
if [ "$DISABLE_AUTO_UPDATE" != "true" ]
then
  /usr/bin/env zsh $ZSH/tools/check_for_upgrade.sh
fi

# Initializes Oh My Zsh

# add a function path
fpath=($ZSH/functions $ZSH/completions $fpath)

# Load all of the config files in ~/oh-my-zsh that end in .zsh
# TIP: Add files you don't want in git to .gitignore
if [[ -d $ZSH/lib ]]; then
	for config_file in $ZSH/lib/*.zsh
	do
		source $config_file
	done
fi

# Add all defined plugins to fpath
plugin=${plugin:=()}
for plugin ($plugins) fpath=($ZSH/plugins/$plugin $fpath)

# Load and run compinit
autoload -U compinit
compinit -i

# Load all of your custom configurations from custom/
if [[ -d $ZSH/custom ]]; then
	for config_file in $ZSH/custom/*.zsh
	do
		source $config_file
	done
fi

# Load the theme
if [ "$ZSH_THEME" = "random" ]
then
  themes=($ZSH/themes/*zsh-theme)
  N=${#themes[@]}
  ((N=(RANDOM%N)+1))
  RANDOM_THEME=${themes[$N]}
  source "$RANDOM_THEME"
  echo "[oh-my-zsh] Random theme '$RANDOM_THEME' loaded..."
else
  source "$ZSH/themes/$ZSH_THEME.zsh-theme"
fi

