#!/bin/sh
# This is the dotfiles install script for vs code remote dev containers (and
# why not for other things, but written to work for that purpose)

# yes it might not work for absolutely every scenario blah blah
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR
git submodule update --init

HOMESHICK_REPOS=$HOME/.homesick/repos
HOMESHICK_DIR=$HOMESHICK_REPOS/homeshick
if [ ! -e $HOMESHICK_DIR ]; then
  git clone https://github.com/andsens/homeshick.git $HOMESHICK_DIR
fi
. $HOMESHICK_DIR/homeshick.sh

DOTFILES_DIR=$HOMESHICK_REPOS/dotfiles
if [ ! -e $DOTFILES_DIR ]; then
  ln -s $SCRIPT_DIR $DOTFILES_DIR
fi

homeshick link --force

# try to switch shells
case "$SHELL" in
  *zsh)
    # golden
    ;;
  *)
    if [ -n "$(which zsh)" ]; then
      # just do it this dumb way for now
      echo "exec $(which zsh) \"\$@\"" > $HOME/.bashrc
    fi
    ;;
esac

#vim: sw=2 sts=2 et
