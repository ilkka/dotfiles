#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='minimal'

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
test -n $(which scmpuff) && eval "$(scmpuff init -s)"

# fasd
if [[ -n $(which fasd) ]]; then
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

# docker-osx-dev
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/ilau/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

export NVM_DIR="/Users/ilau/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
