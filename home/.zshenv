# reasonable locale
export LC_ALL=en_US.UTF-8

###############################################################################
# is there go
[ -d ~/go/bin ] && PATH=$PATH:~/go/bin

###############################################################################
# Editor wankery
export EDITOR=vim
if command -v nvim >/dev/null 2>&1; then
  alias vim=nvim
  EDITOR=nvim
fi
#export GIT_EDITOR='subl -n -w'
#export SUDO_EDITOR='subl -n -w'
#export EDITOR='subl -n -w'
export SUDO_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR
# if command -v atom >/dev/null 2>&1; then
#   export VISUAL='atom --new --wait'
# fi

###############################################################################
# nodenv
[ -d ~/.zplug/repos/nodenv/nodenv/bin ] && PATH=$PATH:~/.zplug/repos/nodenv/nodenv/bin
eval "$(nodenv init -)" 

###############################################################################
# Environment basics

# set up color
export CLICOLOR='true'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# set up less
export PAGER='less'
export LESS='-Ri'
if command -v lesspipe.sh >/dev/null 2>&1; then
  export LESSOPEN="|lesspipe.sh %s"
fi

if [ -f $HOME/.zshenv-local ]
then
  source $HOME/.zshenv-local
fi
