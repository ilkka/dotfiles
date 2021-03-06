# flyboy.zsh-theme
# Adapted from sorin by ilkka@fastmail.fm

if [[ -x $HOME/.zsh-custom/batterylevel.py ]]; then
    BATTERYLEVEL=$HOME/.zsh-custom/batterylevel.py
fi

function battery_charge {
    if [[ -n $BATTERYLEVEL ]]; then
        echo " " `$BATTERYLEVEL` 2> /dev/null
    fi
}

function stopped_jobs(){
  if [[ "$(jobs)" =~ "suspended" ]]; then
    echo "%{$fg_bold[red]%}⌚ "
  fi
}

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
  local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"
  
  PROMPT='%{$fg[cyan]%}%c$(git_prompt_info) %(!.%{$fg_bold[red]%}#.$(stopped_jobs)%{$fg_bold[green]%}❯)%{$reset_color%} '

  if [[ -n $SSH_CLIENT ]]; then
      PROMPT='%{$fg[yellow]%}%n%{$fg_bold[white]%}@%{$reset_color%}%{$fg[red]%}%m '$PROMPT
  fi

  ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}git%{$reset_color%}:%{$fg[red]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='${return_status}$(git_prompt_status)%{$reset_color%}$(battery_charge)'

  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
else 
  MODE_INDICATOR="❮❮❮"
  local return_status="%(?::⏎)"
  
  PROMPT='%c$(git_prompt_info) %(!.#.❯) '

  ZSH_THEME_GIT_PROMPT_PREFIX=" git:"
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='${return_status}$(git_prompt_status)'

  ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
  ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi

