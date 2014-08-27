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

# machine-local non-versioned stuff
if [[ -s $HOME/.zshrc-local ]]; then
    source "$HOME/.zshrc-local"
fi
