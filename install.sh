#!/bin/sh
# This is the dotfiles install script for vs code remote dev containers (and
# why not for other things, but written to work for that purpose)
set -eu

# yes it might not work for absolutely every scenario blah blah
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)
cd "$SCRIPT_DIR"
git submodule update --init

HOMESHICK_REPOS=$HOME/.homesick/repos
HOMESHICK_DIR=$HOMESHICK_REPOS/homeshick
if [ ! -e "$HOMESHICK_DIR" ]; then
  git clone https://github.com/andsens/homeshick.git "$HOMESHICK_DIR"
fi
. "$HOMESHICK_DIR/homeshick.sh"

DOTFILES_DIR=$HOMESHICK_REPOS/dotfiles
if [ ! -e "$DOTFILES_DIR" ]; then
  ln -s "$SCRIPT_DIR" "$DOTFILES_DIR"
fi

homeshick link --force

# try to install exa
if [ -z "$(which exa)" ] && [ -n "$(which curl)" ] && [ -n "$(which unzip)" ] && sudo true
then
  if [ "Linux" = "$(uname -s)" ]; then
    EXA_OS=linux
  else
    EXA_OS=macos
  fi
  EXA_VARIANT="exa-${EXA_OS}-x86_64"
  curl -fsSLO https://github.com/ogham/exa/releases/download/v0.9.0/${EXA_VARIANT}-0.9.0.zip
  unzip ${EXA_VARIANT}-0.9.0.zip
  sudo mv ${EXA_VARIANT} /usr/local/bin/exa
  rm -f ${EXA_VARIANT}-0.9.0.zip
  if [ -n "$(which man)" ]
  then
    sudo mkdir -p /usr/local/share/man/man1 \
      curl -fsSLO https://raw.githubusercontent.com/ogham/exa/master/contrib/man/exa.1 \
      sudo mv exa.1 /usr/local/share/man/man1/ \
      sudo mkdir -p /usr/local/share/zsh/site-functions \
      curl -fsSLO https://raw.githubusercontent.com/ogham/exa/master/contrib/completions.zsh \
      sudo mv completions.zsh /usr/local/share/zsh/site-functions/
  fi
fi

# try to install starship
curl -fsSL https://starship.rs/install.sh | bash

#vim: sw=2 sts=2 et
