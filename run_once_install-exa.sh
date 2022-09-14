#!/bin/bash
if ! command -v exa &>/dev/null; then
  if command -v apt &>/dev/null; then
    sudo apt install exa
  elif command -v pacman &>/dev/null; then
    sudo pacman -S exa
  else
    echo "Don't know how to install exa" >&2
  fi
fi
