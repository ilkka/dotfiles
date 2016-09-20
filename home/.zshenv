# reasonable locale
export LC_ALL=en_US.UTF-8

###############################################################################
# Editor wankery
export GIT_EDITOR='vim'
export SUDO_EDITOR='vim'
export EDITOR='emacsclient'
export VISUAL='emacsclient'
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

export DOCKER_CONTENT_TRUST=1
export NPM_TOKEN=fd1e637e-7e0c-4a40-8680-35036298768b
