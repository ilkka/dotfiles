# add composer installed binaries to path
if [[ -d $HOME/.composer/vendor/bin ]]; then
  export PATH="$HOME/.composer/vendor/bin:$PATH"
fi
