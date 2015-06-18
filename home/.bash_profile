#!/usr/bin/env bash

# fix locale
export LC_ALL=en_US.UTF-8

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='ilkka'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Set my editor and git editor
export EDITOR="/usr/bin/subl -w"
export GIT_EDITOR='vim'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# homeshick
test -f $HOME/.homesick/repos/homeshick/homeshick.sh && source $HOME/.homesick/repos/homeshick/homeshick.sh

# virtualenvwrapper
test -f /usr/local/bin/virtualenvwrapper.sh && source /usr/local/bin/virtualenvwrapper.sh

# Load Bash It
source $BASH_IT/bash_it.sh

# restore terminal cwd
if type update_terminal_cwd &>/dev/null; then
    export PROMPT_COMMAND="$PROMPT_COMMAND;update_terminal_cwd;"
else
    function tab_title {
        echo -n -e "\033]0;${PWD##*/}\007"
    }
    PROMPT_COMMAND="$PROMPT_COMMAND;tab_title"
fi

# load scmpuff
command -v scmpuff >/dev/null 2>&1 && eval "$(scmpuff init -s)"

# fasd
if command -v fasd >/dev/null 2>&1; then
    fasd_cache="$HOME/.fasd-init-bash"
    if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
      fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
    fi
    source "$fasd_cache"
    unset fasd_cache
fi

# my aliases
alias ls='ls -Gh'
alias ll='ls -lGh'
alias l='ls -1AGh'

export NVM_DIR="/Users/ilau/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# rbenv
command -v rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"

# docker machine support
dkr () {
    if [[ "$1" == "which" ]]; then
        echo $(docker-machine active)
        return
    fi
    if [[ "$1" == "use" ]]; then
        eval $(docker-machine env "$2")
        return
    fi
    docker $(docker-machine config $(docker-machine active)) "$@"
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
