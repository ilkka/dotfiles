#!/bin/bash -ex

# Paste this into ssh
# curl -sL https://raw.github.com/ilkka/dotfiles/master/scripts/bootstrap.sh | /bin/bash -ex
# Remember to use the correct URL if forking.
#
# For OS X, install XCode and command line tools first.

pushd $HOME

unamestr=`uname -s`
platform=''
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='osx'
fi

if [[ $platform == 'linux' ]]; then
    if [[ `whoami` == 'root' ]]; then
        installtool='apt-get'
    else
        installtool='sudo apt-get'
    fi
    installtoolflags='-y'
    $installtool update
    # need git and make to install rbenv
    if `grep -q lucid /etc/apt/sources.list`; then
      gitpkg='git-core'
    else
      gitpkg='git'
    fi
    $installtool install $installtoolflags $gitpkg build-essential
elif [[ $platform == 'osx' ]]; then
    installtool='brew'
    # already have git
fi

### rbenv ###
[ ! -e "$HOME/.rbenv" ] && git clone https://github.com/sstephenson/rbenv.git "$HOME/.rbenv"
[ ! -e "$HOME/.rbenv/plugins/ruby-build" ] && git clone https://github.com/sstephenson/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"
[ ! -e "$HOME/.rbenv/plugins/rbenv-aliases" ] && git clone https://github.com/tpope/rbenv-aliases "$HOME/.rbenv/plugins/rbenv-aliases"
PATH="$HOME/.rbenv/bin:$PATH"
for d in `find $HOME/.rbenv -name .git -type d`; do pushd $d/.. && git pull && popd; done

### install latest 1.9 ruby ###
LATESTRUBY=`rbenv install -l 2>&1|egrep '\W*1\.9\..+-p[0-9]+'|sort|tail -1`
rbenv versions|egrep -q $LATESTRUBY || rbenv install $LATESTRUBY
rbenv global $LATESTRUBY
rbenv alias --auto
rbenv rehash

if [[ $platform == 'osx' ]]; then
    # Install homebrew if not installed
    if ! which brew; then
        ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
    fi
    $installtool update
fi

### Install packages with installtool ###
$installtool install $installtoolflags tmux vim bash-completion fasd
if [[ $platform = 'osx' ]]; then
        $installtool install $installtoolflags macvim python ctags
        echo 'export PATH="$PATH:/usr/local/share/python"' >> $HOME/.bashrc_local
else
        $installtool install $installtoolflags python-pip exuberant-ctags
fi

### Install homeshick ###
HOMESHICK_DIR=$HOME/.homesick/repos/homeshick
if [[ ! -e $HOMESHICK_DIR ]]; then
  git clone http://github.com/andsens/homeshick.git $HOMESHICK_DIR
fi
source $HOMESHICK_DIR/homeshick.sh

### Trust github ###
mkdir -p .ssh
cat <<EOF >> .ssh/known_hosts
|1|6WX8FDwncDK8tfyfkLLbvyepVRw=|15RHFpHg3GHML7eJqvNL/yVYChI= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
|1|cccEMXs7ur0u/JXs4NQYv4A9Xb8=|Pddv+wa776NKeZ4v1yMn1cZWt4s= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
EOF

### Install oh-my-zsh ###
if [[ ! -e $HOME/.oh-my-zsh ]]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

### Install scm breeze ###
if [[ ! -e $HOME/.scm_breeze ]]; then
    git clone https://github.com/ndbroadbent/scm_breeze.git ~/.scm_breeze
else
    (cd ~/.scm_breeze && git reset --hard HEAD && git checkout master && git pull)
fi

### Deploy dotfiles ###
repos="dotfiles"
for r in $repos; do
  if [[ ! -e $HOME/.homesick/repos/$r ]]; then
    homeshick --batch --force clone ilkka/$r
  fi
done

if [[ ! -d .dotfile-backup ]]; then
    mkdir -p .dotfile-backup
    mv .bashrc .dotfile-backup/ || true
    mv .profile .dotfile-backup/ || true
fi

for r in $repos; do homeshick --batch --force symlink $r; done

popd

echo "Run 'exec \$SHELL' to restart the shell"
