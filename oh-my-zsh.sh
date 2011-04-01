# Initializes Oh My Zsh

# add a function path
fpath=($ZSH/functions $fpath)

# Load all of the config files in ~/oh-my-zsh that end in .zsh
# TIP: Add files you don't want in git to .gitignore
if [[ -d $ZSH/lib ]]; then
	for config_file in $ZSH/lib/*.zsh
	do
		source $config_file
	done
fi

# Load all of your custom configurations from custom/
if [[ -d $ZSH/custom ]]; then
	for config_file in $ZSH/custom/*.zsh
	do
		source $config_file
	done
fi

# Load all of the plugins that were defined in ~/.zshrc
plugin=${plugin:=()}
for plugin ($plugins) source $ZSH/plugins/$plugin/$plugin.plugin.zsh

# Load the theme
source "$ZSH/themes/$ZSH_THEME.zsh-theme"

# Check for updates on initial load...
if [ "$DISABLE_AUTO_UPDATE" = "true" ]
then
  return
else
  /usr/bin/env zsh $ZSH/tools/check_for_upgrade.sh
fi
