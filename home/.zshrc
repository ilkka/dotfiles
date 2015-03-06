#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Ilkka Laukkanen <ilkka@fastmail.fm>

# prezto loads nvm but this is required:
if [[ -r $HOME/.nvm/nvm.sh ]]; then
  export NVM_DIR=$(cd -P $HOME/.nvm; pwd)
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
elif [[ -s "${ZDOTDIR:-$HOME}/.homesick/repos/prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.homesick/repos/prezto/init.zsh"
fi

# source homeshick
source $HOME/.homesick/repos/homeshick/homeshick.sh

# on OSX, fix the broken(?) LC_CTYPE setting
if [[ $(uname -s) = "Darwin" && $LC_CTYPE = "UTF-8" ]]; then
    LC_CTYPE="en_US.UTF-8"
fi

if [[ -s $HOME/.scm_breeze/scm_breeze.sh ]]; then
    source "$HOME/.scm_breeze/scm_breeze.sh"
fi

if [[ -r $HOME/.zsh-custom/batterylevel.py ]]; then
    RPROMPT="$RPROMPT \$(python $HOME/.zsh-custom/batterylevel.py)"
fi

# rbenv
RBENV=$HOME/.rbenv
if [[ -d $RBENV/bin ]]; then
    PATH=$RBENV/bin:$RBENV/shims:$PATH
    eval "$(rbenv init -)"
fi

function stopped_jobs(){
  if [[ "$(jobs)" =~ "suspended" ]]; then
    echo "%{$fg_bold[red]%}⌚ "
  fi
}

RPROMPT="\$(stopped_jobs)$RPROMPT"

if [[ -n "$SSH_CLIENT" ]]; then
    PROMPT='%F{red}%n@%m '$PROMPT
fi

# teamocil completion
compctl -g '~/.teamocil/*(:t:r)' teamocil

# compleat
COMPLEAT_SETUP=/usr/local/share/compleat-1.0/compleat_setup
if [[ -r $COMPLEAT_SETUP ]]; then
  autoload -Uz compinit bashcompinit
  compinit
  bashcompinit
  source $COMPLEAT_SETUP
fi

# cabal user bin
if [[ -d $HOME/Library/Haskell/bin ]]; then
    PATH="$HOME/Library/Haskell/bin:$PATH"
fi

# own bin
if [[ -d $HOME/bin ]]; then
  PATH="$HOME/bin:$PATH"
fi

nvm_prompt_info() {
  nvm_ver=$(nvm current)
  if [[ $nvm_ver != 'system' ]]; then
    echo -n "%B⬡ $nvm_ver%b"
  fi
}

RPROMPT='$(nvm_prompt_info)'$RPROMPT

# rename terminal.app tab
function tabname {
  printf "\e]1;$1\a"
}

# rename terminal.app win
function winname {
  printf "\e]2;$1\a"
}

# extra completions stuff
fpath=(/usr/local/share/zsh-completions $fpath)

# docker stuff
alias dcom=docker-compose
alias dmac=docker-machine

function current_docker_machine {
    if [[ -n $DOCKER_CERT_PATH ]]; then
        echo -n "(dm:$(basename $DOCKER_CERT_PATH))"
    fi
}

RPROMPT='$(current_docker_machine)'$RPROMPT

# machine-local non-versioned stuff
if [[ -s $HOME/.zshrc-local ]]; then
    source "$HOME/.zshrc-local"
fi

