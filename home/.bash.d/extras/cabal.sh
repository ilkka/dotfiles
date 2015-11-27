# add cabal dir to path
if [[ -d "$HOME/.cabal/bin" ]]; then
  export PATH="$HOME/.cabal/bin:$PATH"
fi
