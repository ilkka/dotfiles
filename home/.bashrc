# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
if [[ -n "$PS1" ]]; then

[ -s $HOME/.bash_colors ] && . $HOME/.bash_colors

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
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

[ -s $HOME/.bash_prompt ] && . $HOME/.bash_prompt

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# add rvm stuff
if test -s $HOME/.rvm/scripts/rvm; then
	source $HOME/.rvm/scripts/rvm
fi

### show dirty/stashed/untracked states with __git_ps1
#export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWSTASHSTATE=1
#export GIT_PS1_SHOWUNTRACKEDFILES=1

### own bin into path
[ -d $HOME/bin -o -L $HOME/bin ] && export PATH=$HOME/bin:$PATH

### own manpath into path
[ -d $HOME/share/man -o -L $HOME/share/man ] && export MANPATH=$HOME/share/man:$MANPATH

### homebrew?
if which brew > /dev/null; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
  [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
fi

### rbenv path, shims and completion
[ -d "$HOME/.rbenv/bin" ] && export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### homeshick
if [ -e $HOME/.homeshick ]; then
  alias homeshick="$HOME/.homeshick"
  "$HOME/.homeshick" --quiet refresh
fi

### be colorful on a mac
export CLICOLOR=true

# Colors that fit nicer with my dark themes
export LSCOLORS=GxFxCxDxBxegedabagaced

# per-machine stuff
[ -e $HOME/.bashrc_local ] && . $HOME/.bashrc_local

fi
