# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.homesick/repos/ilkka/oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="saga"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bundler deb debian gem git github osx pip rails3 ruby ssh-agent vagrant)

source $ZSH/oh-my-zsh.sh

# let's really really try to force 256 color modes
case $TERM in
(xterm)
	export TERM=xterm-256color
	;;
(screen)
	export TERM=screen-256color
	;;
esac
