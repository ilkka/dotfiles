###############################################################################
# Bail early on a dumb terminal to make e.g. tramp work
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# zplug
if [[ -f ~/.zplug/init.zsh ]]; then
  source ~/.zplug/init.zsh
fi

export NVM_LAZY_LOAD=true

zplug "zplug/zplug", as:command
zplug "lukechilds/zsh-nvm"
# This needs to load after zsh-syntax-highlighting
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-syntax-highlighting"
zplug "b4b4r07/enhancd", use:init.sh
zplug "unixorn/git-extra-commands"
zplug "mafredri/zsh-async", from:github, defer:0
zplug "zsh-users/zsh-autosuggestions"
zplug "bobthecow/git-flow-completion"

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  zplug install
  date +%s > "$HOME/.zplug-last-checked"
else
  if [[ -f "$HOME/.zplug-last-checked" && -n "$(which dc)" ]]; then
    if [[ $(echo "$(date +%s) $(cat "$HOME/.zplug-last-checked") - 24 60 60 * * - p"|dc) -gt 0 ]]; then
      # more than 24h since last check -- check for updates
      zplug update
      date +%s > "$HOME/.zplug-last-checked"
    fi
  fi
fi

zplug load --verbose

###############################################################################
# compinstall
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'Completing %d:'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' menu select=2
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt '%e errors:'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

###############################################################################
# Lines configured by zsh-newuser-install
export HISTFILE=~/.zsh-history
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e

###############################################################################
# editor basics
if [[ -x $(which nvim) ]]; then EDITOR=nvim; else EDITOR=vim; fi
GIT_EDITOR=$EDITOR
if [[ -x $(which code) ]]; then VISUAL="code --wait"; fi

###############################################################################
# homeshick
[ -s "$HOME/.homesick/repos/homeshick/homeshick.sh" ] && source "$HOME/.homesick/repos/homeshick/homeshick.sh"

###############################################################################
# python stuffs
[ -f ~/.pystartup ] && export PYTHONSTARTUP=$HOME/.pystartup

###############################################################################
# extra hstr config
if whence hh >/dev/null 2>&1
then
  alias hh=hstr                    # hh to be alias for hstr
  export HSTR_CONFIG=hicolor        # get more colors
  bindkey -s "\C-r" "\eqhstr\n"     # bind hstr to Ctrl-r (for Vi mode check doc)
fi

###############################################################################
# read aliases
[ -f ~/.aliases ] && source ~/.aliases

# iterm2 v3 integrations!
[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh

###############################################################################
# zsh-history-substring-search keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

###############################################################################
# is there go
[ -d ~/go/bin ] && PATH=$PATH:~/go/bin

###############################################################################
# local stuffs if exists
[ -f ~/.zshrc-local ] && source ~/.zshrc-local

###############################################################################
# prompty prompt
which starship &>/dev/null && eval $(starship init zsh)

###############################################################################
# sdkman
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
