# reasonable locale
export LC_ALL=en_US.UTF-8

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
export VISUAL='subl -n -w'
# if command -v atom >/dev/null 2>&1; then
#   export VISUAL='atom --new --wait'
# fi

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

###############################################################################
# haskell stuffs
# Add GHC 7.8.4 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/GHC.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi 
[ -d $HOME/.local/bin ] && PATH=$HOME/.local/bin:$PATH

#export DOCKER_CONTENT_TRUST=1
export ENHANCD_DISABLE_DOT=1

if [ -f $HOME/.zshenv-local ]
then
  source $HOME/.zshenv-local
fi
