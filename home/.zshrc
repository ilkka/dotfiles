# reasonable locale
export LC_ALL=en_US.UTF-8

###############################################################################
# Antigen
if [[ -f ~/.antigen/antigen.zsh ]]; then
  source ~/.antigen/antigen.zsh
fi

# Antigen all the things
antigen use oh-my-zsh
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle fcambus/ansiweather
antigen bundle b4b4r07/enhancd
antigen bundle unixorn/git-extra-commands
antigen bundle rimraf/k
antigen bundle zsh-users/zsh-completions

# work it
antigen apply

###############################################################################
# Editor wankery
export GIT_EDITOR='vim'
export SUDO_EDITOR='vim'
export EDITOR='vim'
if command -v atom >/dev/null 2>&1; then
  export VISUAL='atom --new --wait'
  export EDITOR='atom --new --wait'
fi

###############################################################################
# Environment basics

# set up color
export CLICOLOR='true'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# set up less
export PAGER='less'
export LESS='-Ri'
if command -v lesspipe.sh >/dev/null 2>&1; then
  export LESSOPEN="|lesspipe.sh %s"
fi

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
zstyle :compinstall filename '/Users/ilau/.zshrc'

autoload -Uz compinit
compinit

###############################################################################
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh-history
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e

###############################################################################
# now go powerline
if [[ -f /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
  source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi
