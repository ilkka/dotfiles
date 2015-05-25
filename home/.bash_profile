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

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
export VCPROMPT_EXECUTABLE=/opt/boxen/homebrew/bin/vcprompt

test -f $HOME/.homesick/repos/homeshick/homeshick.sh && source $HOME/.homesick/repos/homeshick/homeshick.sh

test -f /opt/boxen/env.sh && source /opt/boxen/env.sh

# Load Bash It
source $BASH_IT/bash_it.sh

# restore terminal cwd
export PROMPT_COMMAND="$PROMPT_COMMAND;update_terminal_cwd;"

# load scmpuff
test -n $(which scmpuff) && eval "$(scmpuff init -s)"
# docker-osx-dev
export DOCKER_HOST=tcp://localhost:2375
