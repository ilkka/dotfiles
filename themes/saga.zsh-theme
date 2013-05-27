function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

#function hg_prompt_info {
    #hg prompt --angle-brackets "\
#< on %{$fg[magenta]%}<branch>%{$reset_color%}>\
#< at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
#%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<
#patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
#}

function hg_prompt_info {
    hg prompt --angle-brackets "\
< on %{$fg[magenta]%}<branch>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function rvm_prompt_info {
	if [[ -x $HOME/.rvm/bin/rvm-prompt ]]
	then
		r=$($HOME/.rvm/bin/rvm-prompt)
		if [[ -n $r ]]
		then
			echo " using %{$fg[green]%}$r%{$reset_color%}"
		fi
	fi
}

function exit_status_indicator
{
	echo "%(?.%{$fg[green]%};)%{$reset_color%}.%{$fg[red]%}%? :(%{$reset_color%})"
}

function prompt_char {
	git branch >/dev/null 2>/dev/null && echo "%{$fg_bold[green]%}±%{$reset_color%}" && return
	hg root >/dev/null 2>/dev/null && echo "%{$fg_bold[green]%}☿%{$reset_color%}" && return
	echo '𝄞'
}

PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}$(box_name)%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(rvm_prompt_info)$(hg_prompt_info)$(git_prompt_info)
$(exit_status_indicator) $(virtualenv_info)$(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function battery_charge() {
	echo $($ZSH/tools/battery_level.py) 2>/dev/null
}

RPROMPT='$(battery_charge)'
