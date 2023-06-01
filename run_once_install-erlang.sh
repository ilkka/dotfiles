#!/usr/bin/env bash
set -euo pipefail
if command -v apt-get &>/dev/null; then
  sudo apt-get update
  sudo apt-get -y install erlang
else
  echo "uh-oh, don't know how to install erlang :(" >&2
fi
