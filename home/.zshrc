#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Ilkka Laukkanen <ilkka@fastmail.fm>

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
    RPROMPT="$RPROMPT $(python $HOME/.zsh-custom/batterylevel.py)"
fi

# rbenv
RBENV=$HOME/.rbenv
if [[ -d $RBENV/bin ]]; then
    PATH=$RBENV/bin:$PATH
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

# machine-local non-versioned stuff
if [[ -s $HOME/.zshrc-local ]]; then
    source "$HOME/.zshrc-local"
fi
