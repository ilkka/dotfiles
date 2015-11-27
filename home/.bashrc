# fix locale
export LC_ALL=en_US.UTF-8

###############################################################################
# Includes
source $HOME/.bash.d/functions.sh

###############################################################################
# History
#
# Sources:
# http://www.unixlore.net/articles/save-time-command-line-bash-shell.html
# https://github.com/ches/dotfiles/blob/master/.bashrc

# expand ! history expansions dynamically
bind Space:magic-space
# don't overwrite old history
shopt -s histappend
# combine multiline commands in history
shopt -s cmdhist
# don't store duplicates
export HISTCONTROL=erasedups
# history lines count
export HISTSIZE=5000
# append immediately so new shells get new history
export PROMPT_COMMAND="history -a"

###############################################################################
# Editor wankery
export GIT_EDITOR='vim'
export SUDO_EDITOR='vim'
export EDITOR='vim'
if cmd_exists atom; then
  export VISUAL='atom --new --wait'
  export EDITOR='atom --new --wait'
fi

# Stop here if we aren't interactive
[[ -z "$PS1" ]] && return

###############################################################################
#                                     ^^^                                     #
#                     ~*~ END OF NONINTERACTIVE BITS ~*~                      #
#                       ~*~ BEGIN INTERACTIVE BITS ~*~                        #
#                                     vvv                                     #
###############################################################################

###############################################################################
# Basic shell setup
#
# Sources:
# https://github.com/ches/dotfiles/blob/master/.bashrc

# no flow control keys
stty stop undef
stty start undef

# set up color
export CLICOLOR='true'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# set up less
export PAGER='less'
export LESS='-Ri'
if cmd_exists lesspipe.sh; then
  export LESSOPEN="|lesspipe.sh %s"
fi

# set up prompt
[[ -r ~/.bash.d/prompt.sh ]] && source ~/.bash.d/prompt.sh

# set up aliases
[[ -r ~/.bash.d/aliases.sh ]] && source ~/.bash.d/aliases.sh

# set up completion
[[ -r ~/.bash.d/completion.sh ]] && source ~/.bash.d/completion.sh

# set up extras
[[ -r ~/.bash.d/extras.sh ]] && source ~/.bash.d/extras.sh

# set up platform stuff
if [[ $(uname -s) == "Darwin " && -r ~/.bash.d/platform-osx.sh ]]; then
  source ~/.bash.d/platform-osx.sh
elif [[ -r ~/.bash.d/platform-linux.sh ]]; then
  source ~/.bash.d/platform-linux.sh
fi

# set up unversioned stuff
if [[ -d ~/.bash_local.d ]]; then
  for f in ~/.bash_local.d/*.sh; do
    source $f
  done
fi
