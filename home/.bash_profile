#!/usr/bin/env bash

# fix locale
export LC_ALL=en_US.UTF-8

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Set my editor and git editor
export EDITOR='atom --new --wait'
export GIT_EDITOR='vim'
export SUDO_EDITOR='vim'
#export GIT_EDITOR='atom --new --wait'
#export SUDO_EDITOR='atom --new --wait'

# Don't check mail when opening terminal.
unset MAILCHECK

if [[ -r /etc/bash_completion ]]; then
    . /etc/bash_completion
fi

# completions from brew too
if [[ -x $(which brew) && -f $(brew --prefix)/etc/bash_completion ]]; then
  . $(brew --prefix)/etc/bash_completion
fi

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

export NVM_DIR="$HOME/.nvm"
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
    if [[ $# > 1 ]]; then
      host=$1
      shift
      docker $(docker-machine config $host) "$@"
    fi
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# add composer installed binaries to path
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Add GHC 7.8.4 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/GHC.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# add cabal dir to path
if [[ -d "$HOME/.cabal/bin" ]]; then
  export PATH="$HOME/.cabal/bin:$PATH"
fi

# add cask bin paths (for caskroom emacs-mac for example)
if [[ -d /opt/homebrew-cask ]]; then
    export PATH="$(find /opt/homebrew-cask -type d -path '*/Contents/MacOS/bin'|egrep -v emacs|tr '\n' :)$PATH"
fi

# Default docker machine
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/ilau/.docker/machine/machines/virtualbox"
export DOCKER_MACHINE_NAME="virtualbox"

# Android sdk location
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools"

# Go
export GOPATH="$HOME/gocode"
export PATH="$GOPATH/bin:$PATH"

if [[ -f /usr/local/opt/autoenv/activate.sh ]]; then
  source /usr/local/opt/autoenv/activate.sh
fi

# Heroku
export HOMEBREW_GITHUB_API_TOKEN=221874d428a9ac335d921df669befcc1740169e0
