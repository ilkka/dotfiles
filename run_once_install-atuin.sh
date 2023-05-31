#!/usr/bin/env bash
if command -v atuin &>/dev/null; then
  exit 0
fi
echo "Installing atuin (atuin.sh)"
bash <(curl https://raw.githubusercontent.com/ellie/atuin/main/install.sh)
