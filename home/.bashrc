# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
if [[ -n "$PS1" ]]; then

  if [[ -s $HOME/.bash_colors ]]; then
    source $HOME/.bash_colors
  fi

  # don't put duplicate lines in the history. See bash(1) for more options
  # don't overwrite GNU Midnight Commander's setting of `ignorespace'.
  HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
  # ... or force ignoredups and ignorespace
  HISTCONTROL=ignoreboth

  # append to the history file, don't overwrite it
  shopt -s histappend

  # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize

  # make less more friendly for non-text input files, see lesspipe(1)
  if [[ -x /usr/bin/lesspipe ]]; then
    eval "$(SHELL=/bin/sh lesspipe)"
  fi

  if [[ -s $HOME/.bash_prompt ]]; then
    source $HOME/.bash_prompt
  fi

  # Alias definitions.
  # You may want to put all your additions into a separate file like
  # ~/.bash_aliases, instead of adding them here directly.
  # See /usr/share/doc/bash-doc/examples in the bash-doc package.

  if [[ -f $HOME/.bash_aliases ]]; then
    source $HOME/.bash_aliases
  fi

  # enable programmable completion features (you don't need to enable
  # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
  # sources /etc/bash.bashrc).
  if [[ -f /etc/bash_completion ]] && ! shopt -oq posix; then
    source /etc/bash_completion
  fi

  # add rvm stuff
  if [[ -s $HOME/.rvm/scripts/rvm ]]; then
    source $HOME/.rvm/scripts/rvm
  fi

  ### show dirty/stashed/untracked states with __git_ps1
  #export GIT_PS1_SHOWDIRTYSTATE=1
  #export GIT_PS1_SHOWSTASHSTATE=1
  #export GIT_PS1_SHOWUNTRACKEDFILES=1

  ### own bin into path
  if [[ -d $HOME/bin || -L $HOME/bin ]]; then
    export PATH=$HOME/bin:$PATH
  fi

  ### own manpath into path
  if [[ -d $HOME/share/man || -L $HOME/share/man ]]; then
    export MANPATH=$HOME/share/man:$MANPATH
  fi

  ### homebrew?
  if which brew > /dev/null; then
    if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
      source $(brew --prefix)/etc/bash_completion
    fi
    if [[ -s $(brew --prefix)/etc/autojump.bash ]]; then
      source $(brew --prefix)/etc/autojump.bash
    fi
  else
    # not homebrew
    if [[ -e /usr/share/autojump/autojump.bash ]]; then
      source /usr/share/autojump/autojump.bash
    fi
  fi

  ### rbenv path, shims and completion
  if [[ -d "$HOME/.rbenv/bin" ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
  fi
  if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
  fi

  ### homeshick
  if [[ -e $HOME/.homeshick ]]; then
    alias homeshick="$HOME/.homeshick"
    "$HOME/.homeshick" --quiet refresh
  fi

  ### be colorful on a mac
  export CLICOLOR=true

  # Colors that fit nicer with my dark themes
  export LSCOLORS=GxFxCxDxBxegedabagaced
  if [[ -e $HOME/.dircolors ]] && which dircolors >> /dev/null 2>&1; then
    eval $(dircolors $HOME/.dircolors)
  fi

  # path etc in window name
  case "$TERM" in
    xterm*)
      export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
      ;;
    *)
      ;;
  esac

  if [[ -s "$HOME/.scm_breeze/scm_breeze.sh" ]]; then
    source "$HOME/.scm_breeze/scm_breeze.sh"
  fi

  # per-machine stuff
  if [[ -e $HOME/.bashrc_local ]]; then 
    source $HOME/.bashrc_local
  fi

fi

# final insult: disable custom prompt for dumb shells.
if [[ $TERM = "dumb" ]]; then
  export PROMPT_COMMAND=''
  export PS1='$ '
fi
