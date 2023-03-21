#!/bin/bash
if ! command -v exa &>/dev/null; then
  if command -v apt &>/dev/null; then
    sudo apt install exa
  elif command -v pacman &>/dev/null; then
    sudo pacman -S yay
    # fuse2 is needed for the neovim appimage
    sudo yay -Syu exa bottom gdu fuse2
  else
    echo "Don't know how to install things on this platform" >&2
  fi
fi
