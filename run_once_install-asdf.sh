#!/usr/bin/env bash
if [[ -d $HOME/.asdf ]]; then
  # asdf already installed
  exit 0
fi

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
. "$HOME/.asdf/asdf.sh"

if command -v apt-get &>/dev/null; then
  echo "Installing dependencies for erlang builds"
  sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev
else
  echo "WARN: don't know how to install dependencies for erlang builds" >&2
fi

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git

if command -v apt-get &>/dev/null; then
  echo "Installing dependencies for elixir builds"
  sudo apt-get -y install unzip
else
  echo "WARN: don't know how to install dependencies for elixir builds" >&2
fi

asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
