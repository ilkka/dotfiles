###############################################################################
# Bail early on a dumb terminal to make e.g. tramp work
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

###############################################################################
# Antigen
#if [[ -f ~/.antigen/antigen.zsh ]]; then
  #source ~/.antigen/antigen.zsh
#fi

# zplug
if [[ -f ~/.zplug/init.zsh ]]; then
  source ~/.zplug/init.zsh
fi

zplug "zplug/zplug", as:command
# Way too slow and sees no use from me
#zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "b4b4r07/enhancd", use:init.sh
zplug "unixorn/git-extra-commands"
zplug "rimraf/k"
zplug "mafredri/zsh-async", from:github, defer:0
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-autosuggestions"
zplug "bobthecow/git-flow-completion"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "zplug plugins missing, install? [y/N]: "
    if read -q; then
        echo; zplug install
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
# now go powerline
# for dir in /usr/local/lib/python2.7/site-packages /usr/local/lib/python2.7/dist-packages; do
#   if [[ -f ${dir}/powerline/bindings/zsh/powerline.zsh ]]; then
#     source ${dir}/powerline/bindings/zsh/powerline.zsh
#     break
#   fi
# done

###############################################################################
# homeshick
[ -s "$HOME/.homesick/repos/homeshick/homeshick.sh" ] && source "$HOME/.homesick/repos/homeshick/homeshick.sh"

###############################################################################
# docker machine 'use' wrapper
[ -s "$HOME/.zsh-custom/docker-machine.zsh" ] && source "$HOME/.zsh-custom/docker-machine.zsh"

###############################################################################
# rbenv
[ -d $HOME/.rbenv/bin ] && PATH=$HOME/.rbenv/bin:$PATH
whence -p rbenv > /dev/null 2>&1 && eval "$(rbenv init -)"

###############################################################################
# fzf if we manually installed it
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###############################################################################
# python stuffs
[ -f ~/.pystartup ] && export PYTHONSTARTUP=$HOME/.pystartup

###############################################################################
# extra hstr config
if whence hh >/dev/null 2>&1
then
  export HH_CONFIG=hicolor        # get more colors
  bindkey -s "\C-r" "\eqhh\n"     # bind hh to Ctrl-r (for Vi mode check doc)
fi

###############################################################################
# read aliases
[ -f ~/.aliases ] && source ~/.aliases

# iterm2 v3 integrations!
[ -f ~/.iterm2_shell_integration.`basename $SHELL` ] && source ~/.iterm2_shell_integration.`basename $SHELL`

###############################################################################
# local stuffs if exists
[ -f ~/.zshrc-local ] && source ~/.zshrc-local

export PATH="$HOME/.yarn/bin:$PATH"
