#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
elif [[ -s "${ZDOTDIR:-$HOME}/.homesick/repos/prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.homesick/repos/prezto/init.zsh"
fi

# Customize to your needs...
if [[ -s $HOME/.zshrc-local ]]; then
    source "$HOME/.zshrc-local"
fi

